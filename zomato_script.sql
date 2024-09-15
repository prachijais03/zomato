/*
	CREATE A DATABASE SCHEMA FOR ZOMATO
*/
SHOW DATABASES;
CREATE DATABASE zomato;
USE zomato;

/*

-- NOT NEEDED ANYMORE 

CREATE TABLE customer_profile (
	cid int AUTO_INCREMENT PRIMARY KEY,
    cname varchar(50) NOT NULL,
    cdob date,
    cmob decimal(10) NOT NULL,
    cemail varchar(100) NOT NULL,
    cgender enum('MALE', 'FEMALE', 'DO NOT WANT TO SPECIFY') NOT NULL
) AUTO_INCREMENT=10000;

Alter Table Customer_profile Drop column cname;
Alter Table Customer_profile Drop column cdob;
Alter Table Customer_profile Drop column cmob;
Alter Table Customer_profile Drop column cemail;
Alter Table Customer_profile Drop column cgender;
desc customer_profile;

alter table customer_profile add column profileid int;
alter table customer_profile add constraint fk_customer_profile foreign key(profileid) references profile(pid);

drop table customer_profile;

select * from customer_profile;

SHOW TABLES;
DESCRIBE customer_profile;

ALTER TABLE customer_profile MODIFY COLUMN cmob BIGINT;


INSERT INTO customer_profile (cname, cdob, cmob, cemail, cgender) VALUES 
	('John Doe', '1990-05-15', 8984984345, 'john.doe@example.com', 'MALE'),
    ('Jane Smith', '1985-09-20', 9876354678, 'jane.smith@example.com', 'FEMALE'),
    ('Alex Lee', '2000-03-10', 3764736476, 'alex.lee@example.com', 'DO NOT WANT TO SPECIFY'),
    ('Michael Brown', '1978-11-25', 9874635148, 'michael.brown@example.com', 'MALE'),
    ('Emily Johnson', '1995-07-12', 9874615748, 'emily.johnson@example.com', 'FEMALE'),
    ('Taylor Rodriguez', '1989-02-28', 9824635748, 'taylor.rodriguez@example.com', 'DO NOT WANT TO SPECIFY'),
    ('David White', '1982-08-05', 9874635248, 'david.white@example.com', 'MALE'),
    ('Olivia Garcia', '1998-04-18', 9874615748, 'olivia.garcia@example.com', 'FEMALE'),
    ('Jordan Kim', '1993-12-03', 9874635718, 'jordan.kim@example.com', 'DO NOT WANT TO SPECIFY'),
    ('Christopher Martinez', '1987-01-22', 9874135748, 'chris.martinez@example.com', 'MALE');

SELECT * FROM customer_profile;

CREATE TABLE owner_profile (
	oid int primary key auto_increment,
    oname varchar(50),
    odob date,
    omob bigint,
    oemail varchar(100),
    ogender enum('MALE', 'FEMALE', 'DO NOT WANT TO SPECIFY') NOT NULL
);
*/


create table address (
	addressId int primary key auto_increment,
    line1 varchar(100),
    line2 varchar(100),
    line3 varchar(100),
    city varchar(20),
    state varchar(20),
    pincode varchar(6)
) auto_increment=100;

create table profile (
	pid int auto_increment primary key,
	pname varchar(50) NOT NULL,
    pdob date,
    pmob decimal(10) NOT NULL,
    pemail varchar(100) NOT NULL,
    pgender enum('MALE', 'FEMALE', 'DO NOT WANT TO SPECIFY') NOT NULL,
    ptype enum('CUSTOMER', 'OWNER', 'DELIVERY BOY') NOT NULL
) auto_increment=10000;

describe profile;
alter table profile add column addressId int;
alter table profile add constraint fk_profile_address foreign key(addressId) references address(addressId);


-- Insert address 1
INSERT INTO address (line1, line2, line3, city, state, pincode)
VALUES ('123 Main Street', 'Apt 4B', NULL, 'Metropolis', 'CA', '12345');

-- Insert address 2
INSERT INTO address (line1, line2, line3, city, state, pincode)
VALUES ('456 Elm Avenue', NULL, NULL, 'Smalltown', 'NY', '54321');

select * from address;

-- Insert a customer profile
INSERT INTO profile (pname, pdob, pmob, pemail, pgender, ptype, addressid)
VALUES ('John Doe', '1990-05-15', 1234567890, 'john.doe@example.com', 'MALE', 'CUSTOMER', 100);

-- Insert an owner profile
INSERT INTO profile (pname, pdob, pmob, pemail, pgender, ptype, addressid)
VALUES ('Alice Smith', '1985-09-20', 9876543210, 'alice.smith@example.com', 'FEMALE', 'OWNER', 100);

-- Insert a delivery boy profile
INSERT INTO profile (pname, pdob, pmob, pemail, pgender, ptype, addressid)
VALUES ('Mike Johnson', '1995-07-12', 4444444444, 'mike.johnson@example.com', 'MALE', 'DELIVERY BOY', 101);


select * from profile;

select * from 




CREATE TABLE customer_order (
	oid int primary key auto_increment,
    resturant_id 

),






