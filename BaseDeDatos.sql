SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

USE `musicgraphdb` ;


DROP TABLE IF EXISTS `admins` ;

CREATE TABLE IF NOT EXISTS `admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) ,
  `password` VARCHAR(32) NOT NULL,
  `is_active` int NOT NULL,
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
  `positive_tweets` FLOAT NULL,
  `negative_tweets` FLOAT NULL,
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


DROP TABLE IF EXISTS `user_statistics` ;

CREATE TABLE IF NOT EXISTS `user_statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `retweets` INT NULL,
  `followers` INT NULL,
  `id_artist` INT NULL,
  `last_tweet` VARCHAR(255) NULL,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`id_artist`)
  references artists(`id`)
  );

DROP TABLE IF EXISTS `influyent_user` ;

CREATE TABLE IF NOT EXISTS `influyent_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `followers` INT NULL,
  PRIMARY KEY(`id`)
  );

DROP TABLE IF EXISTS `common_user` ;

CREATE TABLE IF NOT EXISTS `common_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `id_influyent_user` INT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`id_influyent_user`)
  references influyent_user(`id`)
  );

DROP TABLE IF EXISTS `influyent_user_artist` ;

CREATE TABLE IF NOT EXISTS `influyent_user_artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `last_tweet` VARCHAR(255) NULL,
  `retweets` INT NULL,
  `date` TIMESTAMP NULL,
  `id_influyent_user` INT NULL,
  `id_artist` INT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`id_influyent_user`)
  references influyent_user(`id`),
  FOREIGN KEY (`id_artist`)
  REFERENCES artists(`id`)
  );

DROP TABLE IF EXISTS `common_user_artist` ;

CREATE TABLE IF NOT EXISTS `common_user_artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `last_tweet` VARCHAR(255) NULL,
  `retweets` INT NULL,
  `date` TIMESTAMP NULL,
  `id_common_user` INT NULL,
  `id_artist` INT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`id_common_user`)
  references common_user(`id`),
  FOREIGN KEY (`id_artist`)
  REFERENCES artists(`id`)
  );

DROP TABLE IF EXISTS `geostatistics` ;

CREATE TABLE IF NOT EXISTS `geostatistic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `positive_tweets` FLOAT NULL,
  `negative_tweets` FLOAT NULL,
  `region` VARCHAR(255) NULL,
  `commune` VARCHAR(255) NULL,
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


INSERT INTO admins (name, password, email, is_active) VALUES ("admin", "tbd", "admin@usach.cl", 1);

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
INSERT INTO artists (name, id_genre) VALUES ("Bach (Johann Sebastian Bach)", 9);
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

INSERT INTO artists (name, id_genre) VALUES ("B.B king", 12);
INSERT INTO artists (name, id_genre) VALUES ("Blind Lemon", 12);
INSERT INTO artists (name, id_genre) VALUES ("Eric Clapton", 12);
INSERT INTO artists (name, id_genre) VALUES ("Muddy Waters", 12);
INSERT INTO artists (name, id_genre) VALUES ("Ray Charles", 12);
INSERT INTO artists (name, id_genre) VALUES ("Robert Johnson", 12);


INSERT INTO artists (name, id_genre) VALUES ("Asleep at the wheel", 13);
INSERT INTO artists (name, id_genre) VALUES ("Brad Paisley", 13);
INSERT INTO artists (name, id_genre) VALUES ("Dixie Chicks", 13);
INSERT INTO artists (name, id_genre) VALUES ("Hudson Moore", 13);
INSERT INTO artists (name, id_genre) VALUES ("Josh Turner", 13);
INSERT INTO artists (name, id_genre) VALUES ("Keith Urban", 13);
INSERT INTO artists (name, id_genre) VALUES ("Lady Antebellum", 13);
INSERT INTO artists (name, id_genre) VALUES ("Little Big Town", 13);
INSERT INTO artists (name, id_genre) VALUES ("Sam Hunt", 13);
INSERT INTO artists (name, id_genre) VALUES ("Sugarland", 13);
INSERT INTO artists (name, id_genre) VALUES ("The Band Perry", 13);
INSERT INTO artists (name, id_genre) VALUES ("The Carter Family", 13);
INSERT INTO artists (name, id_genre) VALUES ("The Everly Brothers", 13);
INSERT INTO artists (name, id_genre) VALUES ("yodeling boy", 13);
INSERT INTO artists (name, id_genre) VALUES ("Zac Brown Band", 13);


INSERT INTO artists (name, id_genre) VALUES ("Barry White", 14);
INSERT INTO artists (name, id_genre) VALUES ("Bee Gees", 14);
INSERT INTO artists (name, id_genre) VALUES ("Boney M", 14);
INSERT INTO artists (name, id_genre) VALUES ("Chic", 14);
INSERT INTO artists (name, id_genre) VALUES ("Diana Ross", 14);
INSERT INTO artists (name, id_genre) VALUES ("Donna Summer", 14);
INSERT INTO artists (name, id_genre) VALUES ("Gloria Gaynor", 14);
INSERT INTO artists (name, id_genre) VALUES ("Lipps Inc", 14);
INSERT INTO artists (name, id_genre) VALUES ("Patrick Hernandez", 14);
INSERT INTO artists (name, id_genre) VALUES ("Rick James", 14);
INSERT INTO artists (name, id_genre) VALUES ("The Jackson 5", 14);
INSERT INTO artists (name, id_genre) VALUES ("The Trammps", 14);
INSERT INTO artists (name, id_genre) VALUES ("Village People", 14);


INSERT INTO artists (name, id_genre) VALUES ("Bob Dylan", 15);
INSERT INTO artists (name, id_genre) VALUES ("Caetano Veloso", 15);
INSERT INTO artists (name, id_genre) VALUES ("Illapu", 15);
INSERT INTO artists (name, id_genre) VALUES ("Inti illimani", 15);
INSERT INTO artists (name, id_genre) VALUES ("Los jaiva", 15);
INSERT INTO artists (name, id_genre) VALUES ("Margot Loyola", 15);
INSERT INTO artists (name, id_genre) VALUES ("Neil Young", 15);
INSERT INTO artists (name, id_genre) VALUES ("Patricio Manns", 15);
INSERT INTO artists (name, id_genre) VALUES ("Quilapayún", 15);
INSERT INTO artists (name, id_genre) VALUES ("Victor Jara", 15);
INSERT INTO artists (name, id_genre) VALUES ("Violeta Parra", 15);


INSERT INTO artists (name, id_genre) VALUES ("Average White Band", 16);
INSERT INTO artists (name, id_genre) VALUES ("Bruno Mars", 16);
INSERT INTO artists (name, id_genre) VALUES ("Cameo", 16);
INSERT INTO artists (name, id_genre) VALUES ("Chanchos en piedra", 16);
INSERT INTO artists (name, id_genre) VALUES ("Commodores", 16);
INSERT INTO artists (name, id_genre) VALUES ("Danny Gokey", 16);
INSERT INTO artists (name, id_genre) VALUES ("Earth, Wind & Fire", 16);
INSERT INTO artists (name, id_genre) VALUES ("Funkadelic", 16);
INSERT INTO artists (name, id_genre) VALUES ("Jamiroquai", 16);
INSERT INTO artists (name, id_genre) VALUES ("Kool and the Gang", 16);
INSERT INTO artists (name, id_genre) VALUES ("Los tetas", 16);
INSERT INTO artists (name, id_genre) VALUES ("Mamma Soul", 16);
INSERT INTO artists (name, id_genre) VALUES ("Mtume", 16);
INSERT INTO artists (name, id_genre) VALUES ("Papanegro", 16);
INSERT INTO artists (name, id_genre) VALUES ("Parliament", 16);
INSERT INTO artists (name, id_genre) VALUES ("Primus", 16);
INSERT INTO artists (name, id_genre) VALUES ("Stevie Wonder", 16);
INSERT INTO artists (name, id_genre) VALUES ("Zapp", 16);


INSERT INTO artists (name, id_genre) VALUES ("Artic Monkeys", 17);
INSERT INTO artists (name, id_genre) VALUES ("Blur", 17);
INSERT INTO artists (name, id_genre) VALUES ("Bright eyes", 17);
INSERT INTO artists (name, id_genre) VALUES ("Dinosaur Jr.", 17);
INSERT INTO artists (name, id_genre) VALUES ("Echosmith", 17);
INSERT INTO artists (name, id_genre) VALUES ("Foals", 17);
INSERT INTO artists (name, id_genre) VALUES ("Foster the People", 17);
INSERT INTO artists (name, id_genre) VALUES ("Franz Ferdinand", 17);
INSERT INTO artists (name, id_genre) VALUES ("Glass Animals", 17);
INSERT INTO artists (name, id_genre) VALUES ("HAIM", 17);
INSERT INTO artists (name, id_genre) VALUES ("Imagine Dragons", 17);
INSERT INTO artists (name, id_genre) VALUES ("Javiera Mena", 17);
INSERT INTO artists (name, id_genre) VALUES ("Kings of Leon", 17);
INSERT INTO artists (name, id_genre) VALUES ("Kodaline", 17);
INSERT INTO artists (name, id_genre) VALUES ("La ley", 17);
INSERT INTO artists (name, id_genre) VALUES ("Lana del Rey", 17);
INSERT INTO artists (name, id_genre) VALUES ("LCD Soundsystem", 17);
INSERT INTO artists (name, id_genre) VALUES ("Lucybell", 17);
INSERT INTO artists (name, id_genre) VALUES ("M83", 17);
INSERT INTO artists (name, id_genre) VALUES ("Pavement", 17);
INSERT INTO artists (name, id_genre) VALUES ("Plastic cup", 17);
INSERT INTO artists (name, id_genre) VALUES ("Radiohead", 17);
INSERT INTO artists (name, id_genre) VALUES ("Spoon", 17);
INSERT INTO artists (name, id_genre) VALUES ("Sufjan Stevens", 17);
INSERT INTO artists (name, id_genre) VALUES ("The Strokes", 17);
INSERT INTO artists (name, id_genre) VALUES ("The Vaselines", 17);
INSERT INTO artists (name, id_genre) VALUES ("The White Stripes", 17);
INSERT INTO artists (name, id_genre) VALUES ("The XX", 17);
INSERT INTO artists (name, id_genre) VALUES ("Tom Walker", 17);
INSERT INTO artists (name, id_genre) VALUES ("Yo la tengo", 17);


INSERT INTO artists (name, id_genre) VALUES ("Alborosie", 18);
INSERT INTO artists (name, id_genre) VALUES ("Bob Marley", 18);
INSERT INTO artists (name, id_genre) VALUES ("Burning Spear", 18);
INSERT INTO artists (name, id_genre) VALUES ("Cultura Profético", 18);
INSERT INTO artists (name, id_genre) VALUES ("Damian Marley", 18);
INSERT INTO artists (name, id_genre) VALUES ("Dread Mar-I", 18);
INSERT INTO artists (name, id_genre) VALUES ("Ganja Smuggling", 18);
INSERT INTO artists (name, id_genre) VALUES ("Gondwana", 18);
INSERT INTO artists (name, id_genre) VALUES ("Inna de Yard", 18);
INSERT INTO artists (name, id_genre) VALUES ("Jimmy Cliff", 18);
INSERT INTO artists (name, id_genre) VALUES ("Jr. Gong", 18);
INSERT INTO artists (name, id_genre) VALUES ("King General", 18);
INSERT INTO artists (name, id_genre) VALUES ("Lee Perry", 18);
INSERT INTO artists (name, id_genre) VALUES ("Mellow Mood", 18);
INSERT INTO artists (name, id_genre) VALUES ("Midnite", 18);
INSERT INTO artists (name, id_genre) VALUES ("Movimiento Original", 18);
INSERT INTO artists (name, id_genre) VALUES ("Mungo's Hi-Fi", 18);
INSERT INTO artists (name, id_genre) VALUES ("Peter Tosh", 18);
INSERT INTO artists (name, id_genre) VALUES ("Protoje", 18);
INSERT INTO artists (name, id_genre) VALUES ("Shamanes", 18);
INSERT INTO artists (name, id_genre) VALUES ("SOJA", 18);
INSERT INTO artists (name, id_genre) VALUES ("Stephen Marley", 18);
INSERT INTO artists (name, id_genre) VALUES ("Stick Figure", 18);
INSERT INTO artists (name, id_genre) VALUES ("UB40", 18);


INSERT INTO artists (name, id_genre) VALUES ("Alton Ellis", 19);
INSERT INTO artists (name, id_genre) VALUES ("Desmond Dekker", 19);
INSERT INTO artists (name, id_genre) VALUES ("Desorden Público", 19);
INSERT INTO artists (name, id_genre) VALUES ("Doctor Krapula", 19);
INSERT INTO artists (name, id_genre) VALUES ("Inspector", 19);
INSERT INTO artists (name, id_genre) VALUES ("Karma", 19);
INSERT INTO artists (name, id_genre) VALUES ("La Sonora Skandalera", 19);
INSERT INTO artists (name, id_genre) VALUES ("La Tremenda Korte", 19);
INSERT INTO artists (name, id_genre) VALUES ("La maldita vecindad", 19);
INSERT INTO artists (name, id_genre) VALUES ("La matatena", 19);
INSERT INTO artists (name, id_genre) VALUES ("Lord Tanamo", 19);
INSERT INTO artists (name, id_genre) VALUES ("Los Calzones Roto", 19);
INSERT INTO artists (name, id_genre) VALUES ("Los Fabulosos Cadillacs", 19);
INSERT INTO artists (name, id_genre) VALUES ("Los Mox", 19);
INSERT INTO artists (name, id_genre) VALUES ("Los autenticos Decadentes", 19);
INSERT INTO artists (name, id_genre) VALUES ("Madness", 19);
INSERT INTO artists (name, id_genre) VALUES ("Maskatesta", 19);
INSERT INTO artists (name, id_genre) VALUES ("Molotov", 19);
INSERT INTO artists (name, id_genre) VALUES ("Prince Buster", 19);
INSERT INTO artists (name, id_genre) VALUES ("Skaleno", 19);
INSERT INTO artists (name, id_genre) VALUES ("The Skatalites", 19);
INSERT INTO artists (name, id_genre) VALUES ("The Specials", 19);
INSERT INTO artists (name, id_genre) VALUES ("The Wailers", 19);
INSERT INTO artists (name, id_genre) VALUES ("ska-p", 19);


INSERT INTO artists (name, id_genre) VALUES ("Celia Cruz", 20);
INSERT INTO artists (name, id_genre) VALUES ("Chichi Peralta", 20);
INSERT INTO artists (name, id_genre) VALUES ("Eddie Santiago", 20);
INSERT INTO artists (name, id_genre) VALUES ("Frankie Ruiz", 20);
INSERT INTO artists (name, id_genre) VALUES ("Gilberto Santa Rosa", 20);
INSERT INTO artists (name, id_genre) VALUES ("Grupo Niche", 20);
INSERT INTO artists (name, id_genre) VALUES ("Hector Lavoe", 20);
INSERT INTO artists (name, id_genre) VALUES ("Jerry Rivera", 20);
INSERT INTO artists (name, id_genre) VALUES ("Joe Arroyo", 20);
INSERT INTO artists (name, id_genre) VALUES ("La India", 20);
INSERT INTO artists (name, id_genre) VALUES ("Lalo Rodríguez", 20);
INSERT INTO artists (name, id_genre) VALUES ("Marc Anthony", 20);
INSERT INTO artists (name, id_genre) VALUES ("Oscar D' León", 20);
INSERT INTO artists (name, id_genre) VALUES ("Ruben Blades", 20);
INSERT INTO artists (name, id_genre) VALUES ("Tito Puente", 20);
INSERT INTO artists (name, id_genre) VALUES ("Tony Vega", 20);
INSERT INTO artists (name, id_genre) VALUES ("Willie Colon", 20);
INSERT INTO artists (name, id_genre) VALUES ("Yiyo Sarante", 20);


INSERT INTO artists (name, id_genre) VALUES ("Antonio Carlos Jobim", 21);
INSERT INTO artists (name, id_genre) VALUES ("Astrud Gilberto", 21);
INSERT INTO artists (name, id_genre) VALUES ("Bebel Gilberto", 21);
INSERT INTO artists (name, id_genre) VALUES ("BREEZE", 21);
INSERT INTO artists (name, id_genre) VALUES ("Carlos Lyra", 21);
INSERT INTO artists (name, id_genre) VALUES ("Chico Buarque", 21);
INSERT INTO artists (name, id_genre) VALUES ("Elis Regina", 21);
INSERT INTO artists (name, id_genre) VALUES ("Gal Costa", 21);
INSERT INTO artists (name, id_genre) VALUES ("Gilberto Gil", 21);
INSERT INTO artists (name, id_genre) VALUES ("Toquinho", 21);
INSERT INTO artists (name, id_genre) VALUES ("Vinícius de Moraes", 21);


INSERT INTO artists (name, id_genre) VALUES ("Alexander Pires", 22);
INSERT INTO artists (name, id_genre) VALUES ("Alex Ubago", 22);
INSERT INTO artists (name, id_genre) VALUES ("Bryan Adams", 22);
INSERT INTO artists (name, id_genre) VALUES ("Camila Gallardo", 22);
INSERT INTO artists (name, id_genre) VALUES ("Camilo Sesto", 22);
INSERT INTO artists (name, id_genre) VALUES ("Chayanne", 22);
INSERT INTO artists (name, id_genre) VALUES ("David Bisbal", 22);
INSERT INTO artists (name, id_genre) VALUES ("Franco de Vita", 22);
INSERT INTO artists (name, id_genre) VALUES ("Jesse & Joy", 22);
INSERT INTO artists (name, id_genre) VALUES ("José José", 22);
INSERT INTO artists (name, id_genre) VALUES ("Juanes", 22);
INSERT INTO artists (name, id_genre) VALUES ("Kany García", 22);
INSERT INTO artists (name, id_genre) VALUES ("Luciano Pereyra", 22);
INSERT INTO artists (name, id_genre) VALUES ("Luis Fonsi", 22);
INSERT INTO artists (name, id_genre) VALUES ("Luis Miguel", 22);
INSERT INTO artists (name, id_genre) VALUES ("Matisse", 22);
INSERT INTO artists (name, id_genre) VALUES ("Melendi", 22);
INSERT INTO artists (name, id_genre) VALUES ("Mon Laferte", 22);
INSERT INTO artists (name, id_genre) VALUES ("Pablo Alborán", 22);
INSERT INTO artists (name, id_genre) VALUES ("Reik", 22);
INSERT INTO artists (name, id_genre) VALUES ("Ricardo Arjona", 22);
INSERT INTO artists (name, id_genre) VALUES ("Ricardo Montaner", 22);
INSERT INTO artists (name, id_genre) VALUES ("Sebastian Yatra", 22);
INSERT INTO artists (name, id_genre) VALUES ("Sin Bandera", 22);






INSERT INTO `userStatistics` ( `artist`, `followers`, `lastTweet`, `name`, `retweets`, `relevant`, `verified`)
VALUES ( 'Drake', 312, 'Genial el nuevo album de Drake!', 'cleopatra12', 2, 6, 1 ),
( 'Gorillaz', 125, 'The Not Now de Gorillaz, buenisimo', 'juanye', 12, 6, 1 ),
( 'Post Malone', 243, 'Post Malone tremendo artista', 'ato_perrochico', 12, 6, 1 ),
( 'Travis Scott', 12, 'Medio disco saco Travis Scott', 'auka12', 15, 6, 1 ),
( 'Gorillaz', 76, 'Buen album el nuevo de Gorillaz', 'motero666', 22, 6, 1 ),
( 'Queen', 1087, 'Faltan bandas buenas como Queen', 'sopadilla7', 28, 6, 1 ),
( 'Michael Jackson', 1200, 'Michael Jackson el mejor artista de todos los tiempos', 'hectorgordofeo', 12, 6, 1 ),
( 'Drake', 1476, 'temazos los de drake', 'malone91', 14, 6, 1 ),
( 'Travis Scott', 47, 'no me gusto el album de travis Scott', 'durox88', 15, 6, 1 ),
( 'Soda Stereo', 478, 'soda stereo la mejor banda latina', 'cifu43', 19, 6, 1 ),
( 'Pink Floyd', 491, 'fumandome unos cañitos con pik floyd', 'chosi12', 12, 6, 1 ),
( 'Nirvana', 691, 'escuchando Nirvana a toda raja', 'gon8', 21, 6, 1 ),
( 'Led Zepellin', 191, 'aguante led zepellin', 'ulisesmota', 26, 6, 1 ),
( 'Ariana Grande', 144, 'Ariana grande saco el medio tema', 'lddc', 28, 6, 1 ),
( 'Justin Bieber', 446, 'Aguante Justin biever vieja', 'walterwhite99', 25, 6, 1 ),
( 'Martin Garrix', 546, 'Martin Garrix lo mejor de la electronica', 'rapero3', 22, 6, 1 ),
( 'Drake', 540, 'geniales los temas de drake', 'zhinge2', 13, 6, 1 ),
( 'Nicky Minaj', 4980, 'Nicky Minaj tiene la media raja', 'durox78', 21, 6, 1 ),
( 'Eminem', 3989, 'eminem el mejor rapero', 'suazo3', 26, 6, 1 ),
( 'Bad Bunny', 7698, 'bad bunny terrible weno', 'conejo16', 24, 6, 1 ),
( 'Metallica', 7392, 'ire a ver a metallica!', 'weed817', 29, 6, 1 ),
( 'Iron Maiden', 6393, 'aca escuchando iron maiden', 'vodoo12', 21, 6, 1 ),
( 'Oasis', 6393, 'oasis mi banda favorita!', 'dania20', 22, 6, 1 ),
( 'Arctic Monkeys', 8393, 'aguanten los arctic monkeys', 'seba6', 12, 6, 1 ),
( 'Ozuna', 393, 'ozuna medio temazo', 'roberto75', 13, 6, 1 ),
( 'J Balvin', 638, 'J balvin el mejor artista de todos los tiempos', 'ruben2314', 18, 6, 1 ),
( 'Maluma', 923, 'maluma sera gay?', 'adolfo654', 16, 6, 1 ),
( 'Drake', 485, 'albumazo de drake', 'berlin1', 10, 6, 1 ),
( 'Travis Scott', 918, 'Travis Scott buenisimo', 'chambea', 18, 6, 1 ),
( 'Post Malone', 12, 'Sus chelitas y post malone', 'goro32', 19, 6, 1 ),
( 'Selena Gomez', 184, 'Escuchando lo nuevo de selena gomez', 'freezer7', 29, 6, 1 ),
( 'Cardi B', 583, 'Cardi B la lleva', 'arthas45678', 19, 6, 1 ),
( 'Martin Garrix', 294, 'genial martin Garrix', 'guatonql', 18, 6, 1 ),
( 'Arcangel', 193, 'Arcangel terrible maliante', 'sd643', 13, 6, 1 ),
( 'Yandel', 182, 'excelente el tema de yandel', 'naranja81', 14, 6, 1 ),
( 'Drake', 184, 'drake mi artista favorito', 'tiuque77', 19, 6, 1 ),
( 'Justin Bieber', 184, 'Justin biever terrible bueno', 'sopero2', 29, 6, 1 ),
( 'Jay Z', 173, 'escuchando Jay Z', 'conde87', 39, 6, 1 ),
( 'Eminem', 1787, 'faltan temas como los de eminem', 'verdeazulnegro', 29, 6, 1 ),
( 'Vicentico', 182, 'Vicentico tremendo artista', 'gorro32', 27, 6, 1 ),
( 'Calvin Harris', 99, 'Temazos de calvin harris', 'mosca55', 21, 6, 1 ),
( 'Dua Lipa', 121, 'dua lipa gran artista', 'camila76', 22, 6, 1 ),
( 'Post Malone', 111, 'puta que es weno post malone', 'constanza8', 28, 6, 1 )
;



