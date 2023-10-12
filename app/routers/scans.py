from fastapi import APIRouter, Depends, HTTPException, status, File, UploadFile, Depends
import cloudinary
import cloudinary.uploader
import requests
from ..database import get_db
from sqlalchemy.orm import Session
from .. import schemas, models, utils, oauth2

router = APIRouter(
    prefix= "/scan",
    tags=["scan"],
)

cloudinary.config(
    cloud_name = "peterojo",
    api_key="329888361854121",
    api_secret="MS8z__QaqfZ9CqVA5HiNwTkO3xU"
    
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
    
    return {
        "scans": scans
    }
        
