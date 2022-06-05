USE hfri;

-- Delete Data
DELETE FROM deliverable;
DELETE FROM is_about;
DELETE FROM works_on;
DELETE FROM project;
DELETE FROM executive;
DELETE FROM researcher;
DELETE FROM field;
DELETE FROM budget_funds;
DELETE FROM phone_number;
DELETE FROM organization;
DELETE FROM program;
ALTER TABLE `program` AUTO_INCREMENT = 1;
ALTER TABLE `organization` AUTO_INCREMENT = 1;
ALTER TABLE `project` AUTO_INCREMENT = 1;
ALTER TABLE `researcher` AUTO_INCREMENT = 1;
ALTER TABLE `executive` AUTO_INCREMENT = 1;
ALTER TABLE `deliverable` AUTO_INCREMENT = 1;