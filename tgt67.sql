
CREATE TABLE roles (
    id INT PRIMARY KEY,
    role_name VARCHAR(30)
);

CREATE TABLE contract_status (
    id INT PRIMARY KEY,
    status_name VARCHAR(30)
);

CREATE TABLE brands (
    id INT PRIMARY KEY,
    brand_name VARCHAR(30)
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(11),
    email VARCHAR(100),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE park (
    id INT PRIMARY KEY,
    city VARCHAR(50),
    address VARCHAR(50),
    working_hours VARCHAR(50),
    park_limited INT
);

CREATE TABLE cars (
    vin VARCHAR(17) PRIMARY KEY,
    brand_id INT,
    year_vipusk INT,
    probeg INT,
    number_car VARCHAR(9),
    FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE contract (
    id INT PRIMARY KEY,
    car_vin VARCHAR(17),
    users_id INT,
    pickup_park INT,
    return_park INT,
    start_day DATE,
    end_day DATE,
    status_id INT,
    FOREIGN KEY (car_vin) REFERENCES cars(vin),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (pickup_park) REFERENCES park(id),
    FOREIGN KEY (return_park) REFERENCES park(id),
    FOREIGN KEY (status_id) REFERENCES contract_status(id)
);

CREATE TABLE booking (
    id INT PRIMARY KEY,
    users_id INT,
    contract_id INT,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);


INSERT INTO roles VALUES
(1, 'Клиент'),
(2, 'Менеджер'),
(3, 'Администратор');

INSERT INTO contract_status VALUES
(1, 'активен'),
(2, 'завершен');

INSERT INTO brands VALUES
(1, 'Audi'),
(2, 'BMW');

INSERT INTO users VALUES
(1, 'Денис', 'Калугин', '89123456789', 'kalugin52@mail.ru', 1),
(2, 'Егор', 'Семенов', '89987654321', 'semenov67@mail.ru', 1),
(3, 'Степан', 'Карманов', '89031112233', 'daun6767@mail.ru', 2);

INSERT INTO park VALUES
(1, 'Москва', 'Тверская 12', '08:00-22:00', 40),
(2, 'Санкт-Петербург', 'Невский 45', '09:00-21:00', 25);

INSERT INTO cars VALUES
('WAUZZZ8K9BA123456', 1, 2021, 45000, 'А123ВС77'),
('WBA3A5C50DF123789', 2, 2020, 78000, 'В456ЕК99');

INSERT INTO contract VALUES
(1, 'WAUZZZ8K9BA123456', 1, 1, 1, '2026-11-10', '2026-11-14', 2),
(2, 'WBA3A5C50DF123789', 2, 2, 1, '2026-11-16', '2026-11-20', 1);

INSERT INTO booking VALUES
(1, 1, 1),
(2, 2, 2);
