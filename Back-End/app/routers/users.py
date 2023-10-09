from fastapi import APIRouter, status, HTTPException, Response,Depends
from .. import schemas, models, utils, oauth2
from ..database import get_db
from sqlalchemy.orm import Session
from typing import List

router = APIRouter(
    prefix="/users",
    tags=["users"],
)

@router.get("/", status_code=status.HTTP_200_OK, response_model=List[schemas.User])
def get_users(current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    print(current_user.role)
    if current_user.role == "hospital" or current_user.role == "doctor":
        users = db.query(models.User).all()
        return users
    else:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    

@router.get("/current_user", status_code=status.HTTP_200_OK, response_model=schemas.User)
def get_current_user_details(current_user= Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    if current_user.role == "doctor" or current_user.role == "hospital":
       raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    user = db.query(models.User).filter(models.User.id == current_user.id).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    return user
   


@router.post("/create", status_code=status.HTTP_201_CREATED, response_model=schemas.UserOut)
def create_users(user: schemas.UserCreate, db:Session = Depends(get_db)):
    
    old_user = db.query(models.User).filter(models.User.email == user.email).first()
    if old_user is not None:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Email already registered")
    
    user.password = utils.hash(user.password)
    
    special_id = utils.generate_special_id()
    
    new_user = models.User(special_id= special_id,**user.model_dump())
    
    db.add(new_user)
    
    db.commit()
    
    db.refresh(new_user)
    
    return new_user


# @router.get("/{special_id}", status_code= status.HTTP_200_OK, response_model=schemas.User)
# def get_user_with_special_id(special_id: str, current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
#     print(current_user.role)
    
#     if current_user.role == "doctor" or current_user.role == "hospital":
       
    
#         user = db.query(models.User).filter(models.User.special_id == special_id).first()
#         if user is None:
#             raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
#         return user
#     else:
#         raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    

@router.put("/update/{special_id}", status_code=status.HTTP_202_ACCEPTED, response_model=schemas.User)
def update_user_details(special_id:str,user: schemas.UserCreate, db: Session = Depends(get_db), current_user = Depends(oauth2.get_current_user)):
    if current_user.role == "doctor" or current_user.role == "hospital":
           raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    user_query = db.query(models.User).filter(models.User.special_id == special_id)
    user_first = user_query.first()
    if user_first is None:
         raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    if current_user.id != user_first.id:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    user_query.update(user.model_dump(), synchronize_session = False)
    db.commit()
    return user_query.first()
    

@router.delete("/delete/{special_id}", status_code=status.HTTP_202_ACCEPTED)
def delete_user_account(special_id:str,db: Session = Depends(get_db), current_user = Depends(oauth2.get_current_user)):
    if current_user.role == "doctor" or current_user.role == "hospital":
           raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    user = db.query(models.User).filter(models.User.special_id == special_id).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    if current_user.id != user.id:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    db.delete(user)
    db.commit()
    return {"message":"User deleted successfully"}
    
