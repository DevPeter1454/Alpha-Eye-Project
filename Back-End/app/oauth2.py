from jose import JWTError, jwt
from datetime import datetime, timedelta
from . import schemas
from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from . import  database, models
from .config import settings
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login") 


SECRET_KEY = settings.secret_key
ALGORITHM = settings.algorithm
ACCESS_TOKEN_EXPIRE_MINUTES = settings.access_token_expire_minutes


def create_access_token(data:dict):
    to_encode = data.copy()
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp":expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    
    return encoded_jwt

def verify_token(token:str, credentials_exception):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        special_id: str = payload.get("special_id")
        id: int = payload.get("id")
        role: str = payload.get("role")
        if id is None:
            raise credentials_exception
        token_data = schemas.UserTokenData(special_id=special_id, id=id, role=role)
        return token_data
    except JWTError:
        raise credentials_exception
    

def get_current_user(token:str = Depends(oauth2_scheme), db:Session = Depends(database.get_db)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate":"Bearer"},
    )
    token_data = verify_token(token, credentials_exception)
    if token_data.role == "doctor":
        user = db.query(models.Doctor).filter(models.Doctor.id == token_data.id).first()
    if token_data.role == "hospital":
        user = db.query(models.Hospital).filter(models.Hospital.id == token_data.id).first()
    if token_data.role == "user":
        user = db.query(models.User).filter(models.User.id == token_data.id).first()
    if user is None:
        raise credentials_exception
    return user