CREATE DATABASE IF NOT EXISTS integral_system;
USE integral_system;
CREATE TABLE IF NOT EXISTS universities(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_university VARCHAR(100),
);

CREATE TABLE IF NOT EXISTS divisions(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_division VARCHAR(100),
);

CREATE TABLE IF NOT EXISTS degreess(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_degree VARCHAR(100),
    fk_division_id INT,
    CONSTRAINT fk_division_id FOREIGN KEY (fk_division_id) REFERENCES divisions(id)
);

CREATE TABLE IF NOT EXISTS subjects(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_subjects VARCHAR(100),
);

CREATE TABLE IF NOT EXISTS degreess_subjects(
    fk_degree_id INT,
    CONSTRAINT fk_degree_id FOREIGN KEY (fk_degree_id) REFERENCES deegres(id),
    fk_subject_id INT,
    CONSTRAINT fk_subject_id FOREIGN KEY (fk_subject_id) REFERENCES subjects(id)
);

CREATE TABLE IF NOT EXISTS resources(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_subject_id INT,
    CONSTRAINT fk_subject_id FOREIGN KEY (fk_subject_id) REFERENCES subjects(id)
);

CREATE TABLE IF NOT EXISTS prompts(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_teacher_id INT,
    CONSTRAINT fk_teacher_id FOREIGN KEY (fk_teacher_id) REFERENCES teachers(id)
);

CREATE TABLE IF NOT EXISTS teachers(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20) NOT NULL,
    credentials INT NOT NULL,
    pass VARCHAR(255) NOT NULL,
    fk_student_id INT,
    CONSTRAINT fk_student_id FOREIGN KEY (fk_student_id) REFERENCES students(id)
);

CREATE TABLE IF NOT EXISTS degreess_teachers(
    fk_degree_id INT,
    CONSTRAINT fk_degree_id FOREIGN KEY (fk_degree_id) REFERENCES deegres(id),
    fk_teacher_id INT,
    CONSTRAINT fk_teacher_id FOREIGN KEY (fk_teacher_id) REFERENCES teachers(id)
);

CREATE TABLE IF NOT EXISTS prompts_teachers(
    fk_prompt_id INT,
    CONSTRAINT fk_prompt_id FOREIGN KEY (fk_prompt_id) REFERENCES prompts(id),
    fk_teacher_id INT,
    CONSTRAINT fk_teacher_id FOREIGN KEY (fk_teacher_id) REFERENCES teachers(id)
);

CREATE TABLE IF NOT EXISTS students(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20) NOT NULL,
    enrollement DATE NOT NULL
    fk_degree_id INT,
    CONSTRAINT fk_degree_id FOREIGN KEY (fk_degree_id) REFERENCES deegres(id)
);
