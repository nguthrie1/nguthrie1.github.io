In this project, you’re going to make your own table with some small set of “famous people”, then make more tables about things they do and join those to create nice human readable lists.

For example, here are types of famous people and the questions your data could answer:

Movie stars: What movies are they in? Are they married to each other?
Singers: What songs did they write? Where are they from?
Authors: What books did they write?
Fictional characters: How are they related to other characters? What books do they show up in?


/* Create table about the people and what they do here */

CREATE TABLE Famous (
id INTEGER PRIMARY KEY AUTOINCREMENT, fullname TEXT, age INTEGER, gender TEXT);

INSERT INTO Famous (fullname, age, gender) VALUES ("Beyonce Knowles", "40", "female");
INSERT INTO Famous (fullname, age, gender) VALUES ("John Boyega", "30", "male");
Insert into famous (fullname, age, gender) Values ("Denzel Washington", "67", "male");
Insert into famous (fullname, age, gender) Values ("Jill Scott", "50", "female");
Insert into famous (fullname, age, gender) Values ("Jermaine Cole", "37", "male");
Insert into famous (fullname, age, gender) Values ("Anthony Mackie", "43", "male");
Insert into famous (fullname, age, gender) Values ("Amber Riley", "36", "female");
Insert into famous (fullname, age, gender) Values ("Megan Pete", "27", "female");
Insert into famous (fullname, age, gender) Values ("Kofi Siriboe", "28", "male");
Insert into famous (fullname, age, gender) Values ("Octavia Spencer", "51", "female");
Insert into famous (fullname, age, gender) Values ("Viola Davis", "56", "female");
Insert into famous (fullname, age, gender) Values ("Chloe Bailey", "23", "female");
Insert into famous (fullname, age, gender) Values ("Daniel Kaluuya", "33", "male");
Insert into famous (fullname, age, gender) Values ("Lauren Palmer", "28", "female");
Insert into famous (fullname, age, gender) Values ("Jordan Calloway", "31", "male");



CREATE TABLE Famous_Info (
id INTEGER PRIMARY KEY, 
nickname TEXT);
Insert into Famous_Info Values (1, "Queen B");
Insert into Famous_Info Values (4, "Jilly from Philly");
Insert into Famous_Info Values (5, "J. Cole");
Insert into Famous_Info Values (6, "Mack Attack");
Insert into Famous_Info Values (7, "Riley");
Insert into Famous_Info Values (8, "Meg Thee Stallion");
Insert into Famous_Info Values (14, "Keke Palmer");

CREATE TABLE How_Famous (id INTEGER, famous_projects TEXT, Project_type TEXT);
Insert into How_Famous Values (1, "Cadillac Records", "Movie");
Insert into How_Famous Values (1, "Formation", "Song");
Insert into How_Famous Values (1, "Listen", "Song");
Insert into How_Famous Values (1, "Fighting Temptations", "Movie");
Insert into How_Famous Values (2, "Pacific Rim", "Movie");
Insert into How_Famous Values (2, "Star Wars", "Movie");
Insert into How_Famous Values (2, "Attack the Block", "Movie");
Insert into How_Famous Values (3, "The Book of Eli", "Movie");
Insert into How_Famous Values (3, "Safe House", "Movie");
Insert into How_Famous Values (3, "Inside Man", "Movie");
Insert into How_Famous Values (3, "Training Day", "Movie");
Insert into How_Famous Values (4, "Watching Me", "Song");
Insert into How_Famous Values (4, "Why did I get Married?", "Movie");
Insert into How_Famous Values (4, "A Long Walk", "Song");
Insert into How_Famous Values (4, "Get on Up", "Movie");
Insert into How_Famous Values (5, "GOMD", "Song");
Insert into How_Famous Values (5, "Power Trip", "Song");
Insert into How_Famous Values (6, "The Falcon and the Winter Soldier", "TV Show");
Insert into How_Famous Values (6, "Outside the Wire", "Movie");
Insert into How_Famous Values (6, "Altered Carbon", "TV Show");
Insert into How_Famous Values (6, "The Banker", "Movie");
Insert into How_Famous Values (7, "BGE", "Song");
Insert into How_Famous Values (7, "Ride", "Song");
Insert into How_Famous Values (7, "Glee", "TV Show");
Insert into How_Famous Values (8, "Cry Baby", "Song");
Insert into How_Famous Values (8, "Savage", "Song");
Insert into How_Famous Values (8, "Captain Hook", "Song");
Insert into How_Famous Values (8, "Don't Stop", "Song");
Insert into How_Famous Values (9, "Girls Trip", "Movie");
Insert into How_Famous Values (9, "Queen Sugar", "TV Show");
Insert into How_Famous Values (9, "Really Love", "Movie");
Insert into How_Famous Values (10, "Hidden Figures", "Movie");
Insert into How_Famous Values (10, "Thunder Force", "Movie");
Insert into How_Famous Values (10, "Snowpiercer", "Movie");
Insert into How_Famous Values (11, "Fences", "Movies");
Insert into How_Famous Values (12, "Have Mercy", "Songs");
Insert into How_Famous Values (12, "Fighting Temptations", "movies");
Insert into How_Famous Values (1, "Savage", "Songs");
Insert into How_Famous Values (13, "Black Panther", "Movies");
Insert into How_Famous Values (13, "Get Out", "Movies");
Insert into How_Famous Values (14, "True Jackson, VP", "TV Shows");
Insert into How_Famous Values (14, "Akeelah and the Bee", "TV Shows");
Insert into How_Famous Values (15, "Unfabulous", "TV Shows");
Insert into How_Famous Values (15, "Black Lightning", "TV Shows");
Insert into How_Famous Values (15, "Drumline: A New Beat", "TV Shows");

select * from famous;

select * from famous where age < 42;

select avg(age) from famous;

select famous.fullname, famous.gender
from famous;

select famous.fullname, how_famous.famous_projects, famous_info.nickname
from famous
left outer join how_famous
on famous.id = how_famous.id
left outer join famous_info
on famous.id = famous_info.id
group by famous.fullname;

select famous.fullname, how_famous.famous_projects
from famous
join how_famous
on famous.id = how_famous.id
group by famous.id
