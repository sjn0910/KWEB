CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `profile_image_link` VARCHAR(128) NOT NULL,
    `profile_message` VARCHAR(128) NOT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `joined_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL, 
    `creater` INT NOT NULL,
    `channel_link` VARCHAR(128) NOT NULL,
    `maximun_user` INT NOT NULL, 
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `created_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creater`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `contents` TEXT NOT NULL, 
    `creater` INT NOT NULL,
    `channel` INT NOT NULL,
    `created_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creater`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`)
    REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_data` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker` INT NOT NULL,
    `blockee` INT NOT NULL,
    `blocking_data` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocker`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blockee`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



