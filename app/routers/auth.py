from fastapi import APIRouter, status, HTTPException, Response,Depends
from sqlalchemy.orm import Session
from .. import database, schemas, models, utils, oauth2
from fastapi.security import OAuth2PasswordRequestForm

router = APIRouter(
    prefix="/auth",
    tags=["Authentication"],
)

@router.post("/user/login",response_model=schemas.TokenUser,  status_code=status.HTTP_200_OK)
async def login_user(user_credentials: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(database.get_db)):
    user = db.query(models.User).filter(models.User.email == user_credentials.username).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Invalid Credentials")
    if not utils.verify(user_credentials.password, user.password):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Incorrect Password")
    access_token = oauth2.create_access_token(data={"special_id":user.special_id, "id":user.id, "role":"user"})
    
    user_to_dict = utils.user_to_dict(user)
    
    token_user_data = schemas.TokenUser(user= user_to_dict, token_type="bearer", access_token=access_token)
    
    return token_user_data
    
    # token_user_data = schemas.TokenUser(user= u  token_type="bearer", access_token=access_token)
    
    # return token_user_data

@router.post("/doctor/login",  status_code=status.HTTP_200_OK)
def login_doctor(doctor_credentials: OAuth2PasswordRequestForm = Depends(), db:Session = Depends(database.get_db)):
    doctor = db.query(models.Doctor).filter(models.Doctor.email == doctor_credentials.username).first()
    if doctor is None:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Invalid Credentials")
    if not utils.verify(doctor_credentials.password, doctor.password):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Incorrect Password")
    access_token = oauth2.create_access_token(data={"id":doctor.id, "role":"doctor"})
    
    doctor_to_dict = utils.doctor_to_dict(doctor)
    
    token_doctor_data = schemas.TokenDoctors(token_type="bearer", access_token=access_token, doctor =doctor_to_dict)
    
    return token_doctor_data

@router.post("/hospital/login", response_model=schemas.Token, status_code=status.HTTP_200_OK)
def login_hospital(hospital_credentials:OAuth2PasswordRequestForm = Depends(), db:Session = Depends(database.get_db)):
    hospital = db.query(models.Hospital).filter(models.Hospital.admin_email == hospital_credentials.username).first()
    if hospital is None:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Invalid Credentials")
    
    
    
    if not utils.verify(hospital_credentials.password, hospital.password):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Incorrect Password")
    access_token = oauth2.create_access_token(data={"id":hospital.id, "role":"hospital"})
    return {"access_token":access_token, "token_type":"bearer"}