from fastapi import APIRouter, status, HTTPException, Response,Depends
from .. import schemas, models, utils, oauth2
from ..database import get_db
from sqlalchemy.orm import Session
from typing import List

router = APIRouter(
    prefix="/patients",
    tags=["patients"],
)

@router.get("/all", status_code=status.HTTP_200_OK,response_model=schemas.PatientsListResponse)
def get_Hospital_Patients(db: Session = Depends(get_db), current_user = Depends(oauth2.get_current_user)):
        print(current_user.hospital_id)
        if current_user.role != "hospital":
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
        
        
        # patients = db.query(models.Patient).join(models.Hospital, models.Hospital.hospital_id == models.Patient.hospital_id, isouter=False).group_by(models.Patient.id).all()
        
        patients = db.query(models.Patient).filter(models.Patient.hospital_id == current_user.hospital_id).all()
        
        response_model = schemas.PatientsListResponse(patients=patients, message="Patients fetched successfully")
        
        return response_model
    
@router.post("/create", status_code=status.HTTP_201_CREATED)
def create_patient(patient: schemas.PatientCreate,db: Session= Depends(get_db),  current_user = Depends(oauth2.get_current_user)):
    print('here')
    # if current_user.role != "hospital" or current_user.role != "doctor":
    #     raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    
    old_patient = db.query(models.Patient).filter(models.Patient.phone == patient.phone).first()
    if old_patient is not None:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Patient already registered")
    
    # patient.password = utils.hash(patient.password)
    special_id = utils.generate_special_id()
    hospital_id = current_user.hospital_id
    
    new_patient = models.Patient(special_id = special_id,hospital_id = hospital_id,**patient.model_dump())
    
    db.add(new_patient)
    db.commit()
    db.refresh(new_patient)
    
    return new_patient
        
        
@router.post("/create/{special_id}", status_code=status.HTTP_201_CREATED, )
def create_patient_with_special_id(special_id:str, db: Session = Depends(get_db), current_user = Depends(oauth2.get_current_user)):
        
        if current_user.role == "hospital" or current_user.role == "doctor":
            
        
            patient = db.query(models.User).filter(models.User.special_id == special_id).first()
            
        
            if patient is None:
                raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
            
            # print(utils.patient_to_dict(patient))
            
            patient = utils.patient_to_dict(patient)
            
            patient['role']  = 'patient'
            patient['hospital_id'] = current_user.hospital_id
            del[patient['password']]
            del[patient['email']]
            del[patient['id']]
            print(patient)
            
            new_patient = models.Patient()
            new_patient = utils.dict_to_patient(new_patient, patient)
            
            db.add(new_patient)
            db.commit()
            db.refresh(new_patient)
            
            return new_patient
        
            # patient.password = utils.hash(patient.password)
        
            # new_patient = models.Patient(special_id = special_id,**patient.model_dump())
        
            # db.add(new_patient)
        
            # db.commit()
        
            # db.refresh(new_patient)
        
            # return new_patient
        
        else:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    