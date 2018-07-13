SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

USE `musicgraphdb` ;


DROP TABLE IF EXISTS `users` ;

CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) ,
  `password` VARCHAR(32) NOT NULL,
  `is_active` int NOT NULL,
  PRIMARY KEY (`id`));

DROP TABLE IF EXISTS `keywords` ;

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `word` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


DROP TABLE IF EXISTS `genres` ;

CREATE TABLE IF NOT EXISTS `genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));



DROP TABLE IF EXISTS `artists` ;

CREATE TABLE IF NOT EXISTS `artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `id_genre` INT NOT NULL,
  PRIMARY KEY (`id`),
   FOREIGN KEY (`id_genre`)
  REFERENCES genres(`id`)
  );


DROP TABLE IF EXISTS `statistics` ;

CREATE TABLE IF NOT EXISTS `statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `positive_tweets` INT NULL,
  `negative_tweets` INT NULL,
  `total_tweets` INT NULL,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `id_artist` INT NULL,
  `id_genre` INT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`id_artist`)
  references artists(`id`),
  FOREIGN KEY (`id_genre`)
  REFERENCES genres(`id`)
  );

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO users (name, password, email, is_active) VALUES ("admin", "tbd", "admin@usach.cl", 1);

INSERT INTO artists (name, id_genre) VALUES ("The Beatles", 1);
INSERT INTO artists (name, id_genre) VALUES ("Queen", 1);
INSERT INTO artists (name, id_genre) VALUES ("The Rolling Stones", 1);
INSERT INTO artists (name, id_genre) VALUES ("Led Zeppelin", 1);
INSERT INTO artists (name, id_genre) VALUES ("Pink Floyd", 1);
INSERT INTO artists (name, id_genre) VALUES ("Nirvana", 1);
INSERT INTO artists (name, id_genre) VALUES ("Guns N' Roses", 1);
INSERT INTO artists (name, id_genre) VALUES ("Red Hot Chili Peppers", 1);
INSERT INTO artists (name, id_genre) VALUES ("Kiss", 1);
INSERT INTO artists (name, id_genre) VALUES ("Bon Jovi", 1);
INSERT INTO artists (name, id_genre) VALUES ("The Offspring", 1);
INSERT INTO artists (name, id_genre) VALUES ("Blink 182", 1);
INSERT INTO artists (name, id_genre) VALUES ("Florence + The Machine", 1);
INSERT INTO artists (name, id_genre) VALUES ("Linkin Park", 1);
INSERT INTO artists (name, id_genre) VALUES ("Snow Patrol", 1);
INSERT INTO artists (name, id_genre) VALUES ("The Killers", 1);
INSERT INTO artists (name, id_genre) VALUES ("Foo Fighters", 1);
INSERT INTO artists (name, id_genre) VALUES ("Thirty Seconds To Mars", 1);
INSERT INTO artists (name, id_genre) VALUES ("Paramore", 1);
INSERT INTO artists (name, id_genre) VALUES ("Avril Lavigne", 1);


INSERT INTO artists (name, id_genre) VALUES ("Iron Maiden", 2);
INSERT INTO artists (name, id_genre) VALUES ("Metallica", 2);
INSERT INTO artists (name, id_genre) VALUES ("Megadeth", 2);
INSERT INTO artists (name, id_genre) VALUES ("Black Sabbath", 2);
INSERT INTO artists (name, id_genre) VALUES ("Pantera", 2);
INSERT INTO artists (name, id_genre) VALUES ("AC-DC", 2);
INSERT INTO artists (name, id_genre) VALUES ("Scorpions", 2);
INSERT INTO artists (name, id_genre) VALUES ("Marilyn Manson", 2);
INSERT INTO artists (name, id_genre) VALUES ("Manowar", 2);
INSERT INTO artists (name, id_genre) VALUES ("Lordi", 2);
INSERT INTO artists (name, id_genre) VALUES ("System of a Down", 2);
INSERT INTO artists (name, id_genre) VALUES ("Alice In Chains", 2);
INSERT INTO artists (name, id_genre) VALUES ("Ghost", 2);
INSERT INTO artists (name, id_genre) VALUES ("Bullet For My Valentine", 2);
INSERT INTO artists (name, id_genre) VALUES ("Shinedown", 2);
INSERT INTO artists (name, id_genre) VALUES ("Marilyn Manson", 2);


INSERT INTO artists (name, id_genre) VALUES ("Sex pistols", 3);
INSERT INTO artists (name, id_genre) VALUES ("Ramones", 3);
INSERT INTO artists (name, id_genre) VALUES ("The clash", 3);
INSERT INTO artists (name, id_genre) VALUES ("Bad religion", 3);
INSERT INTO artists (name, id_genre) VALUES ("Green day", 3);
INSERT INTO artists (name, id_genre) VALUES ("Dead Kennedys", 3);
INSERT INTO artists (name, id_genre) VALUES ("Misfits", 3);
INSERT INTO artists (name, id_genre) VALUES ("NOFX", 3);
INSERT INTO artists (name, id_genre) VALUES ("The exploited", 3);
INSERT INTO artists (name, id_genre) VALUES ("Ataque 77", 3);
INSERT INTO artists (name, id_genre) VALUES ("La polla records", 3);
INSERT INTO artists (name, id_genre) VALUES ("The Lawrence arms", 3);
INSERT INTO artists (name, id_genre) VALUES ("Millencolin", 3);
INSERT INTO artists (name, id_genre) VALUES ("Rise against", 3);
INSERT INTO artists (name, id_genre) VALUES ("Pennywise", 3);
INSERT INTO artists (name, id_genre) VALUES ("Candy Hearts", 3);
INSERT INTO artists (name, id_genre) VALUES ("Knuckle Puck", 3);
INSERT INTO artists (name, id_genre) VALUES ("The Draft", 3);
INSERT INTO artists (name, id_genre) VALUES ("The Explosion", 3);


INSERT INTO artists (name, id_genre) VALUES ("Louis Armstrong", 4);
INSERT INTO artists (name, id_genre) VALUES ("John Coltrane", 4);
INSERT INTO artists (name, id_genre) VALUES ("Billie Holiday", 4);
INSERT INTO artists (name, id_genre) VALUES ("Miles Davis", 4);
INSERT INTO artists (name, id_genre) VALUES ("Charlie Parker", 4);
INSERT INTO artists (name, id_genre) VALUES ("Duke Ellington", 4);
INSERT INTO artists (name, id_genre) VALUES ("Thelonious Monk", 4);
INSERT INTO artists (name, id_genre) VALUES ("Count Basie", 4);
INSERT INTO artists (name, id_genre) VALUES ("Charles Mingus", 4);
INSERT INTO artists (name, id_genre) VALUES ("Dizzy Gillespie", 4);
INSERT INTO artists (name, id_genre) VALUES ("Michael J. Thomas", 4);
INSERT INTO artists (name, id_genre) VALUES ("Lin Rountree", 4);
INSERT INTO artists (name, id_genre) VALUES ("Rick Braun", 4);
INSERT INTO artists (name, id_genre) VALUES ("Norman Brown", 4);
INSERT INTO artists (name, id_genre) VALUES ("Nick Colionne", 4);
INSERT INTO artists (name, id_genre) VALUES ("Melinda Doolittle", 4);
INSERT INTO artists (name, id_genre) VALUES ("Ella Fitzgerald", 4);
INSERT INTO artists (name, id_genre) VALUES ("Gregory Porter", 4);
INSERT INTO artists (name, id_genre) VALUES ("Billie Eckstine", 4);
INSERT INTO artists (name, id_genre) VALUES ("Johnny Hartman", 4);
INSERT INTO artists (name, id_genre) VALUES ("James Brown", 4);
INSERT INTO artists (name, id_genre) VALUES ("Till Brönner", 4);
INSERT INTO artists (name, id_genre) VALUES ("Rosemary Clooney", 4);
INSERT INTO artists (name, id_genre) VALUES ("Blosson Dearie", 4);


INSERT INTO artists (name, id_genre) VALUES ("Michael Jackson", 5);
INSERT INTO artists (name, id_genre) VALUES ("Madonna", 5);
INSERT INTO artists (name, id_genre) VALUES ("Rihanna", 5);
INSERT INTO artists (name, id_genre) VALUES ("Lady Gaga", 5);
INSERT INTO artists (name, id_genre) VALUES ("Britney Spears", 5);
INSERT INTO artists (name, id_genre) VALUES ("Katy Perry", 5);
INSERT INTO artists (name, id_genre) VALUES ("Justin Timberlake", 5);
INSERT INTO artists (name, id_genre) VALUES ("U2", 5);
INSERT INTO artists (name, id_genre) VALUES ("Beyoncé", 5);
INSERT INTO artists (name, id_genre) VALUES ("Christina Aguilera", 5);
INSERT INTO artists (name, id_genre) VALUES ("Miley Cyrus", 5);
INSERT INTO artists (name, id_genre) VALUES ("Demi lovato", 5);
INSERT INTO artists (name, id_genre) VALUES ("Taylor Swift", 5);
INSERT INTO artists (name, id_genre) VALUES ("Shakira", 5);
INSERT INTO artists (name, id_genre) VALUES ("Dua Lipa", 5);
INSERT INTO artists (name, id_genre) VALUES ("Camila Cabello", 5);
INSERT INTO artists (name, id_genre) VALUES ("Sofia Reyes", 5);
INSERT INTO artists (name, id_genre) VALUES ("Ed Sheeran", 5);
INSERT INTO artists (name, id_genre) VALUES ("OneRepublic", 5);
INSERT INTO artists (name, id_genre) VALUES ("Maroon 5", 5);
INSERT INTO artists (name, id_genre) VALUES ("Charlie Puth", 5);
INSERT INTO artists (name, id_genre) VALUES ("Shawn Mendes", 5);


INSERT INTO artists (name, id_genre) VALUES ("Eminem", 6);
INSERT INTO artists (name, id_genre) VALUES ("Porta", 6);
INSERT INTO artists (name, id_genre) VALUES ("Snoop Dogg", 6);
INSERT INTO artists (name, id_genre) VALUES ("Tupac", 6);
INSERT INTO artists (name, id_genre) VALUES ("50 Cent", 6);
INSERT INTO artists (name, id_genre) VALUES ("Ice Cube", 6);
INSERT INTO artists (name, id_genre) VALUES ("Dr.Dre", 6);
INSERT INTO artists (name, id_genre) VALUES ("Chyste mc", 6);
INSERT INTO artists (name, id_genre) VALUES ("Nach", 6);
INSERT INTO artists (name, id_genre) VALUES ("Zpu", 6);
INSERT INTO artists (name, id_genre) VALUES ("Machine Gun Kelly", 6);
INSERT INTO artists (name, id_genre) VALUES ("Lil Pump", 6);
INSERT INTO artists (name, id_genre) VALUES ("Drake", 6);
INSERT INTO artists (name, id_genre) VALUES ("BlocBoy JB", 6);
INSERT INTO artists (name, id_genre) VALUES ("Saweetie", 6);
INSERT INTO artists (name, id_genre) VALUES ("Meek Mill", 6);
INSERT INTO artists (name, id_genre) VALUES ("Yung Gravy", 6);
INSERT INTO artists (name, id_genre) VALUES ("YoungBoy Never Broke Again", 6);
INSERT INTO artists (name, id_genre) VALUES ("Chance The Rapper", 6);
INSERT INTO artists (name, id_genre) VALUES ("J. Cole", 6);
INSERT INTO artists (name, id_genre) VALUES ("Rich The Kid", 6);
INSERT INTO artists (name, id_genre) VALUES ("Cardi B", 6);
INSERT INTO artists (name, id_genre) VALUES ("NF", 6);
INSERT INTO artists (name, id_genre) VALUES ("Nicki Minaj", 6);
INSERT INTO artists (name, id_genre) VALUES ("G Herbo", 6);
INSERT INTO artists (name, id_genre) VALUES ("G-Eazy", 6);
INSERT INTO artists (name, id_genre) VALUES ("Joyner Lucas", 6);
INSERT INTO artists (name, id_genre) VALUES ("Remy Ma", 6);


INSERT INTO artists (name, id_genre) VALUES ("Daft punk", 7);
INSERT INTO artists (name, id_genre) VALUES ("Massive Atack", 7);
INSERT INTO artists (name, id_genre) VALUES ("The prodigy", 7);
INSERT INTO artists (name, id_genre) VALUES ("Air", 7);
INSERT INTO artists (name, id_genre) VALUES ("Moby", 7);
INSERT INTO artists (name, id_genre) VALUES ("The Chemical Brothers", 7);
INSERT INTO artists (name, id_genre) VALUES ("Goldfrapp", 7);
INSERT INTO artists (name, id_genre) VALUES ("The knife", 7);
INSERT INTO artists (name, id_genre) VALUES ("Crystal Castles", 7);
INSERT INTO artists (name, id_genre) VALUES ("Lamb", 7);
INSERT INTO artists (name, id_genre) VALUES ("The Chainsmokers", 7);
INSERT INTO artists (name, id_genre) VALUES ("Kygo", 7);
INSERT INTO artists (name, id_genre) VALUES ("Avicii", 7);
INSERT INTO artists (name, id_genre) VALUES ("Zedd", 7);
INSERT INTO artists (name, id_genre) VALUES ("Jack Ü", 7);
INSERT INTO artists (name, id_genre) VALUES ("Calvin Harris", 7);
INSERT INTO artists (name, id_genre) VALUES ("AJ Salvatore, Fluencee", 7);
INSERT INTO artists (name, id_genre) VALUES ("Gorillaz", 7);



INSERT INTO artists (name, id_genre) VALUES ("Marama", 8);
INSERT INTO artists (name, id_genre) VALUES ("Rombai", 8);
INSERT INTO artists (name, id_genre) VALUES ("Amar Azul", 8);
INSERT INTO artists (name, id_genre) VALUES ("Combo tortuga", 8);
INSERT INTO artists (name, id_genre) VALUES ("Chico Trujillo", 8);
INSERT INTO artists (name, id_genre) VALUES ("Los Charros", 8);
INSERT INTO artists (name, id_genre) VALUES ("Yerba Brava", 8);
INSERT INTO artists (name, id_genre) VALUES ("Guachupé", 8);
INSERT INTO artists (name, id_genre) VALUES ("Villa Cariño", 8);
INSERT INTO artists (name, id_genre) VALUES ("La sonora de Tommy Rey", 8);
INSERT INTO artists (name, id_genre) VALUES ("Antonio Rios", 8);


INSERT INTO artists (name, id_genre) VALUES ("Mozart (Wolfgang Amadeus Mozart)", 9);
INSERT INTO artists (name, id_genre) VALUES ("Beethoven (Ludwig van Beethoven)", 9);
INSERT INTO artists (name, id_genre) VALUES ("Tchaikovski (Piotr Ilich Chaikovski)", 9);
INSERT INTO artists (name, id_genre) VALUES ("Chopin (Frédéric Chopin)", 9);
INSERT INTO artists (name, id_genre) VALUES ("Vivaldi (Antoni Vivaldi)", 9);
INSERT INTO artists (name, id_genre) VALUES ("Richard Wagner ", 9);
INSERT INTO artists (name, id_genre) VALUES ("Johannes Brahms", 9);
INSERT INTO artists (name, id_genre) VALUES ("Igor Stravinski ", 9);
INSERT INTO artists (name, id_genre) VALUES ("Claude Debussy", 9);


INSERT INTO artists (name, id_genre) VALUES ("Alexis y Fido", 10);
INSERT INTO artists (name, id_genre) VALUES ("Bad Bunny", 10);
INSERT INTO artists (name, id_genre) VALUES ("Becky G", 10);
INSERT INTO artists (name, id_genre) VALUES ("CNCO", 10);
INSERT INTO artists (name, id_genre) VALUES ("Daddy Yankee", 10);
INSERT INTO artists (name, id_genre) VALUES ("Danny Ocean", 10);
INSERT INTO artists (name, id_genre) VALUES ("Don Omar", 10);
INSERT INTO artists (name, id_genre) VALUES ("Enrique Iglesias", 10);
INSERT INTO artists (name, id_genre) VALUES ("J Balvin", 10);
INSERT INTO artists (name, id_genre) VALUES ("Maluma", 10);
INSERT INTO artists (name, id_genre) VALUES ("Natti Natasha", 10);
INSERT INTO artists (name, id_genre) VALUES ("Nicky Jam ", 10);
INSERT INTO artists (name, id_genre) VALUES ("Ozuna", 10);
INSERT INTO artists (name, id_genre) VALUES ("Piso 21", 10);
INSERT INTO artists (name, id_genre) VALUES ("Pitbull", 10);
INSERT INTO artists (name, id_genre) VALUES ("Princesa Alba", 10);
INSERT INTO artists (name, id_genre) VALUES ("Wisin", 10);
INSERT INTO artists (name, id_genre) VALUES ("Yandel", 10);
INSERT INTO artists (name, id_genre) VALUES ("Zion & Lennox", 10);


INSERT INTO artists (name, id_genre) VALUES ("Alejandro Filio", 11);
INSERT INTO artists (name, id_genre) VALUES ("Angelo Escobar", 11);
INSERT INTO artists (name, id_genre) VALUES ("Eduardo Peralta", 11);
INSERT INTO artists (name, id_genre) VALUES ("León Gieco", 11);
INSERT INTO artists (name, id_genre) VALUES ("Manuel García", 11);
INSERT INTO artists (name, id_genre) VALUES ("Noel Nicola", 11);
INSERT INTO artists (name, id_genre) VALUES ("Pablo Milanés", 11);
INSERT INTO artists (name, id_genre) VALUES ("Silvio Rodriguez", 11);
INSERT INTO artists (name, id_genre) VALUES ("Sindo Garay", 11);
INSERT INTO artists (name, id_genre) VALUES ("Victor Heredia", 11);

INSERT INTO artists (name, id_genre) VALUES ("B.B king", 11);
INSERT INTO artists (name, id_genre) VALUES ("Blind Lemon", 11);
INSERT INTO artists (name, id_genre) VALUES ("Eric Clapton", 11);
INSERT INTO artists (name, id_genre) VALUES ("Muddy Waters", 11);
INSERT INTO artists (name, id_genre) VALUES ("Ray Charles", 11);
INSERT INTO artists (name, id_genre) VALUES ("Robert Johnson", 11);


INSERT INTO artists (name, id_genre) VALUES ("Asleep at the wheel", 12);
INSERT INTO artists (name, id_genre) VALUES ("Brad Paisley", 12);
INSERT INTO artists (name, id_genre) VALUES ("Dixie Chicks", 12);
INSERT INTO artists (name, id_genre) VALUES ("Hudson Moore", 12);
INSERT INTO artists (name, id_genre) VALUES ("Josh Turner", 12);
INSERT INTO artists (name, id_genre) VALUES ("Keith Urban", 12);
INSERT INTO artists (name, id_genre) VALUES ("Lady Antebellum", 12);
INSERT INTO artists (name, id_genre) VALUES ("Little Big Town", 12);
INSERT INTO artists (name, id_genre) VALUES ("Sam Hunt", 12);
INSERT INTO artists (name, id_genre) VALUES ("Sugarland", 12);
INSERT INTO artists (name, id_genre) VALUES ("The Band Perry", 12);
INSERT INTO artists (name, id_genre) VALUES ("The Carter Family", 12);
INSERT INTO artists (name, id_genre) VALUES ("The Everly Brothers", 12);
INSERT INTO artists (name, id_genre) VALUES ("yodeling boy", 12);
INSERT INTO artists (name, id_genre) VALUES ("Zac Brown Band", 12);


INSERT INTO artists (name, id_genre) VALUES ("Barry White", 13);
INSERT INTO artists (name, id_genre) VALUES ("Bee Gees", 13);
INSERT INTO artists (name, id_genre) VALUES ("Boney M", 13);
INSERT INTO artists (name, id_genre) VALUES ("Chic", 13);
INSERT INTO artists (name, id_genre) VALUES ("Diana Ross", 13);
INSERT INTO artists (name, id_genre) VALUES ("Donna Summer", 13);
INSERT INTO artists (name, id_genre) VALUES ("Gloria Gaynor", 13);
INSERT INTO artists (name, id_genre) VALUES ("Lipps Inc", 13);
INSERT INTO artists (name, id_genre) VALUES ("Patrick Hernandez", 13);
INSERT INTO artists (name, id_genre) VALUES ("Rick James", 13);
INSERT INTO artists (name, id_genre) VALUES ("The Jackson 5", 13);
INSERT INTO artists (name, id_genre) VALUES ("The Trammps", 13);
INSERT INTO artists (name, id_genre) VALUES ("Village People", 13);


INSERT INTO artists (name, id_genre) VALUES ("Bob Dylan", 14);
INSERT INTO artists (name, id_genre) VALUES ("Caetano Veloso", 14);
INSERT INTO artists (name, id_genre) VALUES ("Illapu", 14);
INSERT INTO artists (name, id_genre) VALUES ("Inti illimani", 14);
INSERT INTO artists (name, id_genre) VALUES ("Los jaiva", 14);
INSERT INTO artists (name, id_genre) VALUES ("Margot Loyola", 14);
INSERT INTO artists (name, id_genre) VALUES ("Neil Young", 14);
INSERT INTO artists (name, id_genre) VALUES ("Patricio Manns", 14);
INSERT INTO artists (name, id_genre) VALUES ("Quilapayún", 14);
INSERT INTO artists (name, id_genre) VALUES ("Victor Jara", 14);
INSERT INTO artists (name, id_genre) VALUES ("Violeta Parra", 14);


INSERT INTO artists (name, id_genre) VALUES ("Average White Band", 15);
INSERT INTO artists (name, id_genre) VALUES ("Bruno Mars", 15);
INSERT INTO artists (name, id_genre) VALUES ("Cameo", 15);
INSERT INTO artists (name, id_genre) VALUES ("Chanchos en piedra", 15);
INSERT INTO artists (name, id_genre) VALUES ("Commodores", 15);
INSERT INTO artists (name, id_genre) VALUES ("Danny Gokey", 15);
INSERT INTO artists (name, id_genre) VALUES ("Earth, Wind & Fire", 15);
INSERT INTO artists (name, id_genre) VALUES ("Funkadelic", 15);
INSERT INTO artists (name, id_genre) VALUES ("Jamiroquai", 15);
INSERT INTO artists (name, id_genre) VALUES ("Kool and the Gang", 15);
INSERT INTO artists (name, id_genre) VALUES ("Los tetas", 15);
INSERT INTO artists (name, id_genre) VALUES ("Mamma Soul", 15);
INSERT INTO artists (name, id_genre) VALUES ("Mtume", 15);
INSERT INTO artists (name, id_genre) VALUES ("Papanegro", 15);
INSERT INTO artists (name, id_genre) VALUES ("Parliament", 15);
INSERT INTO artists (name, id_genre) VALUES ("Primus", 15);
INSERT INTO artists (name, id_genre) VALUES ("Rick James", 15);
INSERT INTO artists (name, id_genre) VALUES ("Stevie Wonder", 15);
INSERT INTO artists (name, id_genre) VALUES ("Zapp", 15);


INSERT INTO artists (name, id_genre) VALUES ("Artic Monkeys", 16);
INSERT INTO artists (name, id_genre) VALUES ("Blur", 16);
INSERT INTO artists (name, id_genre) VALUES ("Bright eyes", 16);
INSERT INTO artists (name, id_genre) VALUES ("Dinosaur Jr.", 16);
INSERT INTO artists (name, id_genre) VALUES ("Echosmith", 16);
INSERT INTO artists (name, id_genre) VALUES ("Florence + The Machine", 16);
INSERT INTO artists (name, id_genre) VALUES ("Foals", 16);
INSERT INTO artists (name, id_genre) VALUES ("Foster the People", 16);
INSERT INTO artists (name, id_genre) VALUES ("Franz Ferdinand", 16);
INSERT INTO artists (name, id_genre) VALUES ("Glass Animals", 16);
INSERT INTO artists (name, id_genre) VALUES ("HAIM", 16);
INSERT INTO artists (name, id_genre) VALUES ("Imagine Dragons", 16);
INSERT INTO artists (name, id_genre) VALUES ("Javiera Mena", 16);
INSERT INTO artists (name, id_genre) VALUES ("Kings of Leon", 16);
INSERT INTO artists (name, id_genre) VALUES ("Kodaline", 16);
INSERT INTO artists (name, id_genre) VALUES ("La ley", 16);
INSERT INTO artists (name, id_genre) VALUES ("Lana del Rey", 16);
INSERT INTO artists (name, id_genre) VALUES ("LCD Soundsystem", 16);
INSERT INTO artists (name, id_genre) VALUES ("Lucybell", 16);
INSERT INTO artists (name, id_genre) VALUES ("M83", 16);
INSERT INTO artists (name, id_genre) VALUES ("Pavement", 16);
INSERT INTO artists (name, id_genre) VALUES ("Plastic cup", 16);
INSERT INTO artists (name, id_genre) VALUES ("Radiohead", 16);
INSERT INTO artists (name, id_genre) VALUES ("Spoon", 16);
INSERT INTO artists (name, id_genre) VALUES ("Sufjan Stevens", 16);
INSERT INTO artists (name, id_genre) VALUES ("The Killers", 16);
INSERT INTO artists (name, id_genre) VALUES ("The Strokes", 16);
INSERT INTO artists (name, id_genre) VALUES ("The Vaselines", 16);
INSERT INTO artists (name, id_genre) VALUES ("The White Stripes", 16);
INSERT INTO artists (name, id_genre) VALUES ("The XX", 16);
INSERT INTO artists (name, id_genre) VALUES ("Tom Walker", 16);
INSERT INTO artists (name, id_genre) VALUES ("Yo la tengo", 16);


INSERT INTO artists (name, id_genre) VALUES ("Alborosie", 17);
INSERT INTO artists (name, id_genre) VALUES ("Bob Marley", 17);
INSERT INTO artists (name, id_genre) VALUES ("Burning Spear", 17);
INSERT INTO artists (name, id_genre) VALUES ("Cultura Profético", 17);
INSERT INTO artists (name, id_genre) VALUES ("Damian Marley", 17);
INSERT INTO artists (name, id_genre) VALUES ("Dread Mar-I", 17);
INSERT INTO artists (name, id_genre) VALUES ("Ganja Smuggling", 17);
INSERT INTO artists (name, id_genre) VALUES ("Gondwana", 17);
INSERT INTO artists (name, id_genre) VALUES ("Inna de Yard", 17);
INSERT INTO artists (name, id_genre) VALUES ("Jimmy Cliff", 17);
INSERT INTO artists (name, id_genre) VALUES ("Jr. Gong", 17);
INSERT INTO artists (name, id_genre) VALUES ("King General", 17);
INSERT INTO artists (name, id_genre) VALUES ("Lee Perry", 17);
INSERT INTO artists (name, id_genre) VALUES ("Mellow Mood", 17);
INSERT INTO artists (name, id_genre) VALUES ("Midnite", 17);
INSERT INTO artists (name, id_genre) VALUES ("Movimiento Original", 17);
INSERT INTO artists (name, id_genre) VALUES ("Mungo's Hi-Fi", 17);
INSERT INTO artists (name, id_genre) VALUES ("Peter Tosh", 17);
INSERT INTO artists (name, id_genre) VALUES ("Protoje", 17);
INSERT INTO artists (name, id_genre) VALUES ("Shamanes", 17);
INSERT INTO artists (name, id_genre) VALUES ("SOJA", 17);
INSERT INTO artists (name, id_genre) VALUES ("Stephen Marley", 17);
INSERT INTO artists (name, id_genre) VALUES ("Stick Figure", 17);
INSERT INTO artists (name, id_genre) VALUES ("UB40", 17);


INSERT INTO artists (name, id_genre) VALUES ("Alton Ellis", 18);
INSERT INTO artists (name, id_genre) VALUES ("Desmond Dekker", 18);
INSERT INTO artists (name, id_genre) VALUES ("Desorden Público", 18);
INSERT INTO artists (name, id_genre) VALUES ("Doctor Krapula", 18);
INSERT INTO artists (name, id_genre) VALUES ("Guachupé", 18);
INSERT INTO artists (name, id_genre) VALUES ("Inspector", 18);
INSERT INTO artists (name, id_genre) VALUES ("Jimmy Cliff", 18);
INSERT INTO artists (name, id_genre) VALUES ("Karma", 18);
INSERT INTO artists (name, id_genre) VALUES ("La Sonora Skandalera", 18);
INSERT INTO artists (name, id_genre) VALUES ("La Tremenda Korte", 18);
INSERT INTO artists (name, id_genre) VALUES ("La maldita vecindad", 18);
INSERT INTO artists (name, id_genre) VALUES ("La matatena", 18);
INSERT INTO artists (name, id_genre) VALUES ("Lord Tanamo", 18);
INSERT INTO artists (name, id_genre) VALUES ("Los Calzones Roto", 18);
INSERT INTO artists (name, id_genre) VALUES ("Los Fabulosos Cadillacs", 18);
INSERT INTO artists (name, id_genre) VALUES ("Los autenticos Decadentes", 18);
INSERT INTO artists (name, id_genre) VALUES ("Madness", 18);
INSERT INTO artists (name, id_genre) VALUES ("Maskatesta", 18);
INSERT INTO artists (name, id_genre) VALUES ("Molotov", 18);
INSERT INTO artists (name, id_genre) VALUES ("Prince Buster", 18);
INSERT INTO artists (name, id_genre) VALUES ("Skaleno", 18);
INSERT INTO artists (name, id_genre) VALUES ("The Skatalites", 18);
INSERT INTO artists (name, id_genre) VALUES ("The Specials", 18);
INSERT INTO artists (name, id_genre) VALUES ("The Wailers", 18);
INSERT INTO artists (name, id_genre) VALUES ("ska-p", 18);


INSERT INTO artists (name, id_genre) VALUES ("Celia Cruz", 19);
INSERT INTO artists (name, id_genre) VALUES ("Chichi Peralta", 19);
INSERT INTO artists (name, id_genre) VALUES ("Eddie Santiago", 19);
INSERT INTO artists (name, id_genre) VALUES ("Frankie Ruiz", 19);
INSERT INTO artists (name, id_genre) VALUES ("Gilberto Santa Rosa", 19);
INSERT INTO artists (name, id_genre) VALUES ("Grupo Niche", 19);
INSERT INTO artists (name, id_genre) VALUES ("Hector Lavoe", 19);
INSERT INTO artists (name, id_genre) VALUES ("Jerry Rivera", 19);
INSERT INTO artists (name, id_genre) VALUES ("Joe Arroyo", 19);
INSERT INTO artists (name, id_genre) VALUES ("La India", 19);
INSERT INTO artists (name, id_genre) VALUES ("Lalo Rodríguez", 19);
INSERT INTO artists (name, id_genre) VALUES ("Marc Anthony", 19);
INSERT INTO artists (name, id_genre) VALUES ("Oscar D' León", 19);
INSERT INTO artists (name, id_genre) VALUES ("Ruben Blades", 19);
INSERT INTO artists (name, id_genre) VALUES ("Tito Puente", 19);
INSERT INTO artists (name, id_genre) VALUES ("Tony Vega", 19);
INSERT INTO artists (name, id_genre) VALUES ("Willie Colon", 19);
INSERT INTO artists (name, id_genre) VALUES ("Yiyo Sarante", 19);


INSERT INTO artists (name, id_genre) VALUES ("Antonio Carlos Jobim", 20);
INSERT INTO artists (name, id_genre) VALUES ("Astrud Gilberto", 20);
INSERT INTO artists (name, id_genre) VALUES ("Bebel Gilberto", 20);
INSERT INTO artists (name, id_genre) VALUES ("BREEZE", 20);
INSERT INTO artists (name, id_genre) VALUES ("Caetano Veloso", 20);
INSERT INTO artists (name, id_genre) VALUES ("Carlos Lyra", 20);
INSERT INTO artists (name, id_genre) VALUES ("Chico Buarque", 20);
INSERT INTO artists (name, id_genre) VALUES ("Elis Regina", 20);
INSERT INTO artists (name, id_genre) VALUES ("Gal Costa", 20);
INSERT INTO artists (name, id_genre) VALUES ("Gilberto Gil", 20);
INSERT INTO artists (name, id_genre) VALUES ("Toquinho", 20);
INSERT INTO artists (name, id_genre) VALUES ("Vinícius de Moraes", 20);


INSERT INTO artists (name, id_genre) VALUES ("Alexander Pires", 21);
INSERT INTO artists (name, id_genre) VALUES ("Alex Ubago", 21);
INSERT INTO artists (name, id_genre) VALUES ("Bryan Adams", 21);
INSERT INTO artists (name, id_genre) VALUES ("Camila Gallardo", 21);
INSERT INTO artists (name, id_genre) VALUES ("Camilo Sesto", 21);
INSERT INTO artists (name, id_genre) VALUES ("Chayanne", 21);
INSERT INTO artists (name, id_genre) VALUES ("David Bisbal", 21);
INSERT INTO artists (name, id_genre) VALUES ("Franco de Vita", 21);
INSERT INTO artists (name, id_genre) VALUES ("Jesse & Joy", 21);
INSERT INTO artists (name, id_genre) VALUES ("José José", 21);
INSERT INTO artists (name, id_genre) VALUES ("Juanes", 21);
INSERT INTO artists (name, id_genre) VALUES ("Kany García", 21);
INSERT INTO artists (name, id_genre) VALUES ("Luciano Pereyra", 21);
INSERT INTO artists (name, id_genre) VALUES ("Luis Fonsi", 21);
INSERT INTO artists (name, id_genre) VALUES ("Luis Miguel", 21);
INSERT INTO artists (name, id_genre) VALUES ("Matisse", 21);
INSERT INTO artists (name, id_genre) VALUES ("Melendi", 21);
INSERT INTO artists (name, id_genre) VALUES ("Mon Laferte", 21);
INSERT INTO artists (name, id_genre) VALUES ("Pablo Alborán", 21);
INSERT INTO artists (name, id_genre) VALUES ("Reik", 21);
INSERT INTO artists (name, id_genre) VALUES ("Ricardo Arjona", 21);
INSERT INTO artists (name, id_genre) VALUES ("Ricardo Montaner", 21);
INSERT INTO artists (name, id_genre) VALUES ("Sebastián Yatra", 21);
INSERT INTO artists (name, id_genre) VALUES ("Sin Bandera", 21);


INSERT INTO genres (name) VALUES ("Rock");
INSERT INTO genres (name) VALUES ("Metal");
INSERT INTO genres (name) VALUES ("Punk");
INSERT INTO genres (name) VALUES ("Jazz");
INSERT INTO genres (name) VALUES ("Pop");
INSERT INTO genres (name) VALUES ("Rap");
INSERT INTO genres (name) VALUES ("Electronica");
INSERT INTO genres (name) VALUES ("Cumbia");
INSERT INTO genres (name) VALUES ("Clasica");
INSERT INTO genres (name) VALUES ("Reggaeton");
INSERT INTO genres (name) VALUES ("Trova");
INSERT INTO genres (name) VALUES ("Blues");
INSERT INTO genres (name) VALUES ("Country");
INSERT INTO genres (name) VALUES ("Disco");
INSERT INTO genres (name) VALUES ("Folcklorica");
INSERT INTO genres (name) VALUES ("Funk");
INSERT INTO genres (name) VALUES ("Indie");
INSERT INTO genres (name) VALUES ("Reggae");
INSERT INTO genres (name) VALUES ("Ska");
INSERT INTO genres (name) VALUES ("Salsa");
INSERT INTO genres (name) VALUES ("Bossa Nova");
INSERT INTO genres (name) VALUES ("Balada");


