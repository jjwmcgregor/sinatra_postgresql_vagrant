DROP TABLE IF EXISTS user;

CREATE TABLE user (

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER

);

INSERT INTO user (name , age) VALUES ('Bert' , 54);
INSERT INTO user (name , age) VALUES ('Ernie' , 34);
INSERT INTO user (name , age) VALUES ('Big Bird' , 45);
INSERT INTO user (name , age) VALUES ('Grover' , 66);
