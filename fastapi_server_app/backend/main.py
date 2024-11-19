from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Student
from pydantic import BaseModel

app = FastAPI()

class StudentResponse(BaseModel):
    id: int
    name: str
    class_name: str
    score: int

@app.get("/students/{student_id}", response_model=StudentResponse)
def get_student(student_id: int, db: Session = Depends(get_db)):
    student = db.query(Student).filter(Student.id == student_id).first()
    if not student:
        raise HTTPException(status_code=404, detail="Student not found")
    return {
        "id": student.id,
        "name": student.name,
        "class_name": student.class_name,
        "score": student.score,
    }