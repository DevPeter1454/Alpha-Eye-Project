from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, UniqueConstraint
from sqlalchemy.orm import relationship
from sqlalchemy.sql.expression import null, text
from sqlalchemy.sql.sqltypes import TIMESTAMP

from .database import Base


class User(Base):
    __tablename__ = 'users'
    id = Column(Integer,primary_key=True, index=True, nullable=False)
    firstname = Column(String, nullable=False)
    lastname = Column(String, nullable=False)
    age = Column(Integer, nullable=False)
    gender = Column(String, nullable=False)
    address = Column(String, nullable=False)
    phone = Column(String, nullable=False)
    city = Column(String, nullable=False)
    state_of_residence = Column(String, nullable=False)
    email = Column(String, nullable=False)
    password = Column(String, nullable=False)
    role = Column(String, nullable=False, default="user")
    created_at = Column(TIMESTAMP, server_default=text('NOW()'))
    updated_at = Column(TIMESTAMP, server_default=text('NOW()'), onupdate=text('NOW()'))
    special_id = Column(String, nullable=True, )
    patients = relationship("Patient", back_populates="user")
    
     # Add a unique constraint to the special_id column
    __table_args__ = (
        UniqueConstraint('special_id', name='unique_special_id'),
    )
    

class Doctor(Base):
    __tablename__= "doctors"
    id = Column(Integer, nullable=False, index= True, primary_key=True)
    firstname = Column(String, nullable=False)
    lastname = Column(String, nullable=False)
    gender = Column(String, nullable=False)
    license_number = Column(String, nullable=False)
    # hospital_name = Column(String, nullable=False)
    email = Column(String, nullable=False)
    password = Column(String, nullable=False)
    role = Column(String, nullable=False, default="doctor")
    created_at = Column(TIMESTAMP, server_default=text('NOW()'))
    updated_at = Column(TIMESTAMP, server_default=text('NOW()'), onupdate=text('NOW()'))
    hospital_name = Column(String, ForeignKey("hospitals.hospital_name", ondelete="CASCADE"), nullable=False)
    # Establish the back-reference to the Hospital table
    hospital = relationship("Hospital", back_populates="doctors")
    
class Patient(Base):
    __tablename__ = "patients"
    id = Column(Integer, nullable=False, index=True, primary_key=True)
    firstname = Column(String, nullable=False)
    lastname = Column(String, nullable=False)
    age = Column(Integer, nullable=False)
    gender = Column(String, nullable=False)
    address = Column(String, nullable=False)
    phone = Column(String, nullable=False)
    city = Column(String, nullable=False)
    state_of_residence = Column(String, nullable=False)
    role = Column(String, nullable=False, default="patient")
    created_at = Column(TIMESTAMP, server_default=text('NOW()'))
    updated_at = Column(TIMESTAMP, server_default=text('NOW()'), onupdate=text('NOW()'))    
    special_id = Column(String,ForeignKey("users.special_id"),nullable=False, )
    hospital_id = Column(String,ForeignKey("hospitals.hospital_id"),nullable=False)
    # Establish the back-reference to the Hospital table
    hospital = relationship("Hospital", back_populates="patients")
    # Establish the back-reference to the User table
    user = relationship("User", back_populates="patients" )
    
    __table_args__ =(
        # UniqueConstraint('phone', name='unique_phone'),
    )
    

class Hospital(Base):
    __tablename__ = "hospitals"
    id = Column(Integer, nullable=False, index=True, primary_key=True)
    hospital_name = Column(String, nullable=False)
    # is_approved to show if an hospital's details has been approved by the admin
    is_approved = Column(Boolean, nullable=False, default=False)
    logo = Column(String, nullable=False)
    address = Column(String, nullable=False)
    city = Column(String, nullable=False)
    state = Column(String, nullable=False)
    role = Column(String, nullable=False, default="hospital")
    created_at = Column(TIMESTAMP, server_default=text('NOW()'))
    lga = Column(String, nullable=False)
    updated_at = Column(TIMESTAMP, server_default=text('NOW()'), onupdate=text('NOW()'))    
    admin_email = Column(String, nullable=False)
    password = Column(String, nullable=False)
    license_number = Column(String, nullable=False)
    hospital_id = Column(String, nullable=False, unique = True)
    doctors = relationship("Doctor", primaryjoin="Hospital.hospital_name == Doctor.hospital_name", back_populates="hospital")
    patients = relationship("Patient", primaryjoin="Hospital.hospital_id == Patient.hospital_id", back_populates="hospital")
    
    
    
    __table_args__ = (
        UniqueConstraint('hospital_name', name='unique_hospital_name'),
    )


class Scan(Base):
    __tablename__ = "scans"
    label_name = Column(String, nullable=False)
    label_id = Column(String, nullable=False)
    scan_id = Column(String, nullable=False, index=True, primary_key=True)
    label_confidence = Column(Integer, nullable=False)
    detected_conditions = Column(String, nullable=False)
    severity = Column(String, nullable=False)
    health_status = Column(String, nullable =False)
    # detailed_description = Column(String, nullable=False)
    title = Column(String, nullable=False)
    description = Column(String, nullable=False)
    recommendation = Column(String, nullable=False)
    special_id = Column(String, ForeignKey("users.special_id"), nullable=False)
    created_at = Column(TIMESTAMP, server_default=text('NOW()'))
    updated_at = Column(TIMESTAMP, server_default=text('NOW()'), onupdate=text('NOW()'))
    
    
# class DoctorScan(Base):
#     __tablename__ = "doctor_scans"
#     id = Column(Integer, nullable=False, index=True, primary_key=True)
#     doctor_id = Column(String, ForeignKey("doctors.id"), nullable=False)
#     scan_id = Column(String, ForeignKey("scans.scan_id"), nullable=False)
#     created_at = Column(TIMESTAMP, server_default=text('NOW()'))
#     label_id = Column(String, nullable=False)
#     label_name = Column(String, nullable=False)
#     label_confidence = Column(Integer, nullable=False)
#     detected_conditions = Column(String, nullable=False)
#     severity = Column(String, nullable=False) 
    