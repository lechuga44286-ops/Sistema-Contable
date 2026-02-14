CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    account_name VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type ENUM('debit', 'credit'),
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES Accounts(id) ON DELETE CASCADE
);

CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE TransactionCategories (
    transaction_id INT,
    category_id INT,
    PRIMARY KEY (transaction_id, category_id),
    FOREIGN KEY (transaction_id) REFERENCES Transactions(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE
);