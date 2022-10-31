CREATE TABLE `students` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `year` INT NOT NULL,
    `major` VARCHAR(20) NOT NULL,
    `student_num` INT NOT NULL,
    `phone_num` VARCHAR(13) NOT NULL,
    `address` VARCHAR(80) NOT NULL,
    `credit` INT NOT NULL DEFAULT 0,
    `grade` DOUBLE NOT NULL DEFAULT 0.0,
    `is_attending` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
