create table developers(
    Id INT IDENTITY(1,1) PRIMARY KEY,
	company_name varchar(255),
	country varchar(100),
	founded_year int

)

create table games(
    Id INT IDENTITY(1,1) PRIMARY KEY,
	title varchar(255),
	price decimal(10,2),
	release_date date,
	rating decimal(3,1),
	developer_id int NOT NULL,
	
	CONSTRAINT fk_games_developers
	FOREIGN KEY (developer_id)
	REFERENCES developers(Id)

)
create table genres(
    Id INT IDENTITY(1,1) PRIMARY KEY,
	genres_name varchar(100),
	description varchar(255)
	)

create table games_genres(
    Id INT IDENTITY(1,1) PRIMARY KEY,
	game_id INT NOT NULL,
    genre_id INT NOT NULL

 )
 ALTER TABLE games_genres
ADD CONSTRAINT FK_games_genres_games
FOREIGN KEY (game_id)
REFERENCES games(Id);

ALTER TABLE games_genres
ADD CONSTRAINT FK_games_genres_genres
FOREIGN KEY (genre_id)
REFERENCES genres(Id);


--Insert
INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Bethesda Game Studios', 'USA', 2001),
('Ubisoft', 'France', 1986),
('Valve', 'USA', 1996);

INSERT INTO genres (genres_name, description) VALUES
('RPG', 'Role Playing Game'),
('Open World', 'A��k d�nya oyunlar�'),
('Horror', 'Korku t�r�'),
('FPS', 'First Person Shooter'),
('Sports', 'Spor oyunlar�');

INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 29.99, '2015-05-19', 9.8, 1),
('Cyberpunk 2077', 39.99, '2020-12-10', 8.5, 1),
('GTA V', 24.99, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 39.99, '2018-10-26', 9.8, 2),
('Skyrim', 19.99, '2011-11-11', 9.6, 3),
('Fallout 4', 19.99, '2015-11-10', 8.9, 3),
('Assassin''s Creed Valhalla', 34.99, '2020-11-10', 8.7, 4),
('Far Cry 5', 29.99, '2018-03-27', 8.4, 4),
('Half-Life 2', 9.99, '2004-11-16', 9.5, 5),
('Left 4 Dead 2', 9.99, '2009-11-17', 9.0, 5);


INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2),
(3, 2),
(4, 2),
(5, 1), (5, 2),
(6, 1), (6, 4),
(7, 2),
(8, 2), (8, 4),
(9, 4),
(10, 3);

--Update

UPDATE games
 SET price = price - price*0.1

UPDATE games 
SET rating = 9 WHERE title = 'Cyberpunk 2077';

DELETE from games_genres where  game_id=4
DELETE from games where Id=4

 --Sorgular

 --1.Tum Oyunlar Listesi: 
 
select title,company_name, price from developers d
inner join games g
on d.Id = g.developer_id

--Kategori Filtresi:

select title,price from games 
inner join games_genres 
on games.Id = games_genres.game_id where genre_id= 1

--Fiyat Analizi

select title as 'Game Name',price as 'Price'from games where price >=30 order by price desc

--Arama

select title from games where title like '%the%'
