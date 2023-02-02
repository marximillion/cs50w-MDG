CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);

INSERT INTO flights (origin, destination, duration)
VALUES ('New York', 'London', 415);
INSERT INTO flights (origin, destination, duration)
VALUES ('Shanghai', 'Paris', 760);
INSERT INTO flights (origin, destination, duration)
VALUES ('Istanbul', 'Tokyo', 700);
INSERT INTO flights (origin, destination, duration)
VALUES ('New York', 'Paris', 435);
INSERT INTO flights (origin, destination, duration)
VALUES ('Moscow', 'Paris', 245);
INSERT INTO flights (origin, destination, duration)
VALUES ('Lima', 'New York', 455);

SELECT * FROM flights;
SELECT origin, destination FROM flights;
SELECT * FROM flights WHERE id = 3;
SELECT * FROM flights WHERE origin = 'New York';
SELECT * FROM flights WHERE duration > 500;
SELECT * FROM flights WHERE destination = 'Paris' AND duration > 500;
SELECT * FROM flights WHERE destination = 'Paris' OR duration > 500;
SELECT AVG(duration) FROM flights WHERE origin = 'New York';
SELECT COUNT(*) FROM flights WHERE origin = 'New York';
SELECT MIN(duration) FROM flights;
SELECT * FROM flights WHERE duration = 245;
SELECT * FROM flights WHERE origin IN ('New York', 'Lima');
SELECT * FROM flights WHERE origin LIKE '%a%'; /*select origins that contain an a*/


UPDATE flights
SET duration = 430
WHERE origin = 'New York'
AND destination = 'London';

UPDATE flights
SET duration = 750
WHERE id = 2;

DELETE FROM flights
WHERE destination = 'Tokyo';

SELECT * FROM flights LIMIT 2;
SELECT * FROM flights ORDER BY duration ASC;

INSERT INTO passengers (name, flight_id) VALUES ('Alice', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Bob', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Charlie', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Dave', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Erin', 4);
INSERT INTO passengers (name, flight_id) VALUES ('Frank', 6);
INSERT INTO passengers (name, flight_id) VALUES ('Grace', 6);


SELECT origin, destination, name FROM flights JOIN passengers ON
passengers.flight_id = flights.id;

SELECT origin, destination, name FROM flights JOIN passengers ON
passengers.flight_id = flights.id WHERE name = 'Alice';

SELECT * FROM flights WHERE id IN 
(SELECT flight_id FROM passengers
GROUP BY flight_id HAVING COUNT(*) > 1);