from fastapi import FastAPI
from .routers import doctors, auth, patients, users, hospitals
from .database import engine
from . import models

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(doctors.router)
app.include_router(users.router)
app.include_router(auth.router)
app.include_router(hospitals.router)
app.include_router(patients.router)

@app.get("/")
def root():
    return {"message": "server is running"}