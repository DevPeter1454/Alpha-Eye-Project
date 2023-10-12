from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    database_hostname:str = 'localhost'
    database_port:str = '5432'
    database_name:str = 'twitter'
    database_password:str = 'password'
    database_username:str = 'postgres'
    secret_key:str = 'secret_key'
    algorithm:str = 'sha256'
    access_token_expire_minutes:int = 60
    cloud_name :str= 'cloud_name'
    api_key:str = 'api_key'
    api_secret:str= "api_secret"
    
    class Config:
        env_file = ".env"
        
    
settings = Settings()
