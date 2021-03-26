# EXERCISE 1

create schema blog;
use blog;

create table post (
	post_code varchar(255),
    word_count smallint,
    views smallint,
    primary key (post_code)
);

create table authors (
	id smallint not null auto_increment, 
    author_name varchar(255),
    author_post varchar(255),
    primary key (id),
    foreign key (author_post) references post(post_code)
);


insert into post values
('Best-Pain-Colors', 814, 14),
('Small-Space-Decorating-Tips', 1146, 221),
('Hot-Accesories', 986, 105),
('Mixing-Textures', 765, 22),
('Kitchen-Refresh', 1242, 307),
('Homemade-Art-Hacks', 1002, 193),
('Refenishing-Wood-Floors', 1571, 7542);


insert into authors (author_name, author_post) values
('Maria Charlotte', 'Best-Pain-Colors'),
('Juan Perez', 'Small-Space-Decorating-Tips'),
('Maria Charlotte', 'Hot-Accesories'),
('Maria Charlotte', 'Mixing-Textures'),
('Juan Perez', 'Kitchen-Refresh'),
('Maria Charlotte', 'Homemade-Art-Hacks'),
('Gema Alcocer', 'Refenishing-Wood-Floors');

# EXERCISE 2

create schema airline;
use airline;


create table aircrafts (
	aircraft_name varchar(255),
    total_seats smallint,
    primary key (aircraft_name)
);

create table customers (
	id smallint not null auto_increment,
    customer_name varchar(255),
    customer_status varchar(255),
    customer_total_mileage int,
    primary Key (id)
);

create table fligths (
	flight_number varchar(5),
    aircraft_name varchar(255),
    flight_mileage smallint,
    primary key (flight_number),
    foreign key(aircraft_name) references aircrafts(aircraft_name)
);

create table airline (
	id smallint not null auto_increment,
    flight_number varchar(5),
    customer_id smallint,
    primary key (id),
    foreign key (flight_number) references fligths(flight_number),
    foreign key (customer_id) references customers(id)
);

insert into aircrafts values
	('Boeing-747', 400),
	('Boeing-777', 264),
	('Airbus-A330', 236);

insert into customers (customer_name, customer_status, customer_total_mileage)  values 
	('Agustine Riviera', 'Silver', 115235),
	('Alaina Sepulvida', 'None', 6008),
	('Tom Jones', 'Gold', 205767),
	('Sam Rio', 'None', 2653),
	('Jessica James', 'Silver', 127656),
	('Ana Janco', 'Silver', 136773),
	('Jennifer Cortez', 'Gold', 300582),
	('Christian Janco', 'Silver', 14642);
    
insert into fligths values
	('DL143', 'Boeing-747', 135),
	('DL122', 'Airbus-A330', 4370),
	('DL53', 'Boeing-777', 2078),
	('DL222', 'Boeing-777', 1765),
	('DL37', 'Boeing-747', 531);
    
insert into airline (flight_number, customer_id) values 
	('DL143', 1),
	('DL122', 1),
	('DL122', 2),
	('DL122', 3),
	('DL53', 3),
	('DL143', 4),
	('DL222', 3),
	('DL143', 5),
	('DL222', 6),
	('DL222', 7),
	('DL122', 5),
	('DL37', 4),
	('DL222', 8);

# EXERCISE 3: In the Airline database write the SQL script to get the total number of flights in the database
select count(*) as total_flights from fligths;

# EXERCISE 4: In the Airline database write the SQL script to get the average flight distance
select avg(flight_mileage) as average_mileage from fligths;

# EXERCISE 5: In the Airline database write the SQL script to get the average number of seats
select avg(total_seats) as average_total_seats from aircrafts;

# EXERCISE 6: In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status
select customer_status, avg(customer_total_mileage) from customers group by customer_status;

# EXERCISE 7: In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status
select customer_status, max(customer_total_mileage) from customers group by customer_status;

# EXERCISE 8: In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing
select aircraft_name from aircrafts where aircraft_name like 'Boeing%';

# EXERCISE 9: In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles
select flight_number, flight_mileage from fligths where flight_mileage between 300 and 2000;

# EXERCISE 10: In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join)
SELECT customer_status,AVG(flight_mileage) FROM flights_per_customer INNER JOIN customers ON flights_per_customer.customer_name=customers.customer_name INNER JOIN
flights ON flights_per_customer.flight_number=flights.flight_number GROUP BY customer_status;

# EXERCISE 11: In the Airline database write the SQL script to find the most aircraft most often booked by gold status members (this should require a join)
SELECT aircraft,MAX(total) FROM
(SELECT aircraft,COUNT(aircraft) total FROM flights_per_customer INNER JOIN customers
ON flights_per_customer.customer_name=customers.customer_name INNER JOIN flights ON flights_per_customer.flight_number=flights.flight_number
WHERE customer_status='Gold' GROUP BY aircraft
) subqueryaircrafts;







