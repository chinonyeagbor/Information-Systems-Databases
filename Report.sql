DROP TABLE medication;
DROP TABLE diagnoses;
DROP TABLE appointment_nursed;
DROP TABLE appointments;
DROP TABLE nurses_new;
DROP TABLE doctors;
DROP TABLE pets;
DROP TABLE pet_owners;

CREATE TABLE pet_owners (
  owner_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  telephone_number VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL
);

CREATE TABLE pets (
  pet_id INTEGER PRIMARY KEY,
  owner_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  breed VARCHAR(255) NOT NULL,
  gender CHAR(1) NOT NULL,
  age INTEGER NOT NULL,
  colour VARCHAR(255) NOT NULL,
  weight INTEGER NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES pet_owners (owner_id)
);

CREATE TABLE doctors (
  doctor_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  office_number INTEGER NOT NULL,
  telephone_number VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) UNIQUE NOT NULL,
  is_full_time CHAR(1) NOT NULL
);

CREATE TABLE nurses_new (
  nurse_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  office_number INTEGER NOT NULL,
  telephone_number VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL
);

CREATE TABLE appointments (
  appointment_id INTEGER PRIMARY KEY,
  pet_id INTEGER NOT NULL,
  doctor_id INTEGER NOT NULL,
  appt_date DATE NOT NULL,
  appt_time DATE NOT NULL,
  cost INTEGER NOT NULL, 
  FOREIGN KEY (pet_id) REFERENCES pets (pet_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id)
);

CREATE TABLE appointment_nursed (
  id INTEGER PRIMARY KEY,
  appointment_id INTEGER NOT NULL,
  nurse_id INTEGER NOT NULL,
  FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id),
  FOREIGN KEY (nurse_id) REFERENCES nurses_new (nurse_id)
);

CREATE TABLE diagnoses (
  diagnosis_id INTEGER PRIMARY KEY,
  appointment_id INTEGER NOT NULL,
  diag_date DATE NOT NULL,
  description VARCHAR(255) NOT NULL,
  referral CHAR(1) NOT NULL,
  deferral CHAR(1) NOT NULL,
  FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id)
);

CREATE TABLE medication (
  medication_id INTEGER PRIMARY KEY,
  appointment_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  dosage VARCHAR(255) NOT NULL,
  frequency VARCHAR(255) NOT NULL,
  FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id)
);

--
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (1, 'John Smith', '123 Main Street', '555-555-1212', 'john@example.com');
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (2, 'Jane Doe', '456 Market Avenue', '555-555-1213', 'jane@example.com');
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (3, 'Bob Williams', '789 Elm Street', '555-555-1214', 'bob@example.com');
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (4, 'Sally Johnson', '321 Oak Avenue', '555-555-1215', 'sally@example.com');
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (5, 'Tom Brown', '654 Pine Street', '555-555-1216', 'tom@example.com');
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (6, 'Sarah Davis', '987 Cedar Boulevard', '555-555-1217', 'sarah@example.com');
INSERT INTO pet_owners (owner_id, name, address, telephone_number, email_address) VALUES (7, 'Mike Thompson', '246 Maple Drive', '555-555-1218', 'mike@example.com');
--

INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1001, 1, 'Fluffy', 'Cat', 'Sianene', 'F', 5, 'White', 10);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1002, 1, 'Buddy', 'Dog', 'Chiwawa', 'M', 3, 'Black', 20);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1003, 2, 'Mittens', 'Cat', 'Ragdoll', 'F', 2, 'Grey', 8);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1004, 2, 'Rover', 'Dog', 'Bull dog', 'M', 4, 'Brown', 25);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1005, 3, 'Smokey', 'Cat', 'Persian', 'M', 6, 'Black', 15);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1006, 3, 'Daisy', 'Dog', 'Terrier', 'F', 1, 'White', 10);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1007, 4, 'Tiger', 'Cat', 'Birman', 'M', 3, 'Orange', 12);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1008, 4, 'Lucy', 'Dog', 'Alsatian', 'F', 2, 'Brown', 20);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1009, 5, 'Garfield', 'Cat', 'Birman', 'M', 4, 'Grey', 15);
INSERT INTO pets (pet_id, owner_id, name, type, breed, gender, age, colour, weight) VALUES (1010, 5, 'Charlie', 'Dog', 'Alsatian', 'M', 1, 'Black', 10);

INSERT INTO doctors (doctor_id, name, office_number, telephone_number, email_address, is_full_time) VALUES (1, 'Dr. Jane Smith', 101, '555-555-1212', 'jane@example.com', 'Y');
INSERT INTO doctors (doctor_id, name, office_number, telephone_number, email_address, is_full_time) VALUES (2, 'Dr. John Doe', 102, '555-555-1213', 'john@example.com', 'Y');
INSERT INTO doctors (doctor_id, name, office_number, telephone_number, email_address, is_full_time) VALUES (3, 'Dr. Bob Williams', 103, '555-555-1214', 'bob@example.com', 'Y');
INSERT INTO doctors (doctor_id, name, office_number, telephone_number, email_address, is_full_time) VALUES (4, 'Dr. Sally Johnson', 104, '555-555-1215', 'sally@example.com', 'N');

INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (1, 'Nurse A', 101, '111-111-1111', 'nurseA@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (2, 'Nurse B', 102, '222-222-2222', 'nurseB@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (3, 'Nurse C', 103, '333-333-3333', 'nurseC@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (4, 'Nurse D', 104, '444-444-4444', 'nurseD@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (5, 'Nurse E', 105, '555-555-5555', 'nurseE@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (6, 'Nurse F', 106, '666-666-6666', 'nurseF@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (7, 'Nurse G', 107, '777-777-7777', 'nurseG@email.com');
INSERT INTO nurses_new (nurse_id, name, office_number, telephone_number, email_address) VALUES (8, 'Nurse H', 108, '888-888-8888', 'nurseH@email.com');

INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (1, 1001, 1, '05-Aug-2022', TO_DATE('13:00:00', 'HH24:MI:SS'), 15);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (2, 1002, 2, '05-Aug-2022', TO_DATE('14:00:00', 'HH24:MI:SS'), 5);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (3, 1003, 3, '09-Aug-2022', TO_DATE('15:00:00', 'HH24:MI:SS'), 20);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (4, 1004, 4, '16-Aug-2022', TO_DATE('16:00:00', 'HH24:MI:SS'), 5);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (5, 1005, 1, '07-Oct-2022', TO_DATE('17:00:00', 'HH24:MI:SS'), 15);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (6, 1006, 2, '11-Oct-2022', TO_DATE('18:00:00', 'HH24:MI:SS'), 15);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (7, 1007, 3, '30-Nov-2022', TO_DATE('19:00:00', 'HH24:MI:SS'), 5);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (8, 1008, 4, '27-Nov-2022', TO_DATE('20:00:00', 'HH24:MI:SS'), 5);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (9, 1002, 1, '24-Nov-2022', TO_DATE('21:00:00', 'HH24:MI:SS'), 15);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (10, 1002, 1, '29-Aug-2022', TO_DATE('22:00:00', 'HH24:MI:SS'), 20);
INSERT INTO appointments (appointment_id, pet_id, doctor_id, appt_date, appt_time, cost) VALUES (11, 1009, 4, '27-Nov-2022', TO_DATE('23:00:00', 'HH24:MI:SS'), 20);

INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (1, 1, 1);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (2, 1, 2);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (3, 2, 3);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (4, 2, 4);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (5, 3, 5);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (6, 3, 6);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (7, 4, 7);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (8, 4, 8);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (9, 5, 1);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (10, 5, 2);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (11, 6, 3);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (12, 6, 4);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (13, 7, 1);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (14, 7, 8);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (15, 8, 2);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (16, 8, 7);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (17, 9, 3);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (18, 9, 6);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (19, 10, 4);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (20, 10, 5);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (21, 11, 1);
INSERT INTO appointment_nursed (id, appointment_id, nurse_id) VALUES (22, 11, 8);

INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (1, 1, '05-Aug-2022', 'Flu', 'N', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (2, 2, '05-Aug-2022', 'Allergy', 'Y', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (3, 3, '09-Aug-2022', 'Skin infection', 'N', 'Y');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (4, 4, '16-Aug-2022', 'socialisation', 'N', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (5, 5, '07-Oct-2022', 'Bladder infection', 'Y', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (6, 6, '11-Oct-2022', 'Liver disease', 'N', 'Y');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (7, 7, '30-Nov-2022', 'socialisation', 'N', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (8, 8, '27-Nov-2022', 'dental', 'N', 'Y');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (9, 9, '24-Nov-2022', 'socialisation', 'N', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (10, 10, '29-Aug-2022', 'socialisation', 'N', 'N');
INSERT INTO diagnoses (diagnosis_id, appointment_id, diag_date, description, referral, deferral) VALUES (11, 11, '27-Nov-2022', 'Allergy', 'Y', 'N');


INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (1, 1, 'Ibuprofen', '200mg', '3 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES  (2, 2, 'Antihistamine', '10mg', '2 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (3, 3, 'Antibiotic ointment', 'apply topically', '3 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (4, 4, 'Vitalmin Active', '10 tablets', '1 time a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (5, 5, 'Antibiotic', '500mg', '3 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (6, 6, 'Liver support supplement', '2 tablets', '2 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (7, 7, 'Vitalmin Active', '10 tablets', '1 time a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (8, 8, 'Liver support supplement', '2 tablets', '2 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (9, 9, 'Vitalmin Active', '10 tablets', '1 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES (10, 10, 'Vitalmin Active', '10 tablets', '1 times a day');
INSERT INTO medication (medication_id, appointment_id, name, dosage, frequency) VALUES  (11, 11, 'Antihistamine', '10mg', '2 times a day');







