from pydantic import BaseModel

class Student(BaseModel):
    id: int
    name: str
    class_name: str
    grade: str

    class Config:
        orm_mode = True
