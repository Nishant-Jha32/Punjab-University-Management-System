-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema punjab_university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema punjab_university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `punjab_university` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `punjab_university` ;

-- -----------------------------------------------------
-- Table `punjab_university`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`book` (
  `isbn` VARCHAR(20) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `author` VARCHAR(100) NULL DEFAULT NULL,
  `publication_year` YEAR NULL DEFAULT NULL,
  `copies_available` INT NULL DEFAULT '0',
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`department` (
  `dept_id` INT NOT NULL,
  `dept_name` VARCHAR(100) NOT NULL,
  `building` VARCHAR(50) NULL DEFAULT NULL,
  `budget` DECIMAL(12,2) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE INDEX `dept_name` (`dept_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`course` (
  `course_code` VARCHAR(15) NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `credits` INT NULL DEFAULT NULL,
  `dept_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`course_code`),
  INDEX `dept_id` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `course_ibfk_1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `punjab_university`.`department` (`dept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`student` (
  `student_id` BIGINT NOT NULL,
  `roll_number` VARCHAR(20) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `enrollment_year` YEAR NULL DEFAULT NULL,
  `major_dept_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `roll_number` (`roll_number` ASC) VISIBLE,
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `major_dept_id` (`major_dept_id` ASC) VISIBLE,
  CONSTRAINT `student_ibfk_1`
    FOREIGN KEY (`major_dept_id`)
    REFERENCES `punjab_university`.`department` (`dept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`exam_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`exam_schedule` (
  `schedule_id` BIGINT NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(15) NOT NULL,
  `exam_date` DATETIME NOT NULL,
  `exam_type` ENUM('Midterm', 'Final', 'Practical', 'Sessional') NOT NULL,
  `max_marks` INT NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  INDEX `course_code` (`course_code` ASC) VISIBLE,
  CONSTRAINT `exam_schedule_ibfk_1`
    FOREIGN KEY (`course_code`)
    REFERENCES `punjab_university`.`course` (`course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`exam_result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`exam_result` (
  `result_id` BIGINT NOT NULL AUTO_INCREMENT,
  `student_id` BIGINT NOT NULL,
  `schedule_id` BIGINT NOT NULL,
  `marks_obtained` INT NULL DEFAULT NULL,
  `status` ENUM('Pass', 'Fail', 'Absent') NULL DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  UNIQUE INDEX `student_id` (`student_id` ASC, `schedule_id` ASC) VISIBLE,
  INDEX `schedule_id` (`schedule_id` ASC) VISIBLE,
  CONSTRAINT `exam_result_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `punjab_university`.`student` (`student_id`),
  CONSTRAINT `exam_result_ibfk_2`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `punjab_university`.`exam_schedule` (`schedule_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`faculty` (
  `faculty_id` BIGINT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `hire_date` DATE NULL DEFAULT NULL,
  `dept_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `dept_id` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `faculty_ibfk_1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `punjab_university`.`department` (`dept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`fees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`fees` (
  `fee_id` BIGINT NOT NULL AUTO_INCREMENT,
  `student_id` BIGINT NOT NULL,
  `fee_type` VARCHAR(50) NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `due_date` DATE NULL DEFAULT NULL,
  `status` ENUM('Pending', 'Paid', 'Waived') NOT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  INDEX `student_id` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fees_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `punjab_university`.`student` (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`hostel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`hostel` (
  `hostel_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `type` ENUM('Male', 'Female', 'Family') NOT NULL,
  `capacity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`hostel_id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`library_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`library_transaction` (
  `transaction_id` BIGINT NOT NULL AUTO_INCREMENT,
  `student_id` BIGINT NOT NULL,
  `isbn` VARCHAR(20) NOT NULL,
  `issue_date` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `return_date` DATE NULL DEFAULT NULL,
  `fine_amount` DECIMAL(8,2) NULL DEFAULT '0.00',
  PRIMARY KEY (`transaction_id`),
  INDEX `student_id` (`student_id` ASC) VISIBLE,
  INDEX `isbn` (`isbn` ASC) VISIBLE,
  CONSTRAINT `library_transaction_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `punjab_university`.`student` (`student_id`),
  CONSTRAINT `library_transaction_ibfk_2`
    FOREIGN KEY (`isbn`)
    REFERENCES `punjab_university`.`book` (`isbn`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(15) NOT NULL,
  `semester` ENUM('Fall', 'Spring', 'Summer') NOT NULL,
  `year` YEAR NOT NULL,
  `faculty_id` BIGINT NULL DEFAULT NULL,
  `room_number` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE INDEX `course_code` (`course_code` ASC, `semester` ASC, `year` ASC) VISIBLE,
  INDEX `faculty_id` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `section_ibfk_1`
    FOREIGN KEY (`course_code`)
    REFERENCES `punjab_university`.`course` (`course_code`),
  CONSTRAINT `section_ibfk_2`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `punjab_university`.`faculty` (`faculty_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`registration` (
  `student_id` BIGINT NOT NULL,
  `section_id` INT NOT NULL,
  `grade` VARCHAR(2) NULL DEFAULT NULL,
  `reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `section_id` (`section_id` ASC) VISIBLE,
  CONSTRAINT `registration_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `punjab_university`.`student` (`student_id`),
  CONSTRAINT `registration_ibfk_2`
    FOREIGN KEY (`section_id`)
    REFERENCES `punjab_university`.`section` (`section_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `punjab_university`.`room_allocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `punjab_university`.`room_allocation` (
  `allocation_id` BIGINT NOT NULL AUTO_INCREMENT,
  `student_id` BIGINT NOT NULL,
  `hostel_id` INT NOT NULL,
  `room_number` VARCHAR(10) NOT NULL,
  `check_in_date` DATE NOT NULL,
  `check_out_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`allocation_id`),
  UNIQUE INDEX `student_id` (`student_id` ASC) VISIBLE,
  INDEX `hostel_id` (`hostel_id` ASC) VISIBLE,
  CONSTRAINT `room_allocation_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `punjab_university`.`student` (`student_id`),
  CONSTRAINT `room_allocation_ibfk_2`
    FOREIGN KEY (`hostel_id`)
    REFERENCES `punjab_university`.`hostel` (`hostel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
