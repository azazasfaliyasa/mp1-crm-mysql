schema query sql :

CREATE TABLE role (
       id INT UNSIGNED,
       Role_name VARCHAR(255)
     );

CREATE TABLE actors (
    Id BIGINT UNSIGNED,
    Username VARCHAR(255),
    Password VARCHAR(255),
    Role_id INT UNSIGNED,
    Verified ENUM('true', 'false'),
    Active ENUM('true', 'false'),
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE customer (
    id BIGINT UNSIGNED,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    Avatar VARCHAR(255),
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE register_approval (
    id BIGINT UNSIGNED,
    admin_id BIGINT UNSIGNED,
    super_admin_id BIGINT UNSIGNED,
    status VARCHAR(255)
);

 ALTER TABLE role
 ADD PRIMARY KEY (id);

 ALTER TABLE actors
 ADD PRIMARY KEY (id);

 ALTER TABLE actors
 ADD FOREIGN KEY (Role_id) REFERENCES role(id);

 ALTER TABLE register_approval
 ADD FOREIGN KEY (admin_id) REFERENCES actors(id);

ALTER TABLE register_approval
 ADD FOREIGN KEY (super_admin_id) REFERENCES actors(id);

INSERT INTO actors (Id, Username, Password, Role_id, Verified, Active, Created_at, Updated_at)
VALUES (1, 'superadmin', '1234', 1, 'true', 'true', NOW(), NOW());


INSERT INTO actors (Id, Username, Password, Role_id, Verified, Active, Created_at, Updated_at)
VALUES (1, 'admin', 'admin123', 1, 'true', 'true', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO actors (Id, Username, Password, Role_id, Verified, Active, Created_at, Updated_at)
VALUES (2, 'superadmin', 'superadmin123', 2, 'true', 'true', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

GRANT ALL PRIVILEGES ON azaz_mp1.actors TO 'superadmin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON actors TO 'admin'@'localhost';

-- Membuat pengguna MySQL untuk super admin
CREATE USER 'superadmin'@'127.0.0.1' IDENTIFIED BY 'password';

-- Memberikan hak akses super admin ke pengguna
GRANT ALL PRIVILEGES ON *.* TO 'superadmin'@'127.0.0.1' WITH GRANT OPTION;

-- Mengaktifkan perubahan hak akses
FLUSH PRIVILEGES;









