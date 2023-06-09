Schema Query SQL :

CREATE DATABASE `miniproject1`;
USE `miniproject1`;

CREATE TABLE `roles` (
  `id` int unsigned PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(20) UNIQUE NOT NULL
);

CREATE TABLE `actors` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(100) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int unsigned NOT NULL,
  `is_verified` ENUM ('TRUE', 'FALSE') NOT NULL DEFAULT "FALSE",
  `is_active` ENUM ('TRUE', 'FALSE') NOT NULL DEFAULT "FALSE",
  `created_at` timestamp NOT NULL DEFAULT (now()),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE `customers` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `avatar` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT (now()),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE `register_approvals` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `super_admin_id` bigint unsigned,
  `admin_id` bigint unsigned,
  `status` varchar(20)
);

ALTER TABLE `actors` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `register_approvals` ADD FOREIGN KEY (`super_admin_id`) REFERENCES `actors` (`id`);

ALTER TABLE `register_approvals` ADD FOREIGN KEY (`admin_id`) REFERENCES `actors` (`id`);

INSERT INTO roles (id, name) VALUES (1, 'superadmin'), (2, 'admin');

INSERT INTO actors (username, password, role_id, is_verified, is_active) VALUES ('superadmin', 'password', 1, TRUE, TRUE);

CREATE USER 'superadmin'@'127.0.0.1' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON miniproject1.* TO 'superadmin'@'127.0.0.1';












