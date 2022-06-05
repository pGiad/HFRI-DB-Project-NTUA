USE hfri;

-- Delete Data
DELETE FROM deliverable;
DELETE FROM is_about;
DELETE FROM works_on;
DELETE FROM project;
DELETE FROM executive;
DELETE FROM researcher;
DELETE FROM field;
-- DELETE FROM budget_funds;
DELETE FROM phone_number;
DELETE FROM organization;
DELETE FROM program;
ALTER TABLE `program` AUTO_INCREMENT = 1;
ALTER TABLE `organization` AUTO_INCREMENT = 1;
ALTER TABLE `project` AUTO_INCREMENT = 1;
ALTER TABLE `researcher` AUTO_INCREMENT = 1;
ALTER TABLE `executive` AUTO_INCREMENT = 1;
ALTER TABLE `deliverable` AUTO_INCREMENT = 1;

-- Insert 32 program data
INSERT INTO program (program_name, hfri_address) VALUES
	('name1','finance'), ('name2','HR'), ('name3','marketing'), ('name4','sales'),
    ('name5','customer support'), ('name6','consulting'), ('name7','technical dept'), ('name8','development'),
    ('name9','promotion'), ('name10','operations'), ('name11','purchase'), ('name12','management'),
    ('name13','maintaining'), ('name14','scheduling'), ('name15','debugging'), ('name16','telephone center'),
    ('name17','remote support'), ('name18','HR'), ('name19','marketing'), ('name20','sales'),
    ('name21','customer support'), ('name22','consulting'), ('name23','technical dept'), ('name24','development'),
    ('name25','operations'), ('name26','telephone center'), ('name27','consulting'), ('name28','sales'),
    ('name29','management'), ('name30','debugging'), ('name31','HR'), ('name32','development');
    
-- Insert 30 organization data
INSERT INTO organization (abbreviation, name, street_name, street_number, zip_code, city, organization_type) VALUES
	('aapl', 'Apple', 'Kalisthenous', 32, 11732, 'Athens', 'company'), #1
    ('ntua', 'National Technical University of Athens', 'Katexaki', 53, 13255, 'Athens', 'university'),  #2
    ('eaa', 'Ethniko Asteroskopio Athinon', 'Apostolou Pavlou', 19, 11851, 'Athens', 'research_center'), #3
    ('auth', 'Aristoteleio University of Thessaloniki', 'Agion Panton', 77, 25885, 'Thessaloniki', 'university'), #4
    ('disney', 'Distributed Interactive Simulation','Agioi Saranta', 03, 25810, 'Miami', 'company'), #5
	('tesla' , 'Tera electron volt Energy ', 'Dafnis',88, 15772, 'Dallas', 'company'), #6
    ('nke', 'Nike', 'Maurodafnis', 63, 19740, 'New York', 'company'), #7
    ('NC', 'North Carolina State University', 'Katexaki', 51, 73945, 'Carolina', 'university'), #8
    ('UNC', 'Charlotte North Carolina University', 'Apostolou Pavlou', 99, 11851, 'Charlotte', 'university'), #9
    ('CERTH', 'Centre for Research and Technology', 'Mauromara', 78, 45995, 'Thessaloniki', 'research_center'), #10
    ('vz', 'Verizon Communication','Summit Drive', 10, 95819, 'Washigton', 'company'), #11
	('brk-b' , 'Bekshire Hathaway Inc ', 'Solonos',54, 99999, 'Carolina', 'company'), #12
    ('ge', 'general electric company', 'Kalisthenous', 12, 88732, 'Athens', 'company'), #13
    ('hd', 'The Home Depot', 'Michalakopoulou', 63, 99455, 'Amsterdam', 'company'), #14
    ('forth', 'Foundation for Research and Technology', 'Xlois', 81, 12822, 'Ioannina', 'research_center'), #15
    ('unic', 'Medical University of Nicosia', 'Anthis', 27, 29128, 'Nicosia', 'university'), #16
    ('mbz', 'Mercedes Benz','Thrakomakedonwn', 03, 25810, 'Paris', 'company'), #17
	('ford' , 'First on Race Day', 'Pantanassi',26, 16791, 'London', 'company'), #18
	('lg', 'LG Electronics', 'Polikarpis', 92, 11732, 'Singapore', 'company'), #19
    ('ucla', ' University of California', 'Adamantos', 13, 19895, 'California', 'university'), #20
    ('rch', 'Research Center for Humanities', 'Galatias', 69, 19881, 'Helsinki', 'research_center'), #21
    ('oxfr', ' University of Ofxord', 'Iraklidwn', 22, 34567, 'Oxford', 'university'), #22
    ('nvdia', 'vision for innovation ','Triwn ierarxwn', 09, 98765, 'Xalkida', 'company'), #23
	('amd' , 'Advanced Micro Devices ', 'Mileos',39, 84200, 'Komotini', 'company'), #24
    ('pc', 'Panasonic', 'Akteou', 92, 77891, 'New York', 'company'), #25
    ('cu', 'Cambridge University', 'Karaiskaki', 53, 13255, 'Cambridge', 'university'), #26
    ('hu', 'harvard university', 'Diakou', 19, 11851, 'Athens', 'university'), #27
    ('sbux', 'Starbucks Corporation', 'Tsakalof', 77, 25885, 'Chicago', 'company'), #28
    ('amzn', 'Amazon','Lenorman', 03, 25810, 'Oslo', 'company'), #29
	('ko' , 'Coca-Cola Company', 'Dimofontos',88, 15772, 'Monaco', 'company'); #30
    
-- Insert 65 phone_number data
INSERT INTO phone_number (phone, organization_id) VALUES
	('2103421547', 1), ('2108929677', 3), ('2108697244', 2), ('2119967888', 4), ('2310996736', 2),
    ('2103496547', 5), ('2108929255', 6), ('2107881244', 7), ('2119969998', 9), ('2310307036', 8),
    ('2103422247', 15), ('2114056677', 12), ('2200581241', 13), ('2205889549', 10), ('2452458086', 11),
    ('2108625665', 14), ('2150652520', 16), ('2105205844', 18), ('2120092561', 17), ('2352625892', 19),
    ('2152031845', 25), ('2962001386', 23), ('2162035479', 21), ('2158210314', 22), ('2360219484', 20),
    ('2109526031', 24), ('2561195677', 27), ('2151184854', 26), ('2154515495', 30), ('2985623061', 28),
    ('2106230541', 1), ('2108410254', 15), ('2104521055', 15), ('2161232458', 30), ('2316298636', 29),
    ('2103651416', 1), ('2108654156', 3), ('2468724545', 4), ('2185484565', 5), ('2684984800', 6),
    ('2105643157', 7), ('2108945163', 8), ('2156114354', 12), ('2105646510', 10), ('2356406351', 11),
    ('2651065167', 13), ('2189491651', 14), ('2591561631', 9), ('2254560106', 15), ('2105456162', 16),
    ('2165496056', 17), ('2165160650', 18), ('2165291324', 19), ('2198465181', 20), ('2056496135', 21),
    ('2198650321', 22), ('2998156025', 22), ('2196510189', 23), ('2651036544', 24), ('2651605614', 25),
    ('2165119845', 26), ('2108465184', 27), ('2561603644', 28), ('2198865103', 29), ('2205948965', 28);

-- Insert 12 field data
INSERT INTO field (field_name) VALUES
	('Mathematics'), ('Computer Engineering'), ('Biology'), ('Literature'), ('Chemistry'), ('Astronomy'),
    ('Ancient Greek'), ('History'), ('Music'), ('Programming'), ('Electronics'), ('Economics');
    
-- Insert 247 researcher data
INSERT INTO researcher (first_name, last_name, sex, birth_date, recruitment_date, organization_id) VALUES
	('Xristos', 'Papavasileiou', 'male', '1970-05-06', '1995-09-25', 2), 
    ('Pinelopi', 'Karagianni', 'female', '1981-04-12', '2011-10-22', 1), 
    ('Andreas', 'Fafalios', 'male', '1959-06-26', '1977-09-04', 3),      
    ('Giannis', 'Eleutheriou', 'male', '1950-08-30', '1975-07-23', 4),	#4
    ('Vasiliki', 'Eustathiou', 'female', '1951-08-04', '1970-08-30', 1),#5
    ('Dafni', 'Kalogeratou', 'female', '1950-11-19', '1968-12-27', 3), #6
    ('Kostas', 'Romanos', 'male', '1965-09-07', '1985-09-07', 2), # 7
    ('Panagiotis', 'Ionitsa', 'male', '1950-08-04', '1970-08-30', 5), # 8
    ('Nikitas', 'Litsos', 'male', '1948-11-19', '1968-12-27', 5),# 9
    ('Nikitas', 'Palaiologos', 'male', '1988-11-19', '2008-12-27', 6), # 10 
    ('Alexandros', 'Vidalis', 'male', '1992-11-19', '2011-12-27', 6),  # 11
    ('Markos', 'Delatolas', 'male', '1990-11-19', '2010-12-27', 6),    # 12
    ('Eirini', 'Karida', 'female', '1980-01-01', '2005-12-27', 5),     # 13 
    ('Ilias', 'Fountoulis', 'male', '1989-10-10', '2009-01-01', 5),    # 14
    ('Vasilis', 'Alvertis', 'male', '1968-11-19', '2000-12-27', 2),    # 15
    ('Maria', 'Apergi', 'female', '1987-11-19', '2011-12-27', 2),      # 16
    ('Markos', 'Zarpas', 'male', '1949-01-01', '1976-01-01', 3),       # 17
    ('Claudia', 'Ebib', 'female', '1960-01-01', '1982-12-27', 4),      # 18
    ('Eutixis', 'Bletsas', 'male', '1989-10-10', '2008-01-01', 5),     # 19
	('Ilias', 'Saratsis', 'male', '1974-10-10', '1998-01-01', 1),      # 20
    ('Aggelos', 'Louvaris', 'male', '1970-11-19', '1995-12-27', 1),    # 21
    ('Maria', 'Voudouri', 'female', '1968-11-19', '1999-12-27', 1),    # 22
    ('Vaggelis', 'Perivolarakis', 'male', '1992-01-01', '2010-01-01', 2), # 23
    ('Claudia', 'Ebib', 'female', '1990-01-01', '2010-12-27', 2), # 24
    ('Alexandros', 'Kirilos', 'male', '1990-10-10', '2009-01-01', 2), # 25
    ('Mixail', 'Emmanouilidis', 'male', '1993-09-07', '2012-09-07', 6), #26
    ('Manos', 'Panagiotopoulos', 'male', '1992-03-08', '2012-08-03', 6), #27
	('Ieroklis', 'Stoltidis', 'male', '1970-10-10', '1990-01-01', 1), # 28
    ('Marko', 'Kovasevic', 'male', '1968-09-07', '1990-09-07', 2), #29
    ('Vasilis', 'Spanoulis', 'male', '1950-03-08', '1970-08-03', 3), #30
	('Elisavet', 'Vidali', 'female', '1989-09-14', '2010-11-05', 7), #31
    ('Stefanos', 'Lato', 'male', '1989-10-19', '2009-09-01', 8), #32
    ('Giannis', 'Xenopoulos', 'male', '1978-09-07', '2010-09-07', 7), #33
    ('Eleni', 'Klaudianou', 'female', '1985-03-08', '2005-08-03', 8), #34
	('Nikos', 'Komnos', 'male', '1980-01-17', '2010-01-01', 9), #35
    ('Miltiadis', 'Kastorinis', 'male', '1975-09-07', '2005-05-02', 10), #36
    ('Marios', 'Biniakou', 'male', '1988-03-08', '2012-09-29', 9), #37
	('Konstantina', 'Xatziri', 'female', '1990-06-06', '2010-12-27', 10), #38
    ('Elina', 'Foskolou', 'female', '1990-09-10', '2009-09-10', 12), #39
    ('Eleni', 'Xethali', 'female', '1974-04-12', '2005-09-07', 11), #40
    ('Sophia', 'Andrioti', 'female', '1985-03-11', '2009-04-07', 12), #41
	('Tzortzis', 'Andriotis', 'male', '1970-10-10', '1998-04-23', 11), #42
    ('Panagiotis', 'Velimahitis', 'male', '1990-11-16', '2012-12-06', 13), #43
    ('Basilis', 'Stefanis', 'male', '1987-07-22', '2009-07-27', 14), #44
    ('Faih', 'Vasila', 'female', '1988-05-12', '2009-12-01', 13), #45
    ('Margarita', 'Apergi', 'female', '1986-11-20', '2006-04-26', 14), #46 3ADES
    ('Giannis', 'Sikoutris', 'male', '1968-09-07', '2001-05-10', 14), #47
    ('Eleni', 'Krikelli', 'female', '1985-09-25', '2007-01-19', 15), #48
	('Nikos', 'KOufetos', 'male', '1979-09-03', '2006-05-23', 15), #49
    ('Antonis', 'Kastorinis', 'male', '1985-04-07', '2008-05-02', 16), #50
    ('Marios', 'Xatiris', 'male', '1989-03-08', '2014-07-20', 16), #51
	('Konstantina', 'Panagiotopoulou', 'female', '1991-08-14', '2013-12-27', 17), #52
    ('Elina', 'Plita', 'female', '1988-09-10', '2010-05-30', 17), #53
    ('Marieta', 'Antali', 'female', '1979-04-17', '2009-01-30', 18), #54
    ('Sophia', 'Makridou', 'female', '1982-02-20', '2010-09-30', 18), #55
	('Tzortzis', 'Markouizos', 'male', '1977-10-10', '2004-12-10', 19), #56
    ('Panagiotis', 'Markakis', 'male', '1991-07-29', '2015-12-06', 19), #57
    ('Basilis', 'Dremlis', 'male', '1987-07-22', '2011-04-21', 20), #58
    ('Manos', 'Zarpas', 'male', '1990-03-16', '2016-11-02', 20), #59
    ('Basilis', 'Antonopoulos', 'male', '1983-07-22', '2010-01-15', 20), #60
    ('Dimitris', 'Diamantidis', 'male', '1980-03-08', '2010-08-03', 20), #61
	('Elisavet', 'Laskari', 'female', '1985-02-12', '2009-11-05', 20),   #62
    ('Stefanos', 'Saratsis', 'male', '1982-06-27', '2010-06-04', 20), #63
    ('Giannis', 'Varveris', 'male', '1974-09-07', '2006-03-23', 19), #64
    ('Maria', 'Palamai', 'female', '1991-04-07', '2012-04-20', 19), #65
	('Nikos', 'Siotos', 'male', '1992-08-11', '2014-08-10', 19), #66
    ('Gianna', 'Farakla', 'female', '1975-09-07', '2005-05-02', 18), #67
    ('Marios', 'Palamaris', 'male', '1984-06-10', '2013-09-29', 18), #68
	('Eirini', 'Xatziri', 'female', '1988-02-27', '2011-10-23', 18),     #69
    ('Elina', 'Vidali', 'female', '1988-05-15', '2010-09-10', 17), #70
    ('Antonia', 'Alifragki', 'female', '1972-04-12', '2008-09-07', 17), #71
    ('Sophia', 'Malliari', 'female', '1975-03-11', '2009-01-08', 17), #72
	('Tzortzis', 'Mplotsos', 'male', '1974-10-10', '2000-04-23', 16), #73
    ('Panagiotis', 'Velimahitis', 'male', '1991-11-16', '2014-12-06', 16), #74
    ('Alexandros', 'Stefanis', 'male', '1984-07-22', '2006-04-27', 16), #75
    ('Mathildi', 'Kavvalou', 'female', '1988-05-12', '2009-12-01', 15), #76
    ('Nikos', 'Alvertis', 'male', '1984-11-20', '2008-05-20', 15), #77
    ('Dimitris', 'Giannoulis', 'male', '1968-09-07', '2001-05-10', 15), #78
    ('Eleni', 'Krikelli', 'female', '1985-09-25', '2007-01-19', 14), #79
	('Nikos', 'KOufetos', 'male', '1979-09-03', '2006-05-23', 14), #80
    ('Antonis', 'Kastorinis', 'male', '1985-04-07', '2008-05-02', 14), #81
    ('Marios', 'Ionitsa', 'male', '1987-03-08', '2011-05-30', 16), #82
	('Konstantina', 'Panagiotopoulou', 'female', '1990-09-17', '2012-10-24', 17), #83
    ('Elina', 'Plita', 'female', '1988-09-10', '2010-05-30', 17), #84
    ('Marieta', 'Antali', 'female', '1979-04-17', '2009-01-30', 18), #85
    ('Marianna', 'Ziouli', 'female', '1982-01-28', '2010-06-22', 18), #86
	('Vrasidas', 'Markouizos', 'male', '1975-10-10', '2005-01-21', 18), #87
    ('Panagiotis', 'Hassalnari', 'male', '1991-07-29', '2015-12-06', 19), #88
    ('Basilis', 'Metsolari', 'male', '1978-04-25', '2015-06-29', 19), #89
    ('Xristoforos', 'Kantanis', 'male', '1990-08-19', '2012-12-02', 19), #90
    ('Basilis', 'Zenouni', 'male', '1981-07-22', '2012-04-21', 20), #91
    ('Marios', 'Kantanis', 'male', '1991-05-16', '2012-12-02', 20), #92
    ('Basilis', 'Antonopoulos', 'male', '1980-07-25', '2012-02-25', 20), #93
	('Marselino', 'Emmanoulidis', 'male', '1992-09-02', '2015-12-06', 19), #94
    ('Leonidas', 'Halaris', 'male', '1972-06-28', '2011-05-29', 19), #95
    ('Xristoforos', 'Georgiou', 'male', '1992-08-19', '2014-11-22', 19), #96
    ('Ioannis', 'Priamos', 'male', '1980-07-22', '2013-05-27', 20), #97
    ('Giorgos', 'Mazonakis', 'male', '1988-03-21', '2011-01-12', 20), #98
    ('Giannis', 'Dimakis', 'male', '1985-07-25', '2013-02-25', 20), #99
	('Ioannis', 'Tzaxristas', 'male', '1990-02-19', '2013-11-29', 20), #100
    ('Nikos', 'Matsablokos', 'male', '1978-08-09', '2006-02-22', 11), #101
    ('Antonis', 'Kirarinis', 'male', '1985-04-07', '2008-05-02', 12), #102
    ('Marios', 'Kaca', 'male', '1955-03-08', '1973-05-30', 13), #103
	('Maria', 'Sarri', 'female', '1952-09-17', '1974-02-01', 14), #104
    ('Eirini', 'Armakolla', 'female', '1953-09-10', '1972-05-31', 15), #105
    ('Marieta', 'Metaxa', 'female', '1974-04-17', '2009-06-30', 16), #106
    ('Maria', 'Petropoulou', 'male', '1975-01-13', '2004-02-21', 18), #107
    ('Euaggelos', 'Hotza', 'male', '1981-04-29', '2012-12-06', 19), #108
    ('Basilis', 'Remoundos', 'male', '1978-04-25', '2012-04-29', 20), #109
    ('Xristoforos', 'Bobenas', 'male', '1990-08-19', '2012-12-02', 21), #110
    ('Basilis', 'Xristoforou', 'male', '1982-07-22', '2012-04-21', 20), #111
    ('Alexandros', 'Stalikas', 'male', '1980-02-16', '2012-12-02', 22),#112
	('Giorgos', 'Kampanis', 'male', '1981-04-28', '2012-02-25', 23), #113
	('Periklis', 'Boinas', 'male', '1991-08-02', '2015-12-06', 24), #114
    ('Leonidas', 'Georgiou', 'male', '1972-06-28', '2011-05-29', 25), #115
    ('Aimilianos', 'Georgiou', 'male', '1992-08-19', '2014-11-22', 26), #116
    ('Axilleas', 'Paraskeuas', 'male', '1981-07-22', '2013-05-27', 27), #117
    ('Giannis', 'Ploutarxos', 'male', '1987-03-21', '2011-01-12', 28), #118
    ('Antonis', 'Remos', 'male', '1984-03-25', '2010-02-01', 29), #119
	('Iraklis', 'Zioulis', 'male', '1991-04-22', '2013-11-29', 30), #120
	('Nikos', 'Armaos', 'male', '1977-08-09', '2009-03-23', 21), #121
    ('Antonis', 'Kirarinis', 'male', '1985-04-07', '2008-05-02', 22), #122
    ('Marios', 'Kaca', 'male', '1955-03-08', '1973-05-30', 24), #123
    ('Marios', 'Dimitriadis', 'male', '1977-08-09', '2007-03-23', 21), # 124
    ('Antonis', 'Kirarinis', 'male', '1985-04-07', '2008-05-02', 12), #125
    ('Katerina', 'Sarri', 'female', '1954-09-17', '1974-02-01', 23), #126 
    ('Antonia', 'Mpon', 'female', '1952-09-10', '1972-05-31', 21), #127
	('Marieta', 'Metaxa', 'female', '1974-04-17', '2009-06-30', 25), #128
    ('Maria', 'Petropoulou', 'male', '1975-01-13', '2004-02-21', 2), #129
    ('Markos', 'Kalamaras', 'male', '1972-04-17', '2010-07-24', 6), #130
    ('Efi', 'Delatola', 'female', '1977-02-13', '2004-02-21', 3), #131
	('Alexandros', 'Stalikas', 'male', '1980-02-16', '2012-12-02', 27),#132
	('Giorgos', 'Kampanis', 'male', '1981-04-28', '2012-02-25', 23), #133
    ('Vladimiros', 'Mpouzalakos', 'male', '1984-08-28', '2012-02-25', 28), #134
	('Periklis', 'Plitas', 'male', '1991-08-02', '2015-12-06', 24), #135
	('Giannis', 'Chatzis', 'male', '1992-08-19', '2014-11-22', 29), #136 31
    ('Dimitris', 'Peradakos', 'male', '1981-07-22', '2013-05-27', 27), #137
    ('Giannis', 'Orianos', 'male', '1987-03-21', '2011-01-12', 30), #138 32
    ('Antonis', 'Gaitis', 'male', '1984-03-25', '2010-02-01', 29), #139
    ('Eleni', 'Zioulis', 'female', '1990-08-22', '2013-11-29', 27), #140 33
    ('Marios', 'Dimitriadis', 'male', '1977-08-09', '2007-03-23', 21), # 141
	('Antonis', 'Kirarinis', 'male', '1985-04-07', '2008-05-02', 26), #142
    ('Marios', 'Kaca', 'male', '1955-03-08', '1973-05-30', 13), #143
    ('Maria', 'Sarri', 'female', '1952-09-17', '1974-02-01', 25),    #144
    ('Eirini', 'Valmer', 'female', '1953-09-10', '1972-05-31', 18), #145
    ('Marieta', 'Antali', 'female', '1974-04-17', '2009-06-30', 17), #146
    ('Maria', 'Androvik', 'female', '1973-05-13', '2004-02-21', 16), #147
	('Euaggelos', 'Mastoris', 'male', '1980-04-29', '2012-10-09', 15), #148
	('Giorgos', 'Kampouris', 'male', '1978-04-25', '2012-04-29', 14), #149
	('Antonis', 'Kioukias', 'male', '1990-08-19', '2012-12-02', 13), #150
	('Basilis', 'Kousounadis', 'male', '1982-07-22', '2012-04-21', 12), #151
    ('Paulos', 'Karvelas', 'male', '1980-02-16', '2012-12-02', 11), #152
    ('Stefanos', 'Kamolinos', 'male', '1981-04-28', '2012-02-25', 10), #153
    ('Periklis', 'Stathakis', 'male', '1992-04-07', '2016-12-06', 25), #154
    ('Leonidas', 'Georgiou', 'male', '1972-06-28', '2011-05-29', 18), #155
	('Aimilianos', 'Georgiou', 'male', '1992-08-19', '2014-11-22', 17), #156
	('Panagiotis', 'Plakotakis', 'male', '1981-07-22', '2013-05-27', 22), #157
    ('Manolis', 'Apergis', 'male', '1987-03-21', '2011-01-12', 15), #158
    ('Theodora', 'Manousaki', 'male', '1984-03-25', '2010-02-01', 14), #159
    ('Marieta', 'Metaxa', 'female', '1974-04-17', '2009-06-30', 21), #160
    ('Maria', 'Pαpadopoulou', 'male', '1975-01-13', '2004-02-21', 21), #161
    ('Euaggelos', 'Metaxas', 'male', '1981-04-29', '2012-12-06', 21), #162
    ('Basilis', 'Papaspyrou', 'male', '1978-04-25', '2012-04-29', 21), #163
    ('Xristoforos', 'Argyriou', 'male', '1990-08-19', '2012-12-02', 21), #164
    ('Basilis', 'Karanikas', 'male', '1982-07-22', '2012-04-21', 22), #165
    ('Alexandros', 'Bogdanos', 'male', '1980-02-16', '2012-12-02', 22),#166
	('Giorgos', 'Papanikolas', 'male', '1981-04-28', '2012-02-25', 22), #167
	('Periklis', 'Papanikolaou', 'male', '1991-08-02', '2015-12-06', 22), #168
    ('Leonidas', 'Kourakos', 'male', '1972-06-28', '2011-05-29', 22), #169
    ('Aimilianos', 'Mpouranakos', 'male', '1992-08-19', '2014-11-22', 24), #170
    ('Panagiotis', 'Paraskeuas', 'male', '1981-07-22', '2013-05-27', 24), #171
    ('Giannis', 'Papandreou', 'male', '1984-03-21', '2011-01-12', 24), #172
    ('Antonis', 'Oikonomou', 'male', '1982-03-25', '2010-02-01', 24), #173
	('Iraklis', 'Oikonomopoulos', 'male', '1990-04-22', '2013-11-29', 23), #174
    ('Marios', 'Karras', 'male', '1976-08-09', '2007-03-23', 23), # 175
    ('Antonis', 'Euaggelatos', 'male', '1983-04-07', '2008-05-02', 23), #176
    ('Maria', 'Karra', 'female', '1954-03-08', '1973-05-30', 25), #177
	('Maria', 'Sarri', 'female', '1951-09-17', '1974-02-01', 25),     #178
    ('Eirini', 'Papaspirou', 'female', '1952-09-10', '1972-05-31', 25), #179
    ('Marieta', 'Andrioti', 'female', '1993-04-17', '2011-06-30', 6), #180
    ('Maria', 'Petkovic', 'male', '1994-01-13', '2012-02-21', 6), #181
    ('Euaggelos', 'Alvertis', 'male', '1981-04-29', '2012-12-06', 27), #182
    ('Basilis', 'Papamixail', 'male', '1978-04-25', '2012-04-29', 27), #183
    ('Mixail', 'Georgiou', 'male', '1991-09-19', '2012-12-02', 27), #184
    ('Basilis', 'Xristoforou', 'male', '1982-07-22', '2012-04-21', 27), #185
    ('Alexandros', 'Euaggelatos', 'male', '1980-02-16', '2012-12-02', 27),#186
	('Giorgos', 'Zenounis', 'male', '1981-04-28', '2012-02-25', 28), #187
	('Periklis', 'Daskalopoulos', 'male', '1991-08-02', '2015-12-06', 28), #188
    ('Markos', 'Georgiou', 'male', '1972-06-28', '2011-01-29', 28), #189
    ('Kostas', 'Methodios', 'male', '1992-08-19', '2014-12-22', 28), #190
    ('Axilleas', 'Kirilos', 'male', '1981-07-22', '2013-04-27', 29), #191
    ('Giannis', 'Karamnlis', 'male', '1984-04-21', '2011-02-12', 29), #192
    ('Antonis', 'Kanakis', 'male', '1982-06-25', '2010-04-01', 29), #193
	('Iraklis', 'Andreou', 'male', '1992-09-22', '2013-12-29', 29), #194
    ('Alexandros', 'Stefanis', 'male', '1984-07-22', '2006-04-27', 30), #195
    ('Mathildi', 'Kavvalou', 'female', '1988-05-12', '2009-12-01', 30), #196
    ('Nikos', 'Alvertis', 'male', '1984-11-20', '2008-05-20', 30), #197
    ('Dimitris', 'Giannoulis', 'male', '1968-09-07', '2001-05-10', 30), #198
    ('Eleni', 'Krikelli', 'female', '1985-09-25', '2007-01-19', 30), #199
	('Nikos', 'KOufetos', 'male', '1979-09-03', '2006-05-23', 27), #200
    ('Antonis', 'Kastorinis', 'male', '1985-04-07', '2008-05-02', 27), #201
    ('Marios', 'Ionitsa', 'male', '1987-03-08', '2011-05-30', 27), #202
	('Konstantina', 'Panagiotopoulou', 'female', '1990-09-17', '2012-10-24', 26), #203
    ('Elina', 'Plita', 'female', '1988-09-10', '2010-05-30', 26), #204
    ('Marieta', 'Antali', 'female', '1979-04-17', '2009-01-30', 26), #205
    ('Marianna', 'Ziouli', 'female', '1982-01-28', '2010-06-22', 25), #206
	('Vrasidas', 'Markouizos', 'male', '1975-10-10', '2005-01-21', 25), #207
    ('Panagiotis', 'Hassalnari', 'male', '1991-07-29', '2015-12-06', 18), #208
    ('Basilis', 'Metsolari', 'male', '1978-04-25', '2015-06-29', 18), #209
    ('Xristoforos', 'Kantanis', 'male', '1990-08-19', '2012-12-02', 18), #210
    ('Basilis', 'Zenouni', 'male', '1981-07-22', '2012-04-21', 17), #211
    ('Marios', 'Kantanis', 'male', '1991-05-16', '2012-12-02', 17), #212
    ('Basilis', 'Antonopoulos', 'male', '1980-07-25', '2012-02-25', 17), #213
	('Marselino', 'Emmanoulidis', 'male', '1992-09-02', '2015-12-06', 17), #214
    ('Leonidas', 'Halaris', 'male', '1972-06-28', '2011-05-29', 17), #215
    ('Xristoforos', 'Georgiou', 'male', '1992-08-19', '2014-11-22', 16), #216
    ('Ioannis', 'Priamos', 'male', '1980-07-22', '2013-05-27', 15), #217
    ('Giorgos', 'Mazonakis', 'male', '1988-03-21', '2011-01-12', 15), #218
    ('Giannis', 'Dimakis', 'male', '1985-07-25', '2013-02-25', 14), #219
	('Ioannis', 'Tzaxristas', 'male', '1990-02-19', '2013-11-29', 14), #220
    ('Nikos', 'Matsablokos', 'male', '1978-08-09', '2006-02-22', 14), #221
    ('Antonis', 'Xristou', 'male', '1985-04-07', '2008-05-02', 14), #222
    ('Marios', 'Mirallas', 'male', '1955-03-08', '1973-05-30', 14), #223 UNTIL PROJECT 40    
	('Maria', 'Sampsonidou', 'female', '1952-09-17', '1974-02-01', 13),     #224
    ('Vefa', 'Alleksiadou', 'female', '1953-09-10', '1972-05-31', 13), #225
    ('Iliana', 'Papageorgiou', 'female', '1974-04-17', '2009-06-30', 13), #226
    ('Maria', 'Petropoulou', 'male', '1975-01-13', '2004-02-21', 12), #227
    ('Euaggelos', 'Euaggelopoulos', 'male', '1981-04-29', '2012-12-06', 12), #228
    ('Basilis', 'Papaxristou', 'male', '1978-04-25', '2012-04-29', 11), #229
    ('Makis', 'Georgoulis', 'male', '1990-08-19', '2012-12-02', 10), #230
    ('Aggelos', 'Pappas', 'male', '1982-07-22', '2012-04-21', 10), #231
    ('Giannis', 'Papapetrou', 'male', '1980-02-16', '2012-12-02', 10),#232
	('Giorgos', 'Anastasopoulos', 'male', '1981-04-28', '2012-02-25', 10), #233
	('Periklis', 'Stathakis', 'male', '1991-08-02', '2015-12-06', 25), #234
    ('Menelaos', 'Georgiou', 'male', '1970-07-28', '2011-05-29', 18), #235
    ('Aimilianos', 'Thoukididis', 'male', '1990-08-19', '2014-11-22', 18), #236
    ('Axilleas', 'Vidalis', 'male', '1980-07-22', '2013-05-27', 17), #237
    ('Giannis', 'Nazos', 'male', '1982-03-21', '2011-01-12', 17), #238
    ('Antonis', 'Apergis', 'male', '1984-03-25', '2010-02-01', 17), #239
    ('Stefanos', 'Kampanis', 'male', '1981-04-28', '2012-02-25', 22), #240
	('Nikitas', 'Boinas', 'male', '1991-08-02', '2015-12-06', 22), #241
    ('Leonidas', 'Sakelaropoulos', 'male', '1972-06-28', '2011-05-29', 15), #242
    ('Eirinos', 'Voudouris', 'male', '1992-08-19', '2014-11-22', 15), #243
    ('Axilleas', 'Tompros', 'male', '1981-07-22', '2013-05-27', 15), #244
    ('Giannis', 'Dimakis', 'male', '1989-03-21', '2011-01-12', 14), #245
    ('Mpampis', 'Remos', 'male', '1989-03-29', '2010-02-01', 14), #246
	('ILIAS', 'MAMALAKIS', 'male', '1991-04-22', '2013-11-29', 14); #247
    
-- Insert 15 executive data
INSERT INTO executive (first_name, last_name) VALUES
	('Giorgos', 'Papaioannou'), ('Maria', 'Karavaki'), ('Lefteris', 'Astoris'), ('Vaggelis', 'Feriskos'), ('Vladimiros', 'Sakellariou'),
    ('Sakis', 'Karpas'), ('Mpampis', 'Fesatoglou'), ('Eleni', 'Stereou'), ('Diogenis', 'Xrisostomou'), ('Aristotelis', 'Rigas'),
    ('Despina', 'Protopsalti'), ('Stratos', 'Evaggelou'), ('Antonis', 'Papapavlou'), ('Paraskevi', 'Dimitriou'), ('Anna', 'Linardou');

-- Insert 64 project data
INSERT INTO project (title, summary, amount, entry_date, due_date, program_id, executive_id, organization_id, supervisor_id, reviewer_id, review_grade, review_date) VALUES
	('Deeper Analysis to DDR5 Memories', 'Summary 1', 102536, '2020-05-21', '2023-04-22', 8, 2, 2, 1, 101, '4', '2020-02-19'), #1
	('Data Analysis of Glucose Calculations', 'Summary 2', 150968, '2012-09-14', '2016-09-14', 3, 1, 2, 7, 102, '5', '2010-12-22'), #2
	('Dostoevsky: A new scope', NULL, 250200, '1988-11-21', '1990-02-17', 1, 3, 4, 4, 103, '2', '1987-05-05'), #3
	('Ice rivers on Mars', 'Summary 4', 923000, '2000-08-30', '2004-08-30', 3, 5, 1, 5, 104, '5', '1996-10-02'), #4
	('Foundations of Signal Processing', 'Summary 5', 805000, '1977-09-11', '1979-09-11', 7, 2, 3, 6, 105, '3', '1977-09-10'), #5
    ('Creating pipeline with mutex', 'Summary 6', 300000, '2015-08-10', '2018-05-05', 2, 5, 6, 10, 106, '2', '2013-08-22'), #6
    ('Creating pipeline', 'Summary 7', 700000, '2016-06-10', '2019-05-05', 3, 3, 6, 10, 107, '4', '2014-08-26'), #7
    ('Putting semaphores', 'Summary 8', 900000, '2015-07-10', '2019-05-05', 1, 1, 6, 10, 108, '3', '2014-08-26'), #8
    ('Portugal plan', 'Summary 9',200000, '2014-05-12', '2018-01-01', 2, 1, 5, 8, 109,'2', '2013-01-01'), #9
    ('Eyoias roadtrip', 'Summary 10', 150000, '2016-02-01', '2019-01-01', 8, 4, 5, 8, 110, '5', '2015-05-05'), #10
    ('Finlands temperature', 'Summary 11', 400000, '2019-02-01', '2022-04-02', 4, 5, 5, 8,111, '5', '2013-02-10'), #11
    ('Calculation of Population', 'Summary 12', 109999, '2021-05-21', '2023-04-22', 12, 13, 10, 36,112, '2', '2020-01-19'), #12
	('Represent the Goals of Orgaization', 'Summary 13', 150555, '2021-09-14', '2024-09-14', 30, 14, 11, 40, 113, '4', '2015-12-22'), #13
	('Team Objectives and Customers Needs', NULL, 259999, '2020-11-21', '2023-02-17', 27, 9, 12, 41, 121, '2', '2019-05-05'), #14
	('Creative and Profesional', 'Summary 15', 473900, '2021-08-30', '2025-06-25', 9, 13, 13, 43, 120, '5', '2020-10-02'), #15
	('Software Tool Intergration using linked', 'Summary 16', 890500, '2021-09-11', '2024-06-11', 15, 10, 14, 44, 119, '1', '2018-09-10'), #16
    ('Command Programm', 'Summary 17', 320500, '2022-05-10', '2025-05-05', 4, 11, 15, 48, 118, '4', '2021-08-22'), #17
    ('3d Print', 'Summary 18', 650090, '2020-06-10', '2023-05-05', 11, 9, 16, 50, 117, '5', '2019-08-26'), #18
    ('Innovatology', 'Summary 19', 990000, '2021-07-10', '2024-05-05', 14, 8, 17, 52, 116, '3', '2017-08-26'), #19
    ('Net Rebuilding', 'Summary 20',510500, '2022-01-12', '2026-01-01', 10, 14, 18, 55, 115,'2', '2021-01-01'), #20
    ('Privacy Preserving User Profile', 'Summary 21', 110500, '2019-08-01', '2023-01-01', 31, 15, 19, 57, 114, '5', '2017-05-05'), #21
    ('Search for Dynamic Data', 'Summary 22', 789000, '2020-02-01', '2024-04-02', 30, 2, 20, 58, 113, '2', '2018-02-10'), #22
    ('Impact of climate on west nile virus', 'Summary 23', 210536, '2019-05-21', '2023-01-26', 23, 2, 21, 121, 1, '4', '2018-02-19'), #23
	('Vulnerability to health effects of wildfires', 'Summary 24', 255999, '2020-10-24', '2024-11-15', 24, 1, 22, 122, 124, '5', '2019-12-22'), #24 , 142
	('Application of a succesful library', NULL, 250200, '2021-11-21', '2025-03-18', 25, 3, 24,123, 125, '2', '2019-05-05'), #25
	('Idealized modeling of stratospheric ballon', 'Summary 26', 925000, '2022-01-14', '2025-08-30', 26, 5, 23, 126, 127, '3', '2021-10-02'), #26
	('Current climate weather prediction', 'Summary 27', 830000, '2021-10-11', '2024-09-11', 27, 7, 25,128, 129, '3', '2020-09-10'), #27
    ('Water quality in the great lakes', 'Summary 28', 310000, '2021-08-10', '2024-05-05', 28, 8, 6, 130, 131, '2', '2020-08-22'), #28
    ('A calibrated model for the pricing of credit', 'Summary 29', 720500, '2021-06-10', '2024-05-05', 30, 9, 27, 132, 133, '1', '2019-08-26'), #29
    ('Models for forecasting mobile phone sales', 'Summary 30', 750000, '2020-07-10', '2023-05-05', 29, 11, 28, 134, 135, '3', '2019-08-26'), #30
    ('Optimizing the yield of biorector', 'Summary 31',200000, '2021-05-12', '2025-01-01', 21, 12, 29, 136, 137,'2', '2020-01-01'), #31
    ('Optimal timing of harvesting of stands', 'Summary 32', 150000, '2022-02-01', '2026-01-01', 18, 14, 30, 138, 139, '5', '2021-05-05'), #32
    ('Efficiency of Finnish health care units', 'Summary 33', 400000, '2022-02-01', '2025-04-02', 14, 15, 27, 140,141, '5', '2020-02-10'), #33
    ('Estimation of credit rating', 'Summary 34', 109999, '2020-09-22', '2023-04-22', 17, 13, 26, 142,143, '2', '2020-01-19'), #34
	('Prediction of solar flare', 'Summary 35', 150555, '2021-09-14', '2024-09-14', 16, 4, 25, 144, 2, '4', '2019-12-22'), #35
	('Development of satellite', NULL, 259999, '2020-11-21', '2023-02-17', 16, 9, 18, 145, 3, '2', '2019-05-05'), #36
	('Development of the Oceanic satellite', 'Summary 37', 473900, '2021-09-23', '2024-06-25', 15, 3, 17, 146, 3, '5', '2020-10-02'), #37
	('Strategies for optimizing', 'Summary 38', 890500, '2021-04-25', '2023-09-15', 14, 1, 16, 147, 4, '1', '2019-09-10'), #38
    ('Decision making support', 'Summary 39', 320500, '2021-03-30', '2024-03-03', 13, 1, 15, 148, 5, '4', '2020-06-17'), #39
    ('4D Video Capturing', 'Summary 40', 650090, '2021-10-23', '2024-07-07', 12, 9, 14, 149, 6, '5', '2020-09-29'), #40
    ('Support system ', 'Summary 41', 990000, '2021-04-14', '2024-06-25', 11, 8, 13, 150, 7, '3', '2019-08-26'), #41
    ('Expand our sattelite system', 'Summary 42',510500, '2022-02-12', '2026-01-01', 19, 7, 12, 151, 8,'2', '2021-01-08'), #42
    ('Blocking bad signals', 'Summary 43', 110500, '2019-08-01', '2023-01-01', 20, 6, 11, 152, 9, '5', '2017-05-05'), #43
    ('Measuring the change on the surface of earth', 'Summary 44', 789000, '2020-03-01', '2024-04-02', 21, 4, 10, 153, 10, '2', '2018-09-14'), #44
    ('Prediction of laptop sales', 'Summary 45', 150555, '2021-11-19', '2025-09-14', 16, 4, 25, 154, 11, '4', '2020-12-22'), #45
	('Corazon ', NULL, 329500, '2021-12-23', '2024-01-17', 16, 9, 18, 155, 3, '2', '2020-07-06'), #46
	('Fasten your seatbelt', 'Summary 47', 590500, '2021-09-23', '2024-06-25', 15, 3, 17, 156, 5, '5', '2020-10-02'), #47
	('Strategies for optimizing', 'Summary 48', 890500, '2021-04-25', '2023-09-15', 14, 1, 22, 157, 10, '1', '2019-09-10'), #48
    ('Decision making support', 'Summary 49', 320500, '2021-03-30', '2024-03-03', 13, 1, 15, 158, 5, '4', '2020-06-17'), #49
    ('4D Video Capturing', 'Summary 50', 650090, '2021-10-23', '2024-07-07', 12, 9, 14, 159, 6, '5', '2020-09-29'),#50
    ('Prime Minister', 'Summary 51', 780500, '2021-07-25', '2023-09-15', 14, 2, 14, 245, 10, '5', '2019-09-10'), #51
    ('Decision making for faster solutions', 'Summary 52', 490500, '2021-01-18', '2024-03-03', 13, 3, 14, 246, 5, '4', '2020-06-17'), #52
	('New solar system', 'Summary 40', 950090, '2021-10-23', '2024-07-07', 12, 9, 14, 220, 6, '5', '2020-10-21'), #53
    ('New satellites', 'Summary 41', 920000, '2021-04-14', '2024-06-25', 11, 8, 14, 221, 7, '3', '2019-09-21'), #54
    ('New parking', 'Summary 42',550500, '2021-02-12', '2026-01-01', 19, 7, 14, 222, 8,'2', '2021-02-02'), #55
    ('New roads', 'Summary 43', 150500, '2021-08-01', '2023-01-01', 20, 6, 14, 159, 9, '5', '2017-04-01'), #56
    ('Rennovation of old HQ', 'Summary 44', 289000, '2021-03-01', '2024-04-02', 21, 4, 14, 247, 10, '2', '2018-06-12'),#57
    ('Prediction for 2023', NULL, 429500, '2021-12-23', '2024-01-17', 16, 9, 15, 217, 3, '2', '2020-07-06'), #58
	('New seatbelts', 'Summary 47', 790500, '2021-09-23', '2024-06-25', 15, 3, 15, 218, 5, '5', '2020-10-02'), #59
	('New food menu', 'Summary 48', 990500, '2021-04-25', '2023-09-15', 14, 1, 15, 242, 10, '1', '2019-09-10'), #60
    ('Client support', 'Summary 49', 420500, '2021-03-30', '2024-03-03', 13, 1, 15, 158, 5, '4', '2020-06-17'),#61
    ('4D printing', 'Summary 50', 850090, '2021-10-23', '2024-07-07', 12, 9, 15, 242, 6, '5', '2020-09-29'), #62
    ('Update of satellites', 'Summary 51', 480500, '2021-07-25', '2023-09-15', 14, 2, 15, 243, 10, '5', '2019-09-10'), #63
    ('Mprizolitses me meli', 'Summary 52', 450500, '2021-01-18', '2024-03-03', 13, 3, 15, 244, 5, '4', '2020-06-17'), #64
    
    ('Rebuilding of a gym', 'Summary 47', 790500, '2022-01-23', '2024-06-25', 15, 3, 15, 218, 5, '5', '2020-10-02'), #65 10 PROJ START  2022 ORG 15
	('New electronic gym equipment', 'Summary 48', 990500, '2022-04-25', '2023-09-15', 14, 1, 15, 242, 10, '1', '2019-09-10'), #66
    ('Reconstruction of church', 'Summary 49', 420500, '2022-03-30', '2024-03-03', 13, 1, 15, 158, 5, '4', '2020-06-17'),#67
    ('EMP recovery', 'Summary 50', 850090, '2022-01-23', '2024-07-07', 12, 9, 15, 242, 6, '5', '2020-09-29'), #68
    ('Council team', 'Summary 51', 480500, '2022-02-25', '2023-09-15', 14, 2, 15, 243, 10, '5', '2019-09-10'), #69
    ('Building a new merch', 'Summary 52', 450500, '2022-01-18', '2024-03-03', 13, 3, 15, 244, 5, '4', '2020-06-17'), #70
    ('Statistics collection for NBA', 'Summary 47', 790500, '2022-03-23', '2024-06-25', 15, 3, 15, 218, 5, '5', '2020-10-02'), #71
	('Suggetions for better responisive time', 'Summary 48', 990500, '2022-04-25', '2023-09-15', 14, 1, 15, 242, 10, '1', '2019-09-10'), #72
    ('Tom Clancys suggetions', 'Summary 50', 850090, '2021-01-23', '2024-07-07', 12, 9, 15, 242, 6, '5', '2020-09-29'), #73
    ('Update of the electronic wheels', 'Summary 51', 480500, '2022-04-25', '2023-09-15', 14, 2, 15, 243, 10, '5', '2019-09-10'), #74
    
    ('Making new class', 'Summary 50', 650090, '2022-01-23', '2024-07-07', 12, 9, 14, 159, 6, '5', '2020-09-29'),#75 10 PROJ START 2022 ORG 14
    ('Elliniko koinovoulio', 'Summary 51', 780500, '2022-02-25', '2023-09-15', 14, 2, 14, 245, 10, '5', '2019-09-10'), #76
    ('ELIDEK expansion', 'Summary 52', 490500, '2022-01-18', '2024-03-03', 13, 3, 14, 246, 5, '4', '2020-06-17'), #77
	('Ideal museum', 'Summary 40', 950090, '2022-04-23', '2024-07-07', 12, 9, 14, 220, 6, '5', '2020-10-21'), #78
    ('Illusions center', 'Summary 41', 920000, '2022-04-14', '2024-06-25', 11, 8, 14, 221, 7, '3', '2019-09-21'), #79
    ('New parking', 'Summary 42',550500, '2022-05-12', '2025-01-01', 19, 7, 14, 222, 8,'2', '2021-02-02'), #80
    ('New roads', 'Summary 43', 150500, '2022-01-01', '2023-01-01', 20, 6, 14, 159, 9, '5', '2017-04-01'), #81
    ('Rennovation of old HQ', 'Summary 44', 289000, '2022-03-01', '2024-04-02', 21, 4, 14, 247, 10, '2', '2018-06-12'),#82
	('New satellites', 'Summary 41', 920000, '2022-04-14', '2024-06-25', 11, 8, 14, 221, 7, '3', '2019-09-21'), #83
    ('New roads', 'Summary 43', 150500, '2022-03-01', '2024-01-01', 20, 6, 14, 159, 9, '5', '2017-04-01'); #84
   
    
    
    
-- Insert works_on data
INSERT INTO works_on (project_id, researcher_id) VALUES
	(2, 1),(5, 3),(1, 7),(6,12),(9,13),(9,14),(1,15),(2,16),(5,17),(3,18),(9,19),(4,20),(4,21),(4,22),(1,23),(1,24),(2,25),(7,26),(7,27),(4,28),(1,29),(5,30),
    (22,60),(22,61),(22,62),(22,63),(21,64),(21,65),(21,66),(20,67),(20,68),(20,69),(19,70),(19,71),(19,72),(18,73),(18,74),(18,75),(17,76),(17,77),(17,78),
    (16,79),(16,80),(16,81),(18,82),(19,83),(19,84),(20,85),(20,86),(20,87),(21,88),(21,89),(21,90),(22,91),(22,92),(22,93),(21,94),(21,95),(21,96),(22,97),
    (22,98),(22,99),(22,100),(23,160),(23,161),(23,162),(23,163),(23,164),(24,165),(24,166),(24,167),(24,168),(24,169),(25,170),(25,171),(25,172),(25,173),
    (26,174),(26,175),(26,176),(27,177),(27,178),(27,179),(28,180),(28,181),(29,186),(29,182),(29,183),(29,184),(29,185),(30,187),(30,188),(30,189),(30,190),
    (31,191),(31,192),(31,193),(31,194),(32,195),(32,196),(32,197),(32,198),(32,199),(33,200),(33,201),(33,202),(34,203),(34,204),(34,205),(35,206),(35,207),
    (36,208),(36,209),(36,210),(37,215),(37,211),(37,212),(37,213),(37,214),(38,216),(39,217),(39,218),(40,219),(40,220),(40,221),(40,222),(40,223),(41,224),
    (41,225),(41,226),(42,227),(42,228),(43,229),(44,230),(44,231),(44,232),(44,233),(45,234),(46,235),(46,236),(47,237),(47,238),(47,239),(48,240),(48,241),
    (49,242),(49,243),(49,244),(50,245),(50,246),(50,247),(6,180),(6,181),(7,180),(7,181),(2,23),(8,180),(8,181),(6,27),(6,26),(8,26),(8,27),(10,19),(10,14),
    (11,14),(11,13),(11,9),(11,19),(50,220),(50,221),(16,245),(16,246),(40,245),(40,246),(39,242),(39,243),(49,217),(49,218),(17,243),(17,244),(42,39),(42,41),
    (14,227),(14,228),(51,246),(51,220),(51,247),(51,221),(51,222),(52,245),(52,247),(52,220),(52,221),(52,222),(53,221),(53,222),(53,159),(53,245),(53,246),
    (54,220),(54,222),(54,246),(54,245),(55,220),(55,221),(55,159),(56,222),(56,223),(57,246),(57,223),(57,222),(58,218),(58,242),(58,243),(58,244),(59,217),
    (59,242),(59,243),(59,244),(60,158),(60,243),(60,244),(61,242),(61,243),(61,244),(62,243),(62,244),(62,217),(63,244),(63,242),(63,217),(63,218),(64,242),
    (64,243),(55,245),(14,39);
    
-- Insert 64 is_about data
INSERT INTO is_about (project_id, field_name) VALUES
	(1, 'Computer Engineering'), (1, 'Mathematics'), (2, 'Biology'), (18, 'Literature'), 
    (4, 'Astronomy'), (5, 'Computer Engineering'), (5, 'Mathematics'), (11, 'Mathematics'),
    (6, 'Ancient Greek'), (7, 'Music'), (8, 'History'), (9, 'Programming'), 
    (9, 'Electronics'), (10, 'Electronics'), (12, 'Economics'), (13, 'Mathematics'),
    (14, 'Astronomy'), (15, 'Literature'), (17, 'Biology'), (20, 'Music'), 
    (22, 'Programming'), (22, 'Computer Engineering'), (23, 'Chemistry'), (24, 'Economics'),
    (25, 'Biology'), (27, 'Mathematics'), (26, 'Ancient Greek'), (28, 'History'), 
    (14, 'Programming'), (17, 'Mathematics'), (26, 'History'), (13, 'History'), 
    (3, 'Computer Engineering'), (7, 'Mathematics'), (9, 'Biology'), (12, 'Literature'), 
    (2, 'Programming'), (9, 'Computer Engineering'), (11, 'Chemistry'), (19, 'Economics'),
	(9, 'Astronomy'), (4, 'Literature'), (1, 'Biology'), (27, 'Music'), 
    (5, 'Ancient Greek'), (2, 'Music'), (23, 'History'), (30, 'Programming'), 
    (22, 'Biology'), (21, 'Mathematics'), (20, 'Ancient Greek'), (29, 'History'),
    (12, 'Programming'), (19, 'Mathematics'), (24, 'History'), (19, 'History'),
    (29, 'Literature'), (30, 'Computer Engineering'), (17, 'Chemistry'), (23, 'Economics'),
	(14, 'Literature'), (19, 'Computer Engineering'), (12, 'Chemistry'), (13, 'Economics');
    
-- Insert 30 deliverable data
INSERT INTO deliverable (project_id, title, summary, deliver_date) VALUES
	(1, 'deliver 1.1', 'summary 1.1', '2021-02-26'), (1, 'deliver 1.2', 'summary 1.2', '2022-05-21'), 
    (16, 'deliver 2.1', NULL, '2022-09-14'), (16, 'deliver 4.1', 'summary 4.1', '2023-08-30'),
    (5, 'deliver 5.1', 'summary 5.1', '1978-12-31'), (5, 'deliver 5.2', 'summary 5.2', '1978-05-20'),
    (5, 'deliver 5.3', NULL, '1979-01-01'), (8, 'deliver 8.1', 'summary 8.1', '2016-08-21'), 
    (8, 'deliver 8.2', NULL, '2017-09-19'), (10, 'deliver 10.1', 'summary 10.1', '2018-11-12'),
    (40, 'deliver 1.1', NULL, '2022-02-26'), (40, 'deliver 1.2', 'summary 1.2', '2023-05-21'), 
    (51, 'deliver 5.3', NULL, '2022-12-01'), (52, 'deliver 8.1', 'summary 8.1', '2023-01-21'),
    (52, 'deliver 8.2', NULL, '2022-09-19'), (52, 'deliver 10.1', 'summary 10.1', '2023-11-12'),
    (52, 'deliver 2.1', NULL, '2022-11-14'), (52, 'deliver 4.1', 'summary 4.1', '2023-08-30'),
    (54, 'deliver 5.3', NULL, '2022-04-01'), (54, 'deliver 8.1', 'summary 8.1', '2023-08-21'),
    (55, 'deliver 8.2', NULL, '2022-09-19'), (55, 'deliver 10.1', 'summary 10.1', '2023-11-12'),
	(58, 'deliver 1.1', NULL, '2022-02-26'), (58, 'deliver 1.2', 'summary 1.2', '2023-05-21'), 
    (59, 'deliver 2.1', NULL, '2022-11-14'), (59, 'deliver 4.1', 'summary 4.1', '2023-08-30'),
    (61, 'deliver 5.3', NULL, '2022-04-01'), (61, 'deliver 8.1', 'summary 8.1', '2023-08-21'), 
    (62, 'deliver 8.2', NULL, '2022-09-19'), (62, 'deliver 10.1', 'summary 10.1', '2023-11-12');
