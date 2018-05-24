
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
  `id_artist` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_artist`)
  REFERENCES artists(`id`));



DROP TABLE IF EXISTS `artists` ;

CREATE TABLE IF NOT EXISTS `artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
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
INSERT INTO artists (name) VALUES ("The Beatles");
INSERT INTO artists (name) VALUES ("Queen");
INSERT INTO artists (name) VALUES ("The Rolling Stones");
INSERT INTO artists (name) VALUES ("Led Zeppelin");
INSERT INTO artists (name) VALUES ("Pink Floyd");
INSERT INTO artists (name) VALUES ("Nirvana");
INSERT INTO artists (name) VALUES ("Guns N' Roses");
INSERT INTO artists (name) VALUES ("Red Hot Chili Peppers");
INSERT INTO artists (name) VALUES ("Kiss");
INSERT INTO artists (name) VALUES ("Bon Jovi");
INSERT INTO artists (name) VALUES ("The Offspring");
INSERT INTO artists (name) VALUES ("Blink 182");
INSERT INTO artists (name) VALUES ("Florence + The Machine");
INSERT INTO artists (name) VALUES ("Linkin Park");
INSERT INTO artists (name) VALUES ("Snow Patrol");
INSERT INTO artists (name) VALUES ("The Killers");
INSERT INTO artists (name) VALUES ("Foo Fighters");
INSERT INTO artists (name) VALUES ("Thirty Seconds To Mars");
INSERT INTO artists (name) VALUES ("Paramore");
INSERT INTO artists (name) VALUES ("Avril Lavigne");


INSERT INTO artists (name) VALUES ("Iron Maiden");
INSERT INTO artists (name) VALUES ("Metallica");
INSERT INTO artists (name) VALUES ("Megadeth");
INSERT INTO artists (name) VALUES ("Black Sabbath");
INSERT INTO artists (name) VALUES ("Pantera");
INSERT INTO artists (name) VALUES ("AC-DC");
INSERT INTO artists (name) VALUES ("Scorpions");
INSERT INTO artists (name) VALUES ("Marilyn Manson");
INSERT INTO artists (name) VALUES ("Manowar");
INSERT INTO artists (name) VALUES ("Lordi");
INSERT INTO artists (name) VALUES ("System of a Down");
INSERT INTO artists (name) VALUES ("Alice In Chains");
INSERT INTO artists (name) VALUES ("Ghost");
INSERT INTO artists (name) VALUES ("Bullet For My Valentine");
INSERT INTO artists (name) VALUES ("Shinedown");
INSERT INTO artists (name) VALUES ("Marilyn Manson");


INSERT INTO artists (name) VALUES ("Sex pistols");
INSERT INTO artists (name) VALUES ("Ramones");
INSERT INTO artists (name) VALUES ("The clash");
INSERT INTO artists (name) VALUES ("Bad religion");
INSERT INTO artists (name) VALUES ("Green day");
INSERT INTO artists (name) VALUES ("Dead Kennedys");
INSERT INTO artists (name) VALUES ("Misfits");
INSERT INTO artists (name) VALUES ("NOFX");
INSERT INTO artists (name) VALUES ("The exploited");
INSERT INTO artists (name) VALUES ("Ataque 77");
INSERT INTO artists (name) VALUES ("La polla records");
INSERT INTO artists (name) VALUES ("The Lawrence arms");
INSERT INTO artists (name) VALUES ("Millencolin");
INSERT INTO artists (name) VALUES ("Rise against");
INSERT INTO artists (name) VALUES ("Pennywise");
INSERT INTO artists (name) VALUES ("Candy Hearts");
INSERT INTO artists (name) VALUES ("Knuckle Puck");
INSERT INTO artists (name) VALUES ("The Draft");
INSERT INTO artists (name) VALUES ("The Explosion");


INSERT INTO artists (name) VALUES ("Louis Armstrong");
INSERT INTO artists (name) VALUES ("John Coltrane");
INSERT INTO artists (name) VALUES ("Billie Holiday");
INSERT INTO artists (name) VALUES ("Miles Davis");
INSERT INTO artists (name) VALUES ("Charlie Parker");
INSERT INTO artists (name) VALUES ("Duke Ellington");
INSERT INTO artists (name) VALUES ("Thelonious Monk");
INSERT INTO artists (name) VALUES ("Count Basie");
INSERT INTO artists (name) VALUES ("Charles Mingus");
INSERT INTO artists (name) VALUES ("Dizzy Gillespie");
INSERT INTO artists (name) VALUES ("Michael J. Thomas");
INSERT INTO artists (name) VALUES ("Lin Rountree");
INSERT INTO artists (name) VALUES ("Rick Braun");
INSERT INTO artists (name) VALUES ("Norman Brown");
INSERT INTO artists (name) VALUES ("Nick Colionne");
INSERT INTO artists (name) VALUES ("Melinda Doolittle"); 
INSERT INTO artists (name) VALUES ("Ella Fitzgerald");
INSERT INTO artists (name) VALUES ("Gregory Porter");
INSERT INTO artists (name) VALUES ("Billie Eckstine");
INSERT INTO artists (name) VALUES ("Johnny Hartman");
INSERT INTO artists (name) VALUES ("James Brown");
INSERT INTO artists (name) VALUES ("Till Brönner");
INSERT INTO artists (name) VALUES ("Rosemary Clooney");
INSERT INTO artists (name) VALUES ("Blosson Dearie");


INSERT INTO artists (name) VALUES ("Michael Jackson");
INSERT INTO artists (name) VALUES ("Madonna");
INSERT INTO artists (name) VALUES ("Rihanna");
INSERT INTO artists (name) VALUES ("Lady Gaga");
INSERT INTO artists (name) VALUES ("Britney Spears");
INSERT INTO artists (name) VALUES ("Katy Perry");
INSERT INTO artists (name) VALUES ("Justin Timberlake");
INSERT INTO artists (name) VALUES ("U2");
INSERT INTO artists (name) VALUES ("Beyoncé");
INSERT INTO artists (name) VALUES ("Christina Aguilera");
INSERT INTO artists (name) VALUES ("Miley Cyrus");
INSERT INTO artists (name) VALUES ("Demi lovato");
INSERT INTO artists (name) VALUES ("Taylor Swift");
INSERT INTO artists (name) VALUES ("Shakira");
INSERT INTO artists (name) VALUES ("Dua Lipa");
INSERT INTO artists (name) VALUES ("Camila Cabello");
INSERT INTO artists (name) VALUES ("Sofia Reyes");
INSERT INTO artists (name) VALUES ("Ed Sheeran");
INSERT INTO artists (name) VALUES ("OneRepublic");
INSERT INTO artists (name) VALUES ("Maroon 5");
INSERT INTO artists (name) VALUES ("Charlie Puth");
INSERT INTO artists (name) VALUES ("Shawn Mendes");


INSERT INTO artists (name) VALUES ("Eminem");
INSERT INTO artists (name) VALUES ("Porta");
INSERT INTO artists (name) VALUES ("Snoop Dogg");
INSERT INTO artists (name) VALUES ("Tupac");
INSERT INTO artists (name) VALUES ("50 Cent");
INSERT INTO artists (name) VALUES ("Ice Cube");
INSERT INTO artists (name) VALUES ("Dr.Dre");
INSERT INTO artists (name) VALUES ("Chyste mc");
INSERT INTO artists (name) VALUES ("Nach");
INSERT INTO artists (name) VALUES ("Zpu");
INSERT INTO artists (name) VALUES ("Machine Gun Kelly");
INSERT INTO artists (name) VALUES ("Lil Pump");
INSERT INTO artists (name) VALUES ("Drake");
INSERT INTO artists (name) VALUES ("BlocBoy JB");
INSERT INTO artists (name) VALUES ("Saweetie");
INSERT INTO artists (name) VALUES ("Meek Mill");
INSERT INTO artists (name) VALUES ("Yung Gravy");
INSERT INTO artists (name) VALUES ("YoungBoy Never Broke Again");
INSERT INTO artists (name) VALUES ("Chance The Rapper");
INSERT INTO artists (name) VALUES ("J. Cole");
INSERT INTO artists (name) VALUES ("Rich The Kid");
INSERT INTO artists (name) VALUES ("Cardi B");
INSERT INTO artists (name) VALUES ("NF");
INSERT INTO artists (name) VALUES ("Nicki Minaj");
INSERT INTO artists (name) VALUES ("G Herbo");
INSERT INTO artists (name) VALUES ("G-Eazy");
INSERT INTO artists (name) VALUES ("Joyner Lucas");
INSERT INTO artists (name) VALUES ("Remy Ma");


INSERT INTO artists (name) VALUES ("Daft punk");
INSERT INTO artists (name) VALUES ("Massive Atack");
INSERT INTO artists (name) VALUES ("The prodigy");
INSERT INTO artists (name) VALUES ("Air");
INSERT INTO artists (name) VALUES ("Moby");
INSERT INTO artists (name) VALUES ("The Chemical Brothers");
INSERT INTO artists (name) VALUES ("Goldfrapp");
INSERT INTO artists (name) VALUES ("The knife");
INSERT INTO artists (name) VALUES ("Crystal Castles");
INSERT INTO artists (name) VALUES ("Lamb");
INSERT INTO artists (name) VALUES ("The Chainsmokers");
INSERT INTO artists (name) VALUES ("Kygo");
INSERT INTO artists (name) VALUES ("Avicii");
INSERT INTO artists (name) VALUES ("Zedd");
INSERT INTO artists (name) VALUES ("Jack Ü");
INSERT INTO artists (name) VALUES ("Calvin Harris");
INSERT INTO artists (name) VALUES ("AJ Salvatore, Fluencee");
INSERT INTO artists (name) VALUES ("Gorillaz");



INSERT INTO artists (name) VALUES ("Marama");
INSERT INTO artists (name) VALUES ("Rombai");
INSERT INTO artists (name) VALUES ("Amar Azul");
INSERT INTO artists (name) VALUES ("Combo tortuga");
INSERT INTO artists (name) VALUES ("Chico Trujillo");
INSERT INTO artists (name) VALUES ("Los Charros");
INSERT INTO artists (name) VALUES ("Yerba Brava");
INSERT INTO artists (name) VALUES ("Guachupé");
INSERT INTO artists (name) VALUES ("Villa Cariño");
INSERT INTO artists (name) VALUES ("La sonora de Tommy Rey");
INSERT INTO artists (name) VALUES ("Antonio Rios");


INSERT INTO artists (name) VALUES ("Mozart (Wolfgang Amadeus Mozart)");
INSERT INTO artists (name) VALUES ("Beethoven (Ludwig van Beethoven)");
INSERT INTO artists (name) VALUES ("Tchaikovski (Piotr Ilich Chaikovski)");
INSERT INTO artists (name) VALUES ("Chopin (Frédéric Chopin)");
INSERT INTO artists (name) VALUES ("Vivaldi (Antoni Vivaldi)");
INSERT INTO artists (name) VALUES ("Richard Wagner ");
INSERT INTO artists (name) VALUES ("Johannes Brahms");
INSERT INTO artists (name) VALUES ("Igor Stravinski ");
INSERT INTO artists (name) VALUES ("Claude Debussy");


INSERT INTO artists (name) VALUES ("Alexis y Fido");
INSERT INTO artists (name) VALUES ("Bad Bunny");
INSERT INTO artists (name) VALUES ("Becky G");
INSERT INTO artists (name) VALUES ("CNCO");
INSERT INTO artists (name) VALUES ("Daddy Yankee");
INSERT INTO artists (name) VALUES ("Danny Ocean");
INSERT INTO artists (name) VALUES ("Don Omar");
INSERT INTO artists (name) VALUES ("Enrique Iglesias");
INSERT INTO artists (name) VALUES ("J Balvin");
INSERT INTO artists (name) VALUES ("Maluma");
INSERT INTO artists (name) VALUES ("Natti Natasha");
INSERT INTO artists (name) VALUES ("Nicky Jam ");
INSERT INTO artists (name) VALUES ("Ozuna");
INSERT INTO artists (name) VALUES ("Piso 21");
INSERT INTO artists (name) VALUES ("Pitbull");
INSERT INTO artists (name) VALUES ("Princesa Alba");
INSERT INTO artists (name) VALUES ("Wisin");
INSERT INTO artists (name) VALUES ("Yandel");
INSERT INTO artists (name) VALUES ("Zion & Lennox");


INSERT INTO artists (name) VALUES ("Alejandro Filio");
INSERT INTO artists (name) VALUES ("Angelo Escobar");
INSERT INTO artists (name) VALUES ("Eduardo Peralta");
INSERT INTO artists (name) VALUES ("León Gieco");
INSERT INTO artists (name) VALUES ("Manuel García");
INSERT INTO artists (name) VALUES ("Noel Nicola");
INSERT INTO artists (name) VALUES ("Pablo Milanés");
INSERT INTO artists (name) VALUES ("Silvio Rodriguez");
INSERT INTO artists (name) VALUES ("Sindo Garay");
INSERT INTO artists (name) VALUES ("Victor Heredia");

INSERT INTO artists (name) VALUES ("B.B king");
INSERT INTO artists (name) VALUES ("Blind Lemon");
INSERT INTO artists (name) VALUES ("Eric Clapton");
INSERT INTO artists (name) VALUES ("Muddy Waters");
INSERT INTO artists (name) VALUES ("Ray Charles");
INSERT INTO artists (name) VALUES ("Robert Johnson");


INSERT INTO artists (name) VALUES ("Asleep at the wheel");
INSERT INTO artists (name) VALUES ("Brad Paisley");
INSERT INTO artists (name) VALUES ("Dixie Chicks");
INSERT INTO artists (name) VALUES ("Hudson Moore");
INSERT INTO artists (name) VALUES ("Josh Turner");
INSERT INTO artists (name) VALUES ("Keith Urban");
INSERT INTO artists (name) VALUES ("Lady Antebellum");
INSERT INTO artists (name) VALUES ("Little Big Town");
INSERT INTO artists (name) VALUES ("Sam Hunt");
INSERT INTO artists (name) VALUES ("Sugarland");
INSERT INTO artists (name) VALUES ("The Band Perry");
INSERT INTO artists (name) VALUES ("The Carter Family");
INSERT INTO artists (name) VALUES ("The Everly Brothers");
INSERT INTO artists (name) VALUES ("yodeling boy");
INSERT INTO artists (name) VALUES ("Zac Brown Band");


INSERT INTO artists (name) VALUES ("Barry White");
INSERT INTO artists (name) VALUES ("Bee Gees");
INSERT INTO artists (name) VALUES ("Boney M");
INSERT INTO artists (name) VALUES ("Chic");
INSERT INTO artists (name) VALUES ("Diana Ross");
INSERT INTO artists (name) VALUES ("Donna Summer");
INSERT INTO artists (name) VALUES ("Gloria Gaynor");
INSERT INTO artists (name) VALUES ("Lipps Inc");
INSERT INTO artists (name) VALUES ("Patrick Hernandez");
INSERT INTO artists (name) VALUES ("Rick James");
INSERT INTO artists (name) VALUES ("The Jackson 5");
INSERT INTO artists (name) VALUES ("The Trammps");
INSERT INTO artists (name) VALUES ("Village People");


INSERT INTO artists (name) VALUES ("Bob Dylan");
INSERT INTO artists (name) VALUES ("Caetano Veloso");
INSERT INTO artists (name) VALUES ("Illapu");
INSERT INTO artists (name) VALUES ("Inti illimani");
INSERT INTO artists (name) VALUES ("Los jaiva");
INSERT INTO artists (name) VALUES ("Margot Loyola");
INSERT INTO artists (name) VALUES ("Neil Young");
INSERT INTO artists (name) VALUES ("Patricio Manns");
INSERT INTO artists (name) VALUES ("Quilapayún");
INSERT INTO artists (name) VALUES ("Victor Jara");
INSERT INTO artists (name) VALUES ("Violeta Parra");


INSERT INTO artists (name) VALUES ("Average White Band");
INSERT INTO artists (name) VALUES ("Bruno Mars");
INSERT INTO artists (name) VALUES ("Cameo");
INSERT INTO artists (name) VALUES ("Chanchos en piedra");
INSERT INTO artists (name) VALUES ("Commodores");
INSERT INTO artists (name) VALUES ("Danny Gokey");
INSERT INTO artists (name) VALUES ("Earth, Wind & Fire");
INSERT INTO artists (name) VALUES ("Funkadelic");
INSERT INTO artists (name) VALUES ("Jamiroquai");
INSERT INTO artists (name) VALUES ("Kool and the Gang");
INSERT INTO artists (name) VALUES ("Los tetas");
INSERT INTO artists (name) VALUES ("Mamma Soul");
INSERT INTO artists (name) VALUES ("Mtume");
INSERT INTO artists (name) VALUES ("Papanegro");
INSERT INTO artists (name) VALUES ("Parliament");
INSERT INTO artists (name) VALUES ("Primus");
INSERT INTO artists (name) VALUES ("Rick James");
INSERT INTO artists (name) VALUES ("Stevie Wonder");
INSERT INTO artists (name) VALUES ("Zapp");


INSERT INTO artists (name) VALUES ("Artic Monkeys");
INSERT INTO artists (name) VALUES ("Blur");
INSERT INTO artists (name) VALUES ("Bright eyes");
INSERT INTO artists (name) VALUES ("Dinosaur Jr.");
INSERT INTO artists (name) VALUES ("Echosmith");
INSERT INTO artists (name) VALUES ("Florence + The Machine");
INSERT INTO artists (name) VALUES ("Foals");
INSERT INTO artists (name) VALUES ("Foster the People");
INSERT INTO artists (name) VALUES ("Franz Ferdinand");
INSERT INTO artists (name) VALUES ("Glass Animals");
INSERT INTO artists (name) VALUES ("HAIM");
INSERT INTO artists (name) VALUES ("Imagine Dragons");
INSERT INTO artists (name) VALUES ("Javiera Mena");
INSERT INTO artists (name) VALUES ("Kings of Leon");
INSERT INTO artists (name) VALUES ("Kodaline");
INSERT INTO artists (name) VALUES ("La ley");
INSERT INTO artists (name) VALUES ("Lana del Rey");
INSERT INTO artists (name) VALUES ("LCD Soundsystem");
INSERT INTO artists (name) VALUES ("Lucybell");
INSERT INTO artists (name) VALUES ("M83");
INSERT INTO artists (name) VALUES ("Pavement");
INSERT INTO artists (name) VALUES ("Plastic cup");
INSERT INTO artists (name) VALUES ("Radiohead");
INSERT INTO artists (name) VALUES ("Spoon");
INSERT INTO artists (name) VALUES ("Sufjan Stevens");
INSERT INTO artists (name) VALUES ("The Killers");
INSERT INTO artists (name) VALUES ("The Strokes");
INSERT INTO artists (name) VALUES ("The Vaselines");
INSERT INTO artists (name) VALUES ("The White Stripes");
INSERT INTO artists (name) VALUES ("The XX");
INSERT INTO artists (name) VALUES ("Tom Walker");
INSERT INTO artists (name) VALUES ("Yo la tengo");


INSERT INTO artists (name) VALUES ("Alborosie");
INSERT INTO artists (name) VALUES ("Bob Marley");
INSERT INTO artists (name) VALUES ("Burning Spear");
INSERT INTO artists (name) VALUES ("Cultura Profético");
INSERT INTO artists (name) VALUES ("Damian Marley");
INSERT INTO artists (name) VALUES ("Dread Mar-I");
INSERT INTO artists (name) VALUES ("Ganja Smuggling");
INSERT INTO artists (name) VALUES ("Gondwana");
INSERT INTO artists (name) VALUES ("Inna de Yard");
INSERT INTO artists (name) VALUES ("Jimmy Cliff");
INSERT INTO artists (name) VALUES ("Jr. Gong");
INSERT INTO artists (name) VALUES ("King General");
INSERT INTO artists (name) VALUES ("Lee Perry");
INSERT INTO artists (name) VALUES ("Mellow Mood");
INSERT INTO artists (name) VALUES ("Midnite");
INSERT INTO artists (name) VALUES ("Movimiento Original");
INSERT INTO artists (name) VALUES ("Mungo's Hi-Fi");
INSERT INTO artists (name) VALUES ("Peter Tosh");
INSERT INTO artists (name) VALUES ("Protoje");
INSERT INTO artists (name) VALUES ("Shamanes");
INSERT INTO artists (name) VALUES ("SOJA");
INSERT INTO artists (name) VALUES ("Stephen Marley");
INSERT INTO artists (name) VALUES ("Stick Figure");
INSERT INTO artists (name) VALUES ("UB40");


INSERT INTO artists (name) VALUES ("Alton Ellis");
INSERT INTO artists (name) VALUES ("Desmond Dekker");
INSERT INTO artists (name) VALUES ("Desorden Público");
INSERT INTO artists (name) VALUES ("Doctor Krapula");
INSERT INTO artists (name) VALUES ("Guachupé");
INSERT INTO artists (name) VALUES ("Inspector");
INSERT INTO artists (name) VALUES ("Jimmy Cliff");
INSERT INTO artists (name) VALUES ("Karma");
INSERT INTO artists (name) VALUES ("La Sonora Skandalera");
INSERT INTO artists (name) VALUES ("La Tremenda Korte");
INSERT INTO artists (name) VALUES ("La maldita vecindad");
INSERT INTO artists (name) VALUES ("La matatena");
INSERT INTO artists (name) VALUES ("Lord Tanamo");
INSERT INTO artists (name) VALUES ("Los Calzones Roto");
INSERT INTO artists (name) VALUES ("Los Fabulosos Cadillacs");
INSERT INTO artists (name) VALUES ("Los autenticos Decadentes");
INSERT INTO artists (name) VALUES ("Madness");
INSERT INTO artists (name) VALUES ("Maskatesta");
INSERT INTO artists (name) VALUES ("Molotov");
INSERT INTO artists (name) VALUES ("Prince Buster");
INSERT INTO artists (name) VALUES ("Skaleno");
INSERT INTO artists (name) VALUES ("The Skatalites");
INSERT INTO artists (name) VALUES ("The Specials");
INSERT INTO artists (name) VALUES ("The Wailers");
INSERT INTO artists (name) VALUES ("ska-p");


INSERT INTO artists (name) VALUES ("Celia Cruz");
INSERT INTO artists (name) VALUES ("Chichi Peralta");
INSERT INTO artists (name) VALUES ("Eddie Santiago");
INSERT INTO artists (name) VALUES ("Frankie Ruiz");
INSERT INTO artists (name) VALUES ("Gilberto Santa Rosa");
INSERT INTO artists (name) VALUES ("Grupo Niche");
INSERT INTO artists (name) VALUES ("Hector Lavoe");
INSERT INTO artists (name) VALUES ("Jerry Rivera");
INSERT INTO artists (name) VALUES ("Joe Arroyo");
INSERT INTO artists (name) VALUES ("La India");
INSERT INTO artists (name) VALUES ("Lalo Rodríguez");
INSERT INTO artists (name) VALUES ("Marc Anthony");
INSERT INTO artists (name) VALUES ("Oscar D' León");
INSERT INTO artists (name) VALUES ("Ruben Blades");
INSERT INTO artists (name) VALUES ("Tito Puente");
INSERT INTO artists (name) VALUES ("Tony Vega");
INSERT INTO artists (name) VALUES ("Willie Colon");
INSERT INTO artists (name) VALUES ("Yiyo Sarante");


INSERT INTO artists (name) VALUES ("Antonio Carlos Jobim");
INSERT INTO artists (name) VALUES ("Astrud Gilberto");
INSERT INTO artists (name) VALUES ("Bebel Gilberto");
INSERT INTO artists (name) VALUES ("BREEZE");
INSERT INTO artists (name) VALUES ("Caetano Veloso");
INSERT INTO artists (name) VALUES ("Carlos Lyra");
INSERT INTO artists (name) VALUES ("Chico Buarque");
INSERT INTO artists (name) VALUES ("Elis Regina");
INSERT INTO artists (name) VALUES ("Gal Costa");
INSERT INTO artists (name) VALUES ("Gilberto Gil");
INSERT INTO artists (name) VALUES ("Toquinho");
INSERT INTO artists (name) VALUES ("Vinícius de Moraes");


INSERT INTO artists (name) VALUES ("Alexander Pires");
INSERT INTO artists (name) VALUES ("Alex Ubago");
INSERT INTO artists (name) VALUES ("Bryan Adams");
INSERT INTO artists (name) VALUES ("Camila Gallardo");
INSERT INTO artists (name) VALUES ("Camilo Sesto");
INSERT INTO artists (name) VALUES ("Chayanne");
INSERT INTO artists (name) VALUES ("David Bisbal");
INSERT INTO artists (name) VALUES ("Franco de Vita");
INSERT INTO artists (name) VALUES ("Jesse & Joy");
INSERT INTO artists (name) VALUES ("José José");
INSERT INTO artists (name) VALUES ("Juanes");
INSERT INTO artists (name) VALUES ("Kany García");
INSERT INTO artists (name) VALUES ("Luciano Pereyra");
INSERT INTO artists (name) VALUES ("Luis Fonsi");
INSERT INTO artists (name) VALUES ("Luis Miguel");
INSERT INTO artists (name) VALUES ("Matisse");
INSERT INTO artists (name) VALUES ("Melendi");
INSERT INTO artists (name) VALUES ("Mon Laferte");
INSERT INTO artists (name) VALUES ("Pablo Alborán");
INSERT INTO artists (name) VALUES ("Reik");
INSERT INTO artists (name) VALUES ("Ricardo Arjona");
INSERT INTO artists (name) VALUES ("Ricardo Montaner");
INSERT INTO artists (name) VALUES ("Sebastián Yatra");
INSERT INTO artists (name) VALUES ("Sin Bandera");


INSERT INTO genres (name, id_artist) VALUES ("Rock", 1);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 2);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 3);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 4);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 5);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 6);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 7);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 8);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 9);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 10);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 11);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 12);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 13);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 14);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 15);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 16);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 17);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 18);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 19);
INSERT INTO genres (name, id_artist) VALUES ("Rock", 20);

 
INSERT INTO genres (name, id_artist) VALUES ("Metal", 21);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 22);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 23);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 24);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 25);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 26);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 27);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 28);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 29);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 30);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 31);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 32);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 33);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 34);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 35);
INSERT INTO genres (name, id_artist) VALUES ("Metal", 36);


INSERT INTO genres (name, id_artist) VALUES ("Punk", 37);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 38);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 39);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 40);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 41);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 42);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 43);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 44);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 45);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 46);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 47);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 48);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 49);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 50);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 51);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 52);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 53);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 54);
INSERT INTO genres (name, id_artist) VALUES ("Punk", 55);


INSERT INTO genres (name, id_artist) VALUES ("Jazz", 56);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 57);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 58);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 59);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 60);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 61);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 62);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 63);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 64);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 65);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 66);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 67);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 68);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 69);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 70);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 71);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 72);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 73);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 74);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 75);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 76);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 77);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 78);
INSERT INTO genres (name, id_artist) VALUES ("Jazz", 79);


INSERT INTO genres (name, id_artist) VALUES ("Pop", 80);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 81);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 82);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 83);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 84);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 85);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 86);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 87);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 88);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 89);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 90);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 91);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 92);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 93);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 94);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 95);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 96);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 97);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 98);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 99);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 100);
INSERT INTO genres (name, id_artist) VALUES ("Pop", 101);


INSERT INTO genres (name, id_artist) VALUES ("Rap", 102);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 103);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 104);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 105);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 106);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 107);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 108);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 109);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 110);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 111);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 112);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 113);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 114);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 115);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 116);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 117);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 118);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 119);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 120);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 121);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 122);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 123);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 124);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 125);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 126);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 127);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 128);
INSERT INTO genres (name, id_artist) VALUES ("Rap", 129);


INSERT INTO genres (name, id_artist) VALUES ("Electronica", 130);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 131);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 132);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 133);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 134);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 135);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 136);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 137);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 138);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 139);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 140);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 141);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 142);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 143);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 144);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 145);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 146);
INSERT INTO genres (name, id_artist) VALUES ("Electronica", 147);


INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 148);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 149);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 150);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 151);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 152);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 153);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 154);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 155);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 156);
INSERT INTO genres (name, id_artist) VALUES ("Cumbia", 157);


INSERT INTO genres (name, id_artist) VALUES ("Clasica", 158);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 159);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 160);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 161);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 162);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 163);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 164);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 165);
INSERT INTO genres (name, id_artist) VALUES ("Clasica", 166);


INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 167);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 168);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 169);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 170);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 171);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 172);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 173);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 174);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 175);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 176);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 177);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 178);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 179);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 180);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 181);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 182);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 183);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 184);
INSERT INTO genres (name, id_artist) VALUES ("Reggaeton", 185);


INSERT INTO genres (name, id_artist) VALUES ("Trova", 186);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 187);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 188);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 189);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 190);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 191);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 192);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 193);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 194);
INSERT INTO genres (name, id_artist) VALUES ("Trova", 195);


INSERT INTO genres (name, id_artist) VALUES ("Blues", 196);
INSERT INTO genres (name, id_artist) VALUES ("Blues", 197);
INSERT INTO genres (name, id_artist) VALUES ("Blues", 198);
INSERT INTO genres (name, id_artist) VALUES ("Blues", 199);
INSERT INTO genres (name, id_artist) VALUES ("Blues", 200);
INSERT INTO genres (name, id_artist) VALUES ("Blues", 201);


INSERT INTO genres (name, id_artist) VALUES ("Country", 202);
INSERT INTO genres (name, id_artist) VALUES ("Country", 203);
INSERT INTO genres (name, id_artist) VALUES ("Country", 204);
INSERT INTO genres (name, id_artist) VALUES ("Country", 205);
INSERT INTO genres (name, id_artist) VALUES ("Country", 206);
INSERT INTO genres (name, id_artist) VALUES ("Country", 207);
INSERT INTO genres (name, id_artist) VALUES ("Country", 208);
INSERT INTO genres (name, id_artist) VALUES ("Country", 209);
INSERT INTO genres (name, id_artist) VALUES ("Country", 210);
INSERT INTO genres (name, id_artist) VALUES ("Country", 211);
INSERT INTO genres (name, id_artist) VALUES ("Country", 212);
INSERT INTO genres (name, id_artist) VALUES ("Country", 213);
INSERT INTO genres (name, id_artist) VALUES ("Country", 214);
INSERT INTO genres (name, id_artist) VALUES ("Country", 215);
INSERT INTO genres (name, id_artist) VALUES ("Country", 216);


INSERT INTO genres (name, id_artist) VALUES ("Disco", 217);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 218);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 219);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 220);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 221);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 222);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 223);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 224);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 225);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 226);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 227);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 228);
INSERT INTO genres (name, id_artist) VALUES ("Disco", 229);


INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 230);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 231);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 232);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 233);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 234);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 235);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 236);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 237);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 238);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 239);
INSERT INTO genres (name, id_artist) VALUES ("Folcklorica", 240);


INSERT INTO genres (name, id_artist) VALUES ("Funk", 241);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 242);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 243);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 244);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 245);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 246);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 247);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 248);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 249);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 250);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 251);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 252);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 253);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 254);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 255);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 256);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 257);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 258);
INSERT INTO genres (name, id_artist) VALUES ("Funk", 259);


INSERT INTO genres (name, id_artist) VALUES ("Indie", 260);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 261);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 262);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 263);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 264);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 265);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 266);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 267);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 268);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 269);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 270);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 271);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 272);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 273);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 274);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 275);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 276);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 277);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 278);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 279);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 280);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 281);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 282);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 283);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 284);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 285);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 286);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 287);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 288);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 289);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 290);
INSERT INTO genres (name, id_artist) VALUES ("Indie", 291);


INSERT INTO genres (name, id_artist) VALUES ("Reggae", 292);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 293);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 294);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 295);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 296);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 297);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 298);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 299);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 300);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 301);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 302);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 303);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 304);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 305);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 306);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 307);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 308);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 309);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 310);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 311);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 312);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 313);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 314);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 315);
INSERT INTO genres (name, id_artist) VALUES ("Reggae", 316);


INSERT INTO genres (name, id_artist) VALUES ("Ska", 317);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 318);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 319);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 320);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 321);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 322);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 323);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 324);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 325);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 326);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 327);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 328);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 329);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 330);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 331);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 332);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 333);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 334);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 335);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 336);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 337);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 338);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 339);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 340);
INSERT INTO genres (name, id_artist) VALUES ("Ska", 341);



INSERT INTO genres (name, id_artist) VALUES ("Salsa", 342);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 343);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 344);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 345);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 346);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 347);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 348);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 349);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 350);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 351);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 352);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 353);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 354);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 355);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 356);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 357);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 358);
INSERT INTO genres (name, id_artist) VALUES ("Salsa", 359);


INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 360);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 361);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 362);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 363);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 364);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 365);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 366);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 367);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 368);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 369);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 370);
INSERT INTO genres (name, id_artist) VALUES ("Bossa Nova", 371);


INSERT INTO genres (name, id_artist) VALUES ("Balada", 372);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 373);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 374);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 375);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 376);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 377);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 378);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 379);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 380);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 381);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 382);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 383);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 384);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 385);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 386);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 387);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 388);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 389);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 390);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 391);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 392);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 393);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 394);
INSERT INTO genres (name, id_artist) VALUES ("Balada", 395);


