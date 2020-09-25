DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS contract;
DROP TABLE IF EXISTS con_type;
DROP TABLE IF EXISTS con_stat;
DROP TABLE IF EXISTS tactics;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS enhancements;
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS relate_types;
DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS injuries;
DROP TABLE IF EXISTS sex;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  status TEXT NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

CREATE TABLE players (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  league INTEGER REFERENCES league (id),
  team INTEGER REFERENCES team (id),
  name TEXT NOT NULL,
  sex TEXT NOT NULL REFERENCES sex (type),
  region TEXT NOT NULL REFERENCES region (place),
  birthday DATE NOT NULL,
  personality TEXT NOT NULL REFERENCES personalities (type),
  # Gameplan stuff
  enhancement TEXT REFERENCES enhancement (type),
  tactic_1 TEXT REFERENCES tactics (type),
  tactic_2 TEXT REFERENCES tactics (type),
  tactic_3 TEXT REFERENCES tactics (type),
  tactic_4 TEXT REFERENCES tactics (type),
  tactic_5 TEXT REFERENCES tactics (type),
  # Stats and stuff
  acc INTEGER NOT NULL,
  eva INTEGER NOT NULL,
  iti INTEGER NOT NULL,
  psy INTEGER NOT NULL,
  sta INTEGER NOT NULL,
  kno INTEGER NOT NULL,
  ego INTEGER NOT NULL,
  pot INTEGER NOT NULL,
  # Statuses
  injury_length INTEGER,
  injury_severeity INTEGER,
  injury_type TEXT REFERENCES injuries (type),
  addiction TEXT REFERENCES enhancement (type)
);

CREATE TABLE contracts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  player INTEGER REFERENCES players (id),
  team INTEGER REFERENCES teams (id),
  contract_type TEXT references con_type (type),
  term INTEGER NOT NULL,
  status TEXT references con_status (type),
  game_cost INTEGER
);

CREATE TABLE con_type (
  type TEXT PRIMARY KEY,
);

CREATE TABLE con_status (
  type TEXT PRIMARY KEY,
);

CREATE TABLE tactics (
	type TEXT PRIMARY KEY
);

CREATE TABLE leagues (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

);

CREATE TABLE teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,


);

CREATE TABLE regions (
	place TEXT PRIMARY KEY

);

CREATE TABLE enhancements (
	type TEXT PRIMARY KEY

);

CREATE TABLE relationships (

);

CREATE TABLE relate_types (
	type TEXT PRIMARY KEY	
);

CREATE TABLE personalities (
	type TEXT PRIMARY KEY	
);

CREATE TABLE injuries (
	type TEXT PRIMARY KEY
);

# Set Default Data
INSERT INTO con_type ('type') VALUES ('Franchise');
INSERT INTO con_type ('type') VALUES  ('Standard');
INSERT INTO con_type ('type') VALUES  ('Minor');
INSERT INTO con_type ('type') VALUES  ('Two Way');
INSERT INTO con_type ('type') VALUES  ('Mentor');
INSERT INTO con_type ('type') VALUES  ('Scout');
INSERT INTO con_type ('type') VALUES  ('Medic');
INSERT INTO con_type ('type') VALUES  ('Marketeer');

INSERT INTO con_status ('type') VALUES ('Expired');
INSERT INTO con_status ('type') VALUES ('Open');
INSERT INTO con_status ('type') VALUES ('Signed');
INSERT INTO con_status ('type') VALUES ('Offered');

INSERT INTO personalities ('type') VALUES ('Stoic');
INSERT INTO personalities ('type') VALUES ('Cautious');
INSERT INTO personalities ('type') VALUES ('Spirited');
INSERT INTO personalities ('type') VALUES ('Cocky');
INSERT INTO personalities ('type') VALUES ('Inquisitiv');
INSERT INTO personalities ('type') VALUES ('Addictive');
INSERT INTO personalities ('type') VALUES ('Milquetoast');
INSERT INTO personalities ('type') VALUES ('Determine');
INSERT INTO personalities ('type') VALUES ('Amicable');
INSERT INTO personalities ('type') VALUES ('Abrasvie');
INSERT INTO personalities ('type') VALUES ('Gutsy');

INSERT INTO enhancements ('type') VALUES ('Cocaine');
INSERT INTO enhancements ('type') VALUES ('Marijunana');
INSERT INTO enhancements ('type') VALUES ('Adderall');
INSERT INTO enhancements ('type') VALUES ('Steroids');
INSERT INTO enhancements ('type') VALUES ('Nachos');
INSERT INTO enhancements ('type') VALUES ('Bluvihm');

INSERT INTO sex ('type') VALUES ('Male');
INSERT INTO sex ('type') VALUES ('Female');
INSERT INTO sex ('type') VALUES ('Both');
INSERT INTO sex ('type') VALUES ('Neither');
INSERT INTO sex ('type') VALUES ('Robot');
INSERT INTO sex ('type') VALUES ('Alien');

INSERT INTO injuries ('type') VALUES ('Broken Hand');
INSERT INTO injuries ('type') VALUES ('Twisted Ankle');
INSERT INTO injuries ('type') VALUES ('Temporary Blindness');
INSERT INTO injuries ('type') VALUES ('Bad Hairday');
INSERT INTO injuries ('type') VALUES ('Dislocated Shoulder');
INSERT INTO injuries ('type') VALUES ('Neck Sprain');

INSERT INTO relate_types ('type') VALUES ('Intimate Friends');
INSERT INTO relate_types ('type') VALUES ('Close Friends');
INSERT INTO relate_types ('type') VALUES ('Friend');
INSERT INTO relate_types ('type') VALUES ('Aquatence');
INSERT INTO relate_types ('type') VALUES ('Antagonist');
INSERT INTO relate_types ('type') VALUES ('Rival');
INSERT INTO relate_types ('type') VALUES ('Foe');

INSERT INTO relate_types ('place') VALUES ('Western US');
INSERT INTO relate_types ('place') VALUES ('Midwest US');
INSERT INTO relate_types ('place') VALUES ('Eastern US');
INSERT INTO relate_types ('place') VALUES ('Southern US');
INSERT INTO relate_types ('place') VALUES ('Eastern CA');
INSERT INTO relate_types ('place') VALUES ('Western CA');
INSERT INTO relate_types ('place') VALUES ('Latin America');
INSERT INTO relate_types ('place') VALUES ('Carribean');
INSERT INTO relate_types ('place') VALUES ('Japan');
INSERT INTO relate_types ('place') VALUES ('China');
INSERT INTO relate_types ('place') VALUES ('Korea');
INSERT INTO relate_types ('place') VALUES ('South Pacific');
INSERT INTO relate_types ('place') VALUES ('Scandinavia');
INSERT INTO relate_types ('place') VALUES ('Eastern Europe');
INSERT INTO relate_types ('place') VALUES ('Western Europe');
INSERT INTO relate_types ('place') VALUES ('Russia');
INSERT INTO relate_types ('place') VALUES ('Mediterranean');
INSERT INTO relate_types ('place') VALUES ('Middle East');
INSERT INTO relate_types ('place') VALUES ('Sub-Saharan Africa');
INSERT INTO relate_types ('place') VALUES ('Moon Colonies');
INSERT INTO relate_types ('place') VALUES ('Mars Colonies');
INSERT INTO relate_types ('place') VALUES ('Antartica');
INSERT INTO relate_types ('place') VALUES ('Deep Space Colonies');

# Test Data