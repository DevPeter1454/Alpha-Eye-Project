from fastapi import APIRouter, status, HTTPException, Response,Depends
from .. import schemas, models, utils, oauth2
from ..database import get_db
from sqlalchemy.orm import Session



router = APIRouter(
    prefix="/doctors",
    tags=["doctors"],
)

@router.get("/all")
def get_doctors():
    return {"message": "GET doctors"}

@router.post("/create", status_code=status.HTTP_201_CREATED, response_model=schemas.DoctorOut)
def create_doctor(doctor:schemas.DoctorCreate, db:Session = Depends(get_db), current_user = Depends(oauth2.get_current_user)):
    print(doctor.firstname)
    if current_user.role != "hospital":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    hospital = db.query(models.Hospital).filter(models.Hospital.id == current_user.id).first()
    
    print(hospital.hospital_name)
    
    if hospital is None or hospital.hospital_name != doctor.hospital_name:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Hospital not found")
    
    old_doctor = db.query(models.Doctor).filter(models.Doctor.email == doctor.email).first()
    if old_doctor is not None:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Email already registered")
    
    doctor.password = utils.hash(doctor.password)
    
    new_doctor = models.Doctor(**doctor.model_dump())
    
    db.add(new_doctor)
    db.commit()
    db.refresh(new_doctor)
    
    return new_doctor

@router.get("/current_user", status_code=status.HTTP_200_OK, response_model=schemas.Doctor)
def get_current_user_details(current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    if current_user.role != "doctor":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    doctor = db.query(models.Doctor).filter(models.Doctor.id == current_user.id).first()
    if doctor is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Doctor not found")
    return doctor