from passlib.context import CryptContext
from random import randint

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def hash(password:str):
    return pwd_context.hash(password)

def verify(password:str, hashed:str):
    return pwd_context.verify(password, hashed)

def generate_special_id():
    random_value = str(randint(0, 999999)).zfill(6)
    special_id = f"Alpha-Eye {random_value}"
    return special_id

def generate_hospital_id():
    random_value = str(randint(0, 999999)).zfill(6)
    hospital_id = f"Alpha-Hospital {random_value}"
    return hospital_id

def patient_to_dict(patient):
    return {
        column.key: getattr(patient, column.key)
        for column in patient.__table__.columns
    }
    
def dict_to_patient(patient, data):
    for key, value in data.items():
        setattr(patient, key, value)
    return patient

def user_to_dict(user):
    return {
        column.key: getattr(user, column.key)
        for column in user.__table__.columns
    }
    
def dict_to_user(user, data):
    for key, value in data.items():
        setattr(user, key, value)
    return user