-- Railway Reservation Scenario

-- Create Trains table
CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);


-- Insert data into Trains
INSERT INTO trains (train_name, source, destination) VALUES
('Express1','Chennai','Madurai'),
('Express2','Coimbatore','Salem'),
('Express3','Madurai','Chennai');


-- Create Bookings table
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);


-- Insert data into Bookings
INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1,'Janani',500,'Confirmed'),
(1,'Arun',500,'Waiting'),
(2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'),
(2,'Meena',300,'Confirmed');



SELECT *
FROM trains;



SELECT *
FROM bookings;


-- Question 41: Retrieve all bookings with fare greater than 400
SELECT *
FROM bookings
WHERE fare > 400;


-- Question 42: Find bookings where status is not 'Confirmed'
SELECT *
FROM bookings
WHERE status <> 'Confirmed';


-- Question 43: Display trains starting from Chennai
SELECT *
FROM trains
WHERE source = 'Chennai';


-- Question 44: Retrieve bookings with fare between 300 and 500
SELECT *
FROM bookings
WHERE fare BETWEEN 300 AND 500;


-- Question 45: Find passengers whose names start with 'A'
SELECT *
FROM bookings
WHERE passenger_name LIKE 'A%';


-- Question 46: Retrieve train names along with passenger names
SELECT t.train_name, b.passenger_name
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id;


-- Question 47: Count number of bookings for each train
SELECT t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;


-- Question 48: Display train names and total fare collected for each train
SELECT t.train_name, SUM(b.fare) AS total_fare
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;


-- Question 49: Find bookings with fare equal to the highest fare
SELECT *
FROM bookings
WHERE fare = (
    SELECT MAX(fare)
    FROM bookings
);


-- Question 50: Retrieve trains that have more than one booking
SELECT t.train_id, t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
HAVING COUNT(b.booking_id) > 1;