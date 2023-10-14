from fastapi import APIRouter, status, HTTPException, Response,Depends
from .. import schemas, models, utils, oauth2
from ..database import get_db
from sqlalchemy.orm import Session
from typing import List
from sqlalchemy import func


router = APIRouter(
    prefix="/hospitals",
    tags=["hospitals"],
)

@router.get("/all", status_code=status.HTTP_200_OK, response_model=List[schemas.Hospital])
def get_Hospitals(current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    print("here")
    
    if current_user.role == "doctor" or current_user.role == "hospital":
        hospitals = db.query(models.Hospital).all()
        
        return hospitals
    else:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")

@router.post("/create", status_code=status.HTTP_201_CREATED, response_model=schemas.HospitalOut)
def create_hospital(hospital:schemas.HospitalCreate ,db: Session = Depends(get_db)):
        
        old_hospital = db.query(models.Hospital).filter(models.Hospital.admin_email == hospital.admin_email,func.lower(models.Hospital.hospital_name)  == hospital.hospital_name.lower()).first()
        if old_hospital is not None:
            raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Hospital already registered")
        
        hospital.password = utils.hash(hospital.password)
        
        hospital_id = utils.generate_hospital_id()
        
        hospital.hospital_name = hospital.hospital_name.strip()
        
        new_hospital = models.Hospital(hospital_id = hospital_id,**hospital.model_dump())
        
        db.add(new_hospital)
        db.commit()
        db.refresh(new_hospital)
        
        return new_hospital        

@router.get("/{hospital_id}", status_code= status.HTTP_200_OK, response_model=schemas.Hospital)
def get_hospital_with_special_id(hospital_id: str, current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    
    if current_user.role != "hospital":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    hospital = db.query(models.Hospital).filter(models.Hospital.hospital_id == hospital_id).first()
    if hospital is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Hospital not found")
    return hospital
        
@router.get("/city/{city}", status_code= status.HTTP_200_OK, response_model=List[schemas.PublicHospital])
def get_hospitals_by_city(city:str, db: Session = Depends(get_db)):
    print('here')
    hospitals = db.query(models.Hospital).filter(func.lower(models.Hospital.city) == city.lower()).all()
    return hospitals

@router.get("/state/{state}", status_code= status.HTTP_200_OK)
def get_hospitals_by_state(state:str, db: Session = Depends(get_db)):
    print('here')
    hospitals = db.query(models.Hospital).filter(func.lower(models.Hospital.state) == state.lower()).all()
    
    all_hospitals= []
    
    for hospital in hospitals:
        all_hospitals.append({
            
                "hospital_name": hospital.hospital_name,
                "address": hospital.address,
                "city": hospital.city,
                "state": hospital.state,
                "hospital_id": hospital.hospital_id,
                "logo": hospital.logo    
        })
    
    # print(all_hospitals)
    
    return {
        "hospitals": all_hospitals
    }