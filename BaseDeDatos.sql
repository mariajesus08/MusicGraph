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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO users (name, password, email, is_active) VALUES ("admin", "tbd", "admin@usach.cl", 1);

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
INSERT INTO artists (name, id_genre) VALUES ("Rick James", 16);
INSERT INTO artists (name, id_genre) VALUES ("Stevie Wonder", 16);
INSERT INTO artists (name, id_genre) VALUES ("Zapp", 16);


INSERT INTO artists (name, id_genre) VALUES ("Artic Monkeys", 17);
INSERT INTO artists (name, id_genre) VALUES ("Blur", 17);
INSERT INTO artists (name, id_genre) VALUES ("Bright eyes", 17);
INSERT INTO artists (name, id_genre) VALUES ("Dinosaur Jr.", 17);
INSERT INTO artists (name, id_genre) VALUES ("Echosmith", 17);
INSERT INTO artists (name, id_genre) VALUES ("Florence + The Machine", 17);
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
INSERT INTO artists (name, id_genre) VALUES ("The Killers", 17);
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
INSERT INTO artists (name, id_genre) VALUES ("Guachupé", 19);
INSERT INTO artists (name, id_genre) VALUES ("Inspector", 19);
INSERT INTO artists (name, id_genre) VALUES ("Jimmy Cliff", 19);
INSERT INTO artists (name, id_genre) VALUES ("Karma", 19);
INSERT INTO artists (name, id_genre) VALUES ("La Sonora Skandalera", 19);
INSERT INTO artists (name, id_genre) VALUES ("La Tremenda Korte", 19);
INSERT INTO artists (name, id_genre) VALUES ("La maldita vecindad", 19);
INSERT INTO artists (name, id_genre) VALUES ("La matatena", 19);
INSERT INTO artists (name, id_genre) VALUES ("Lord Tanamo", 19);
INSERT INTO artists (name, id_genre) VALUES ("Los Calzones Roto", 19);
INSERT INTO artists (name, id_genre) VALUES ("Los Fabulosos Cadillacs", 19);
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
INSERT INTO artists (name, id_genre) VALUES ("Caetano Veloso", 21);
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
INSERT INTO artists (name, id_genre) VALUES ("Sebastián Yatra", 22);
INSERT INTO artists (name, id_genre) VALUES ("Sin Bandera", 22);







INSERT INTO keywords (word) VALUES ("The Beatles");
INSERT INTO keywords (word) VALUES ("Queen");
INSERT INTO keywords (word) VALUES ("The Rolling stones");
INSERT INTO keywords (word) VALUES ("Led Zeppelin");
INSERT INTO keywords (word) VALUES ("Pink Floyd");
INSERT INTO keywords (word) VALUES ("Nirvana");
INSERT INTO keywords (word) VALUES ("Guns N' Roses");
INSERT INTO keywords (word) VALUES ("Red Hot Chili Peppers");
INSERT INTO keywords (word) VALUES ("Kiss");
INSERT INTO keywords (word) VALUES ("bon jovi");
INSERT INTO keywords (word) VALUES ("the offspring");
INSERT INTO keywords (word) VALUES ("Blink 182");
INSERT INTO keywords (word) VALUES ("Florence + The Machine");
INSERT INTO keywords (word) VALUES ("Linkin Park");
INSERT INTO keywords (word) VALUES ("Snow Patrol");
INSERT INTO keywords (word) VALUES ("The Killers");
INSERT INTO keywords (word) VALUES ("Foo Fighters");
INSERT INTO keywords (word) VALUES ("Thirty Seconds To Mars");
INSERT INTO keywords (word) VALUES ("Paramore");
INSERT INTO keywords (word) VALUES ("Avril Lavigne");
INSERT INTO keywords (word) VALUES ("Iron Maiden");
INSERT INTO keywords (word) VALUES ("Metallica");
INSERT INTO keywords (word) VALUES ("Megadeth");
INSERT INTO keywords (word) VALUES ("Black Sabbath");
INSERT INTO keywords (word) VALUES ("Pantera");
INSERT INTO keywords (word) VALUES ("AC-DC");
INSERT INTO keywords (word) VALUES ("Scorpions");
INSERT INTO keywords (word) VALUES ("Marilyn Manson");
INSERT INTO keywords (word) VALUES ("Manowar");
INSERT INTO keywords (word) VALUES ("Lordi");
INSERT INTO keywords (word) VALUES ("System of a Down");
INSERT INTO keywords (word) VALUES ("Alice In Chains");
INSERT INTO keywords (word) VALUES ("Ghost");
INSERT INTO keywords (word) VALUES ("Bullet For My Valentine");
INSERT INTO keywords (word) VALUES ("Shinedown");
INSERT INTO keywords (word) VALUES ("Marilyn Manson");
INSERT INTO keywords (word) VALUES ("Sex pistols");
INSERT INTO keywords (word) VALUES ("Ramones");
INSERT INTO keywords (word) VALUES ("The clash");
INSERT INTO keywords (word) VALUES ("Bad religion");
INSERT INTO keywords (word) VALUES ("Green day");
INSERT INTO keywords (word) VALUES ("Dead Kennedys");
INSERT INTO keywords (word) VALUES ("Misfits");
INSERT INTO keywords (word) VALUES ("NOFX");
INSERT INTO keywords (word) VALUES ("The exploited");
INSERT INTO keywords (word) VALUES ("Ataque 77");
INSERT INTO keywords (word) VALUES ("The Lawrence arms");
INSERT INTO keywords (word) VALUES ("Millencolin");
INSERT INTO keywords (word) VALUES ("Rise against");
INSERT INTO keywords (word) VALUES ("Pennywise");
INSERT INTO keywords (word) VALUES ("Candy Hearts");
INSERT INTO keywords (word) VALUES ("Knuckle Puck");
INSERT INTO keywords (word) VALUES ("The Draft");
INSERT INTO keywords (word) VALUES ("The Explosion");
INSERT INTO keywords (word) VALUES ("Louis Armstrong");
INSERT INTO keywords (word) VALUES ("John Coltrane");
INSERT INTO keywords (word) VALUES ("Billie Holiday");
INSERT INTO keywords (word) VALUES ("Miles Davis");
INSERT INTO keywords (word) VALUES ("Charlie Parker");
INSERT INTO keywords (word) VALUES ("Duke Ellington");
INSERT INTO keywords (word) VALUES ("Thelonious Monk");
INSERT INTO keywords (word) VALUES ("Count Basie");
INSERT INTO keywords (word) VALUES ("Charles Mingus");
INSERT INTO keywords (word) VALUES ("Dizzy Gillespie");
INSERT INTO keywords (word) VALUES ("Michael J. Thomas");
INSERT INTO keywords (word) VALUES ("Lin Rountree");
INSERT INTO keywords (word) VALUES ("Rick Braun");
INSERT INTO keywords (word) VALUES ("Norman Brown");
INSERT INTO keywords (word) VALUES ("Nick Colionne");
INSERT INTO keywords (word) VALUES ("Melinda Doolittle");
INSERT INTO keywords (word) VALUES ("Ella Fitzgerald");
INSERT INTO keywords (word) VALUES ("Gregory Porter");
INSERT INTO keywords (word) VALUES ("Billie Eckstine");
INSERT INTO keywords (word) VALUES ("Johnny Hartman");
INSERT INTO keywords (word) VALUES ("James Brown");
INSERT INTO keywords (word) VALUES ("Till Brönner");
INSERT INTO keywords (word) VALUES ("Rosemary Clooney");
INSERT INTO keywords (word) VALUES ("Blosson Dearie");
INSERT INTO keywords (word) VALUES ("Michael Jackson");
INSERT INTO keywords (word) VALUES ("Madonna");
INSERT INTO keywords (word) VALUES ("Rihanna");
INSERT INTO keywords (word) VALUES ("Lady Gaga");
INSERT INTO keywords (word) VALUES ("Britney Spears");
INSERT INTO keywords (word) VALUES ("Katy Perry");
INSERT INTO keywords (word) VALUES ("Justin Timberlake");
INSERT INTO keywords (word) VALUES ("U2");
INSERT INTO keywords (word) VALUES ("Beyoncé");
INSERT INTO keywords (word) VALUES ("Christina Aguilera");
INSERT INTO keywords (word) VALUES ("Miley Cyrus");
INSERT INTO keywords (word) VALUES ("Demi lovato");
INSERT INTO keywords (word) VALUES ("Taylor Swift");
INSERT INTO keywords (word) VALUES ("Shakira");
INSERT INTO keywords (word) VALUES ("Dua Lipa");
INSERT INTO keywords (word) VALUES ("Camila Cabello");
INSERT INTO keywords (word) VALUES ("Sofia Reyes");
INSERT INTO keywords (word) VALUES ("Ed Sheeran");
INSERT INTO keywords (word) VALUES ("OneRepublic");
INSERT INTO keywords (word) VALUES ("Maroon 5");
INSERT INTO keywords (word) VALUES ("Charlie Puth");
INSERT INTO keywords (word) VALUES ("Shawn Mendes");
INSERT INTO keywords (word) VALUES ("Eminem");
INSERT INTO keywords (word) VALUES ("Porta");
INSERT INTO keywords (word) VALUES ("Snoop Dogg");
INSERT INTO keywords (word) VALUES ("Tupac");
INSERT INTO keywords (word) VALUES ("50 Cent");
INSERT INTO keywords (word) VALUES ("Ice Cube");
INSERT INTO keywords (word) VALUES ("Dr.Dre");
INSERT INTO keywords (word) VALUES ("Chyste mc");
INSERT INTO keywords (word) VALUES ("Nach");
INSERT INTO keywords (word) VALUES ("Zpu");
INSERT INTO keywords (word) VALUES ("Machine Gun Kelly");
INSERT INTO keywords (word) VALUES ("Lil Pump");
INSERT INTO keywords (word) VALUES ("Drake");
INSERT INTO keywords (word) VALUES ("BlocBoy JB");
INSERT INTO keywords (word) VALUES ("Saweetie");
INSERT INTO keywords (word) VALUES ("Meek Mill");
INSERT INTO keywords (word) VALUES ("Yung Gravy");
INSERT INTO keywords (word) VALUES ("YoungBoy Never Broke Again");
INSERT INTO keywords (word) VALUES ("Chance The Rapper");
INSERT INTO keywords (word) VALUES ("J. Cole");
INSERT INTO keywords (word) VALUES ("Rich The Kid");
INSERT INTO keywords (word) VALUES ("Cardi B");
INSERT INTO keywords (word) VALUES ("NF");
INSERT INTO keywords (word) VALUES ("Nicki Minaj");
INSERT INTO keywords (word) VALUES ("G Herbo");
INSERT INTO keywords (word) VALUES ("G-Eazy");
INSERT INTO keywords (word) VALUES ("Joyner Lucas");
INSERT INTO keywords (word) VALUES ("Remy Ma");
INSERT INTO keywords (word) VALUES ("Daft punk");
INSERT INTO keywords (word) VALUES ("Massive Atack");
INSERT INTO keywords (word) VALUES ("The prodigy");
INSERT INTO keywords (word) VALUES ("Air");
INSERT INTO keywords (word) VALUES ("Moby");
INSERT INTO keywords (word) VALUES ("The Chemical Brothers");
INSERT INTO keywords (word) VALUES ("Goldfrapp");
INSERT INTO keywords (word) VALUES ("The knife");
INSERT INTO keywords (word) VALUES ("Crystal Castles");
INSERT INTO keywords (word) VALUES ("Lamb");
INSERT INTO keywords (word) VALUES ("The Chainsmokers");
INSERT INTO keywords (word) VALUES ("Kygo");
INSERT INTO keywords (word) VALUES ("Avicii");
INSERT INTO keywords (word) VALUES ("Zedd");
INSERT INTO keywords (word) VALUES ("Jack Ü");
INSERT INTO keywords (word) VALUES ("Calvin Harris");
INSERT INTO keywords (word) VALUES ("AJ Salvatore, Fluencee");
INSERT INTO keywords (word) VALUES ("Gorillaz");
INSERT INTO keywords (word) VALUES ("Marama");
INSERT INTO keywords (word) VALUES ("Rombai");
INSERT INTO keywords (word) VALUES ("Amar Azul");
INSERT INTO keywords (word) VALUES ("Combo tortuga");
INSERT INTO keywords (word) VALUES ("Chico Trujillo");
INSERT INTO keywords (word) VALUES ("Los Charros");
INSERT INTO keywords (word) VALUES ("Yerba Brava");
INSERT INTO keywords (word) VALUES ("Guachupé");
INSERT INTO keywords (word) VALUES ("Villa Cariño");
INSERT INTO keywords (word) VALUES ("La sonora de Tommy Rey");
INSERT INTO keywords (word) VALUES ("Antonio Rios");
INSERT INTO keywords (word) VALUES ("Mozart (Wolfgang Amadeus Mozart)");
INSERT INTO keywords (word) VALUES ("Beethoven (Ludwig van Beethoven)");
INSERT INTO keywords (word) VALUES ("Bach (Johann Sebastian Bach)");
INSERT INTO keywords (word) VALUES ("Tchaikovski (Piotr Ilich Chaikovski)");
INSERT INTO keywords (word) VALUES ("Chopin (Frédéric Chopin)");
INSERT INTO keywords (word) VALUES ("Vivaldi (Antoni Vivaldi)");
INSERT INTO keywords (word) VALUES ("Richard Wagner");
INSERT INTO keywords (word) VALUES ("Johannes Brahms");
INSERT INTO keywords (word) VALUES ("Igor Stravinski");
INSERT INTO keywords (word) VALUES ("Claude Debussy");
INSERT INTO keywords (word) VALUES ("Alexis y Fido");
INSERT INTO keywords (word) VALUES ("Bad Bunny");
INSERT INTO keywords (word) VALUES ("Becky G");
INSERT INTO keywords (word) VALUES ("CNCO");
INSERT INTO keywords (word) VALUES ("Daddy Yankee");
INSERT INTO keywords (word) VALUES ("Danny Ocean");
INSERT INTO keywords (word) VALUES ("Don Omar");
INSERT INTO keywords (word) VALUES ("Enrique Iglesias");
INSERT INTO keywords (word) VALUES ("J Balvin");
INSERT INTO keywords (word) VALUES ("Maluma");
INSERT INTO keywords (word) VALUES ("Natti Natasha");
INSERT INTO keywords (word) VALUES ("Nicky Jam");
INSERT INTO keywords (word) VALUES ("Ozuna");
INSERT INTO keywords (word) VALUES ("Piso 21");
INSERT INTO keywords (word) VALUES ("Pitbull");
INSERT INTO keywords (word) VALUES ("Princesa Alba");
INSERT INTO keywords (word) VALUES ("Wisin");
INSERT INTO keywords (word) VALUES ("Yandel");
INSERT INTO keywords (word) VALUES ("Zion & Lennox");
INSERT INTO keywords (word) VALUES ("Alejandro Filio");
INSERT INTO keywords (word) VALUES ("Angelo Escobar");
INSERT INTO keywords (word) VALUES ("Eduardo Peralta");
INSERT INTO keywords (word) VALUES ("León Gieco");
INSERT INTO keywords (word) VALUES ("Manuel García");
INSERT INTO keywords (word) VALUES ("Noel Nicola");
INSERT INTO keywords (word) VALUES ("Pablo Milanés");
INSERT INTO keywords (word) VALUES ("Silvio Rodriguez");
INSERT INTO keywords (word) VALUES ("Sindo Garay");
INSERT INTO keywords (word) VALUES ("Victor Heredia");
INSERT INTO keywords (word) VALUES ("B.B king");
INSERT INTO keywords (word) VALUES ("Blind Lemon");
INSERT INTO keywords (word) VALUES ("Eric Clapton");
INSERT INTO keywords (word) VALUES ("Muddy Waters");
INSERT INTO keywords (word) VALUES ("Ray Charles");
INSERT INTO keywords (word) VALUES ("Robert Johnson");
INSERT INTO keywords (word) VALUES ("Asleep at the wheel");
INSERT INTO keywords (word) VALUES ("Brad Paisley");
INSERT INTO keywords (word) VALUES ("Dixie Chicks");
INSERT INTO keywords (word) VALUES ("Hudson Moore");
INSERT INTO keywords (word) VALUES ("Josh Turner");
INSERT INTO keywords (word) VALUES ("Keith Urban");
INSERT INTO keywords (word) VALUES ("Lady Antebellum");
INSERT INTO keywords (word) VALUES ("Little Big Town");
INSERT INTO keywords (word) VALUES ("Sam Hunt");
INSERT INTO keywords (word) VALUES ("Sugarland");
INSERT INTO keywords (word) VALUES ("The Band Perry");
INSERT INTO keywords (word) VALUES ("The Carter Family");
INSERT INTO keywords (word) VALUES ("The Everly Brothers");
INSERT INTO keywords (word) VALUES ("yodeling boy");
INSERT INTO keywords (word) VALUES ("Zac Brown Band");
INSERT INTO keywords (word) VALUES ("Barry White");
INSERT INTO keywords (word) VALUES ("Bee Gees");
INSERT INTO keywords (word) VALUES ("Boney M");
INSERT INTO keywords (word) VALUES ("Chic");
INSERT INTO keywords (word) VALUES ("Diana Ross");
INSERT INTO keywords (word) VALUES ("Donna Summer");
INSERT INTO keywords (word) VALUES ("Gloria Gaynor");
INSERT INTO keywords (word) VALUES ("Lipps Inc");
INSERT INTO keywords (word) VALUES ("Patrick Hernandez");
INSERT INTO keywords (word) VALUES ("Rick James");
INSERT INTO keywords (word) VALUES ("The Jackson 5");
INSERT INTO keywords (word) VALUES ("The Trammps");
INSERT INTO keywords (word) VALUES ("Village People");
INSERT INTO keywords (word) VALUES ("Bob Dylan");
INSERT INTO keywords (word) VALUES ("Caetano Veloso");
INSERT INTO keywords (word) VALUES ("Illapu");
INSERT INTO keywords (word) VALUES ("Inti illimani");
INSERT INTO keywords (word) VALUES ("Los jaiva");
INSERT INTO keywords (word) VALUES ("Margot Loyola");
INSERT INTO keywords (word) VALUES ("Neil Young");
INSERT INTO keywords (word) VALUES ("Patricio Manns");
INSERT INTO keywords (word) VALUES ("Quilapayún");
INSERT INTO keywords (word) VALUES ("Victor Jara");
INSERT INTO keywords (word) VALUES ("Violeta Parra");
INSERT INTO keywords (word) VALUES ("Average White Band");
INSERT INTO keywords (word) VALUES ("Bruno Mars");
INSERT INTO keywords (word) VALUES ("Cameo");
INSERT INTO keywords (word) VALUES ("Chanchos en piedra");
INSERT INTO keywords (word) VALUES ("Commodores");
INSERT INTO keywords (word) VALUES ("Danny Gokey");
INSERT INTO keywords (word) VALUES ("Earth, Wind & Fire");
INSERT INTO keywords (word) VALUES ("Funkadelic");
INSERT INTO keywords (word) VALUES ("Jamiroquai");
INSERT INTO keywords (word) VALUES ("Kool and the Gang");
INSERT INTO keywords (word) VALUES ("Los tetas");
INSERT INTO keywords (word) VALUES ("Mamma Soul");
INSERT INTO keywords (word) VALUES ("Mtume");
INSERT INTO keywords (word) VALUES ("Papanegro");
INSERT INTO keywords (word) VALUES ("Parliament");
INSERT INTO keywords (word) VALUES ("Primus");
INSERT INTO keywords (word) VALUES ("Rick James");
INSERT INTO keywords (word) VALUES ("Stevie Wonder");
INSERT INTO keywords (word) VALUES ("Zapp");
INSERT INTO keywords (word) VALUES ("Artic Monkeys");
INSERT INTO keywords (word) VALUES ("Blur");
INSERT INTO keywords (word) VALUES ("Bright eyes");
INSERT INTO keywords (word) VALUES ("Dinosaur Jr.");
INSERT INTO keywords (word) VALUES ("Echosmith");
INSERT INTO keywords (word) VALUES ("Florence + The Machine");
INSERT INTO keywords (word) VALUES ("Foals");
INSERT INTO keywords (word) VALUES ("Foster the People");
INSERT INTO keywords (word) VALUES ("Franz Ferdinand");
INSERT INTO keywords (word) VALUES ("Glass Animals");
INSERT INTO keywords (word) VALUES ("HAIM");
INSERT INTO keywords (word) VALUES ("Imagine Dragons");
INSERT INTO keywords (word) VALUES ("Javiera Mena");
INSERT INTO keywords (word) VALUES ("Kings of Leon");
INSERT INTO keywords (word) VALUES ("Kodaline");
INSERT INTO keywords (word) VALUES ("La ley");
INSERT INTO keywords (word) VALUES ("Lana del Rey");
INSERT INTO keywords (word) VALUES ("LCD Soundsystem");
INSERT INTO keywords (word) VALUES ("Lucybell");
INSERT INTO keywords (word) VALUES ("M83");
INSERT INTO keywords (word) VALUES ("Pavement");
INSERT INTO keywords (word) VALUES ("Plastic cup");
INSERT INTO keywords (word) VALUES ("Radiohead");
INSERT INTO keywords (word) VALUES ("Spoon");
INSERT INTO keywords (word) VALUES ("Sufjan Stevens");
INSERT INTO keywords (word) VALUES ("The Killers");
INSERT INTO keywords (word) VALUES ("The Strokes");
INSERT INTO keywords (word) VALUES ("The Vaselines");
INSERT INTO keywords (word) VALUES ("The White Stripes");
INSERT INTO keywords (word) VALUES ("The XX");
INSERT INTO keywords (word) VALUES ("Tom Walker");
INSERT INTO keywords (word) VALUES ("Yo la tengo");
INSERT INTO keywords (word) VALUES ("Alborosie");
INSERT INTO keywords (word) VALUES ("Bob Marley");
INSERT INTO keywords (word) VALUES ("Burning Spear");
INSERT INTO keywords (word) VALUES ("Cultura Profético");
INSERT INTO keywords (word) VALUES ("Damian Marley");
INSERT INTO keywords (word) VALUES ("Dread Mar-I");
INSERT INTO keywords (word) VALUES ("Ganja Smuggling");
INSERT INTO keywords (word) VALUES ("Gondwana");
INSERT INTO keywords (word) VALUES ("Inna de Yard");
INSERT INTO keywords (word) VALUES ("Jimmy Cliff");
INSERT INTO keywords (word) VALUES ("Jr. Gong");
INSERT INTO keywords (word) VALUES ("King General");
INSERT INTO keywords (word) VALUES ("Lee Perry");
INSERT INTO keywords (word) VALUES ("Mellow Mood");
INSERT INTO keywords (word) VALUES ("Midnite");
INSERT INTO keywords (word) VALUES ("Movimiento Original");
INSERT INTO keywords (word) VALUES ("Mungo's Hi-Fi");
INSERT INTO keywords (word) VALUES ("Peter Tosh");
INSERT INTO keywords (word) VALUES ("Protoje");
INSERT INTO keywords (word) VALUES ("Shamanes");
INSERT INTO keywords (word) VALUES ("SOJA");
INSERT INTO keywords (word) VALUES ("Stephen Marley");
INSERT INTO keywords (word) VALUES ("Stick Figure");
INSERT INTO keywords (word) VALUES ("UB40");
INSERT INTO keywords (word) VALUES ("Alton Ellis");
INSERT INTO keywords (word) VALUES ("Desmond Dekker");
INSERT INTO keywords (word) VALUES ("Desorden Público");
INSERT INTO keywords (word) VALUES ("Doctor Krapula");
INSERT INTO keywords (word) VALUES ("Guachupé");
INSERT INTO keywords (word) VALUES ("Inspector");
INSERT INTO keywords (word) VALUES ("Jimmy Cliff");
INSERT INTO keywords (word) VALUES ("Karma");
INSERT INTO keywords (word) VALUES ("La Sonora Skandalera");
INSERT INTO keywords (word) VALUES ("La Tremenda Korte");
INSERT INTO keywords (word) VALUES ("La maldita vecindad");
INSERT INTO keywords (word) VALUES ("La matatena");
INSERT INTO keywords (word) VALUES ("Lord Tanamo");
INSERT INTO keywords (word) VALUES ("Los Calzones Roto");
INSERT INTO keywords (word) VALUES ("Los Fabulosos Cadilac");
INSERT INTO keywords (word) VALUES ("Los Mox");
INSERT INTO keywords (word) VALUES ("Los autenticos Decadentes");
INSERT INTO keywords (word) VALUES ("Madness");
INSERT INTO keywords (word) VALUES ("Maskatesta");
INSERT INTO keywords (word) VALUES ("Molotov");
INSERT INTO keywords (word) VALUES ("Prince Buster");
INSERT INTO keywords (word) VALUES ("Skaleno");
INSERT INTO keywords (word) VALUES ("The Skatalites");
INSERT INTO keywords (word) VALUES ("The Specials");
INSERT INTO keywords (word) VALUES ("The Wailers");
INSERT INTO keywords (word) VALUES ("ska-p");
INSERT INTO keywords (word) VALUES ("Celia Cruz");
INSERT INTO keywords (word) VALUES ("Chichi Peralta");
INSERT INTO keywords (word) VALUES ("Eddie Santiago");
INSERT INTO keywords (word) VALUES ("Frankie Ruiz");
INSERT INTO keywords (word) VALUES ("Gilberto Santa Rosa");
INSERT INTO keywords (word) VALUES ("Grupo Niche");
INSERT INTO keywords (word) VALUES ("Hector Lavoe");
INSERT INTO keywords (word) VALUES ("Jerry Rivera");
INSERT INTO keywords (word) VALUES ("Joe Arroyo");
INSERT INTO keywords (word) VALUES ("La India");
INSERT INTO keywords (word) VALUES ("Lalo Rodríguez");
INSERT INTO keywords (word) VALUES ("Marc Anthony");
INSERT INTO keywords (word) VALUES ("Oscar D' León");
INSERT INTO keywords (word) VALUES ("Ruben Blades");
INSERT INTO keywords (word) VALUES ("Tito Puente");
INSERT INTO keywords (word) VALUES ("Tony Vega");
INSERT INTO keywords (word) VALUES ("Willie Colon");
INSERT INTO keywords (word) VALUES ("Yiyo Sarante");
INSERT INTO keywords (word) VALUES ("Antonio Carlos Jobim");
INSERT INTO keywords (word) VALUES ("Astrud Gilberto");
INSERT INTO keywords (word) VALUES ("Bebel Gilberto");
INSERT INTO keywords (word) VALUES ("BREEZE");
INSERT INTO keywords (word) VALUES ("Caetano Veloso");
INSERT INTO keywords (word) VALUES ("Carlos Lyra");
INSERT INTO keywords (word) VALUES ("Chico Buarque");
INSERT INTO keywords (word) VALUES ("Elis Regina");
INSERT INTO keywords (word) VALUES ("Gal Costa");
INSERT INTO keywords (word) VALUES ("Gilberto Gil");
INSERT INTO keywords (word) VALUES ("Toquinho");
INSERT INTO keywords (word) VALUES ("Vinícius de Moraes");
INSERT INTO keywords (word) VALUES ("Alexander Pires");
INSERT INTO keywords (word) VALUES ("Alex Ubago");
INSERT INTO keywords (word) VALUES ("Bryan Adams");
INSERT INTO keywords (word) VALUES ("Camila Gallardo");
INSERT INTO keywords (word) VALUES ("Camilo Sesto");
INSERT INTO keywords (word) VALUES ("Chayanne");
INSERT INTO keywords (word) VALUES ("David Bisbal");
INSERT INTO keywords (word) VALUES ("Franco de Vita");
INSERT INTO keywords (word) VALUES ("Jesse & Joy");
INSERT INTO keywords (word) VALUES ("José José");
INSERT INTO keywords (word) VALUES ("Juanes");
INSERT INTO keywords (word) VALUES ("Kany García");
INSERT INTO keywords (word) VALUES ("Luciano Pereyra");
INSERT INTO keywords (word) VALUES ("Luis Fonsi");
INSERT INTO keywords (word) VALUES ("Luis Miguel");
INSERT INTO keywords (word) VALUES ("Matisse");
INSERT INTO keywords (word) VALUES ("Melendi");
INSERT INTO keywords (word) VALUES ("Mon Laferte");
INSERT INTO keywords (word) VALUES ("Pablo Alborán");
INSERT INTO keywords (word) VALUES ("Reik");
INSERT INTO keywords (word) VALUES ("Ricardo Arjona");
INSERT INTO keywords (word) VALUES ("Ricardo Montaner");
INSERT INTO keywords (word) VALUES ("Sebastián Yatra");
INSERT INTO keywords (word) VALUES ("Sin Bandera");