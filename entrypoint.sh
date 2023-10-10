#!/bin/sh

# Wait for the PostgreSQL service to become available
./wait-for-it.sh postgres:5432 --timeout=60 -- echo "PostgreSQL is up"

# Apply Alembic migrations to create tables
alembic upgrade head

# Start your FastAPI application
# uvicorn app.main:app --host 0.0.0.0 --port 8000 
gunicorn -w 4 -k uvicorn.workers.UvicornWorker app.main:app