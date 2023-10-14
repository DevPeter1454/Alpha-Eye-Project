from fastapi import APIRouter, Depends, HTTPException, status, File, UploadFile, Depends
import cloudinary
import cloudinary.uploader
import requests
from ..database import get_db
from sqlalchemy.orm import Session
from .. import schemas, models, utils, oauth2
from ..config import settings

router = APIRouter(
    prefix= "/scan",
    tags=["scan"],
)

cloudinary.config(
    cloud_name = f"{settings.cloud_name}",
    api_key=f"{settings.api_key}",
    api_secret=f"{settings.api_secret}"
)


@router.post("/upload", status_code=status.HTTP_201_CREATED)
async def upload_scan(file: UploadFile, current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    
    if current_user.role == "doctor" or current_user.role == "hospital":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    user = db.query(models.User).filter(models.User.id == current_user.id).first()
    
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    
    
    response = cloudinary.uploader.upload(file.file)
    
    url = 'https://www.nyckel.com/v1/functions/7hdsc8b5br345bz3/invoke'
    
    data = {
        "data": response['url']
    }
    
    response_from_external_api = requests.post(url, json=data)
    
    label_name = response_from_external_api.json()['labelName']
    
    label_id = response_from_external_api.json()['labelId']
    
    label_confidence = response_from_external_api.json()['confidence']
    
    if label_name == "Normal":
        if label_confidence < 0.8:
            scan_response = {
                "special_id": user.special_id,
                # "message": "Scan is not normal",
                "health_status": "Not Normal",
                "label_name": label_name,
                "label_id": label_id,
                "scan_id": utils.generate_scan_id(),
                "label_confidence": label_confidence * 100,
                "detected_conditions": "None",
                "severity": "None",   
            }
            
            new_scan = models.Scan(**scan_response, title = "None", description = "The scan is not too good for normal. The confidence level is less than 80%. ", recommendation = "It is advisable to see a doctor for further diagnosis")
            
            db.add(new_scan)
            
            db.commit()
            
            db.refresh(new_scan)
            
            return {
                "scan": new_scan,
                "detailed_description": {
                    "title": new_scan.title,
                    "description": new_scan.description,
                    "recommendation": new_scan.recommendation
                } 
            }
        else:
            scan_response = {
                "special_id": user.special_id,
                # "message": "Scan is normal",
                "health_status": "Normal",
                "label_name": label_name,
                "label_id": label_id,
                "scan_id": utils.generate_scan_id(),
                "label_confidence": label_confidence * 100,
                "detected_conditions": "None",
                "severity": "None",   
            }
            
            new_scan = models.Scan(**scan_response, title = "None", description = "The scan is good for normal. The confidence level is greater than 80%. ", recommendation = "It's good to always do a regular checkup. Please see a doctor for further diagnosis.")
            
            db.add(new_scan)
            
            db.commit()
            
            db.refresh(new_scan)
            
            return {
                "scan": new_scan,
                "detailed_description": {
                    "title": new_scan.title,
                    "description": new_scan.description,
                    "recommendation": new_scan.recommendation
                } 
            }
    if label_name == "Cataracts":
        if label_confidence < 0.70:
            scan_response = {
                "special_id": user.special_id,
                # "message": "Scan is normal",
                "health_status": "Not Normal",
                "label_name": label_name,
                "label_id": label_id,
                "scan_id": utils.generate_scan_id(),
                "label_confidence": label_confidence * 100,
                "detected_conditions": "Cataracts",
                "severity": "Mild",   
            }
            
            new_scan = models.Scan(**scan_response, title = "What are Cataracts?", description = "Cataracts are a common eye condition that often develops with age. They occur when the clear lens in your eye becomes cloudy, leading to blurred or dimmed vision. Cataracts can impact your daily life and well-being, making it essential to understand your specific condition and explore treatment options.", recommendation = "It is strongly recommended to schedule an appointment with an ophthalmologist for a comprehensive eye examination. They will assess the extent of your cataracts and discuss treatment options.")
            
            db.add(new_scan)
            
            db.commit()
            
            db.refresh(new_scan)
            
            return {
                "scan": new_scan,
                "detailed_description": {
                    "title": new_scan.title,
                    "description": new_scan.description,
                    "recommendation": new_scan.recommendation
                } 
            }
            
        else:
            scan_response = {
                "special_id": user.special_id,
                # "message": "Scan is normal",
                "health_status": "Not Normal",
                "label_name": label_name,
                "label_id": label_id,
                "scan_id": utils.generate_scan_id(),
                "label_confidence": label_confidence * 100,
                "detected_conditions": "Cataracts",
                "severity": "High",   
            }
            
            new_scan = models.Scan(**scan_response, title = "What are Cataracts?", description = "Cataracts are a common eye condition that often develops with age. They occur when the clear lens in your eye becomes cloudy, leading to blurred or dimmed vision. Cataracts can impact your daily life and well-being, making it essential to understand your specific condition and explore treatment options.", recommendation = "Your cataracts are in an advanced stage, affecting your vision significantly. This means that you may have trouble reading, driving, or performing other daily activities.Also you may experience blurred or cloudy vision. Difficulty seeing in low light conditions.Colors may appear faded. Glare from bright lights can be bothersome. It is strongly recommended to schedule an appointment with an ophthalmologist for a comprehensive eye examination. They will assess the extent of your cataracts and discuss treatment options.")
            
            db.add(new_scan)
            
            db.commit()
            
            db.refresh(new_scan)
            
            return {
                "scan": new_scan,
                "detailed_description": {
                    "title": new_scan.title,
                    "description": new_scan.description,
                    "recommendation": new_scan.recommendation
                } 
            }
            
            
@router.get("/history",status_code=status.HTTP_200_OK)
def get_user_scan_history(current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    
    if current_user.role == "doctor" or current_user.role == "hospital":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    user = db.query(models.User).filter(models.User.id == current_user.id).first()
    
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    
    scans = db.query(models.Scan).filter(models.Scan.special_id == user.special_id).all()
    
    all_scans = []
    
    for scan in scans:
        all_scans.append(
           {
                "scan": {
                    "special_id": user.special_id,
                    # "message": "Scan is normal",
                    "health_status": scan.health_status,
                    "label_name": scan.label_name,
                    "label_id": scan.label_id,
                    "scan_id": scan.scan_id,
                    "label_confidence": scan.label_confidence,
                    "detected_conditions": scan.detected_conditions,
                    "severity": scan.severity,
                    "title": scan.title,
                    "description": scan.description,
                    "recommendation": scan.recommendation,
                    "created_at": scan.created_at,
                    "updated_at": scan.updated_at,
                },
                "detailed_description": {
                    "title": scan.title,
                    "description": scan.description,
                    "recommendation": scan.recommendation
                } 
            }
            
        )
        
    
    return {
        "scans": all_scans
    }
        

@router.get("/history/{scan_id}", status_code=status.HTTP_200_OK)
def get_scan_by_scan_id(scan_id:str, current_user =Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    
    if current_user.role == "doctor" or current_user.role == "hospital":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    user = db.query(models.User).filter(models.User.id == current_user.id).first()
    
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    
    scan = db.query(models.Scan).filter(models.Scan.scan_id == scan_id).first()
    
    if scan is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Scan not found")
    
    return {
        "special_id": user.special_id,
        # "message": "Scan is normal",
        "health_status": scan.health_status,
        "label_name": scan.label_name,
        "label_id": scan.label_id,
        "scan_id": scan.scan_id,
        "label_confidence": scan.label_confidence,
        "detected_conditions": scan.detected_conditions,
        "severity": scan.severity,
        "title": scan.title,
        "description": scan.description,
        "recommendation": scan.recommendation,
        "created_at": scan.created_at,
        "updated_at": scan.updated_at,
        "detailed_description": {
            "title": scan.title,
            "description": scan.description,
            "recommendation": scan.recommendation
        } 
    }
    


@router.post("/doctor/upload/{patient_id}",status_code=status.HTTP_201_CREATED)
async def upload_scan_by_doctor(file: UploadFile,patient_id:str, current_user = Depends(oauth2.get_current_user), db:Session = Depends(get_db)):
    if current_user.role == "patient" or current_user.role == "user":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized")
    
    patient = db.query(models.Patient).filter(models.Patient.patient_id == patient_id).first()
    
    if patient is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Patient not found")
    
    response = cloudinary.uploader.upload(file.file)
    
    url = 'https://www.nyckel.com/v1/functions/1havh70pkqgnqmes/invoke'
    
    data = {
        "data": response['url']
    }
    
    response_from_external_api = requests.post(url, json=data)
    
    label_name = response_from_external_api.json()['labelName']
    
    label_id = response_from_external_api.json()['labelId']
    
    label_confidence = response_from_external_api.json()['confidence']
    
    return {
        "scan_details":{
            "condition": label_name,
            "confidence": label_confidence * 100,
            "label_id": label_id,
        },
        "patient_id": utils.patient_to_dict(patient)
    }
    
    
    
    
    
    
    
        