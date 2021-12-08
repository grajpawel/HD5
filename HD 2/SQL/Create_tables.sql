
CREATE TABLE service (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE client (
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
	email VARCHAR(255),
    PRIMARY KEY (phone)
);

CREATE TABLE worker (
    name VARCHAR(255) NOT NULL,
	surname VARCHAR(255) NOT NULL,
	login VARCHAR(255) NOT NULL,
	fk_salon INT,
	PRIMARY KEY (login));

CREATE TABLE appointment (
    id INT NOT NULL,
	date DATETIME NOT NULL,
	fk_salon INT,
	fk_klient VARCHAR(255),
	price DECIMAL(10 , 2 ) NOT NULL,
    rating DECIMAL(10 , 2 ),
    PRIMARY KEY (id)
);

CREATE TABLE execution (
	fk_service INT,
	fk_worker VARCHAR(255),
	fk_device INT,
	fk_visit INT,
	is_done BIT DEFAULT 0,
	review INT,
	price DECIMAL(10 , 2 ) NOT NULL);

CREATE TABLE salon (
	id INT NOT NULL,
	postcode VARCHAR(255),
	street VARCHAR(255),
	city VARCHAR(255),
	PRIMARY KEY (id));

CREATE TABLE device(
	id INT NOT NULL,
	fk_salon INT,
	state VARCHAR(255),
	service_date DATETIME,
	buy_date DATETIME,
	price DECIMAL(10 , 2 ) NOT NULL,
	PRIMARY KEY (id));

	
	
	





