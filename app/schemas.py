from pydantic import BaseModel, EmailStr, UUID4
from datetime import datetime
from typing import Optional, List
class UserBase(BaseModel):
    firstname: str
    lastname: str
    age: int
    gender: str
    address: str
    city: str
    state_of_residence: str
    phone: str
    email: EmailStr
    role: str = "user"
    
class UserLogin(BaseModel):
    email: EmailStr
    password: str
    
class UserCreate(UserBase):
    password: str
    

class User(UserBase):
    id: int
    created_at: datetime
    updated_at: datetime
    special_id : Optional[str] = None
    
    
    class Config:
        from_attributes = True

class UserOut(BaseModel):
    id: int
    special_id : Optional[str] = None
    email: EmailStr
    firstname: str
    lastname: str
    
    class Config:
        from_attributes = True
    

class DoctorBase(BaseModel):
    firstname: str
    lastname: str
    gender: str
    license_number: str
    hospital_name: str
    email: EmailStr
    role: str = "doctor"
    
class DoctorCreate(DoctorBase):
    password: str

class DoctorLogin(BaseModel):
    email: EmailStr
    password: str

class DoctorOut(BaseModel):
    id: int
    email: EmailStr
    
    class Config:
        from_attributes = True

class Doctor(DoctorBase):
    id: int
    hospital_id: str
    created_at: datetime
    updated_at: datetime
    
    class Config:
        from_attributes = True
        
class PatientBase(BaseModel):
    firstname: str
    lastname: str
    age: int
    gender: str
    address: str
    city: str
    state_of_residence: str
    phone: str
    role: str = "patient"
    # special_id: Optional[str] = None
    # email: EmailStr
    
    

class PatientCreate(PatientBase):
    pass

class Patient(PatientBase):
    id: int
    created_at: datetime
    updated_at: datetime
    special_id:str
    
    class Config:
        from_attributes = True
 
class PatientsListResponse(BaseModel):
    patients: List[Patient]
    message: str
    status: str = "success"
    
    
    
    class Config:
        from_attributes = True
class PatientOut(PatientBase):
    id: int
    special_id: str
    
    class Config:
        from_attributes = True

class HospitalBase(BaseModel):
    hospital_name: str
    address: str
    city: str
    state: str
    role: str = "hospital"
    admin_email: EmailStr
    license_number: str
    logo: str 
    

class HospitalCreate(HospitalBase):
    password: str

class Hospital(HospitalBase):
    id: int
    created_at: datetime
    updated_at: datetime
    hospital_id: str
    
    class Config:
        from_attributes = True

class HospitalOut(HospitalBase):
    id: int
    hospital_id: str
    
    class Config:
        from_attributes = True

class PublicHospital(BaseModel):
    hospital_name: str
    address: str
    city: str
    state: str
    hospital_id: str
    
    class Config:
        from_attributes = True

class Token(BaseModel):
    access_token: str
    token_type: str
       
class UserTokenData(BaseModel):
    special_id: Optional[str] = None
    role: str = "user"
    id: Optional[int] = None
    
class DoctorTokenData(BaseModel):
    role: str = "doctor"
    id: Optional[int] = None
    license_number: Optional[str] = None    
    
class HospitalTokenData(BaseModel):
    role: str = "hospital"
    id: Optional[int] = None
    hospital_id: Optional[str] = None
    license_number: Optional[str] = None
    
class TokenUser(BaseModel):
    access_token:str
    token_type:str = "bearer"
    user: UserBase
    
    
# class Scan(BaseModel):
#     special_id: str
#     label_name: str
#     label_id: str
#     label_confidence: float
#     detected_conditions: str
#     severity: str
#     title: str
#     description: str
#     recommendation: str
#     created_at: datetime
#     updated_at: datetime
    
#     class Config:
#         from_attributes = True