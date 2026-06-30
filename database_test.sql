CREATE SCHEMA customer_segmentation_db;

USE customer_segmentation_db;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL,
    country VARCHAR(50),
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

CREATE TABLE user_activity (
    user_id INT PRIMARY KEY,
    last_login_date DATETIME NOT NULL,
    feature_usage_count INT NOT NULL,
    account_type ENUM('Free','Premium','Enterprise') NOT NULL,

    CONSTRAINT fk_activity_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    transaction_date DATETIME NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    platform ENUM('Web','Android','iOS') NOT NULL,

    CONSTRAINT fk_transaction_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE user_preferences (
    user_id INT PRIMARY KEY,
    communication_preference ENUM('Email','SMS','Push') NOT NULL,
    interface_theme ENUM('Light','Dark') NOT NULL,
    notification_settings ENUM('Enabled','Disabled') NOT NULL,

    CONSTRAINT fk_preference_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);



