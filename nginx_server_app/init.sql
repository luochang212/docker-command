CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    class_name VARCHAR(50),
    grade VARCHAR(10)
);

INSERT INTO students (name, class_name, grade) VALUES ('Alice', 'Class 1', 'A');
INSERT INTO students (name, class_name, grade) VALUES ('Bob', 'Class 2', 'B');
INSERT INTO students (name, class_name, grade) VALUES ('Charlie', 'Class 3', 'C');
