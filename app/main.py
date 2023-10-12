from fastapi import FastAPI
from .routers import doctors, auth, patients, users, hospitals, scans
from .database import engine
from . import models
from fastapi.middleware.cors import CORSMiddleware
# models.Base.metadata.create_all(bind=engine)

app = FastAPI()

origins = [
    "*"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(doctors.router)
app.include_router(users.router)
app.include_router(auth.router)
app.include_router(hospitals.router)
app.include_router(patients.router)
app.include_router(scans.router)

@app.get("/")
def root():
    return {"message": "server is running"}