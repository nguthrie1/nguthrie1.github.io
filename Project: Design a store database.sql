Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want your store to specialize in. You should have a table for all the items in your store, and at least 5 columns for the kind of data you think you'd need to store. You should sell at least 15 items, and use select statements to order your items by price and show at least one statistic about the items.

CREATE TABLE NajahsStore (id Integer primary key, item_name text, quantity integer, price integer, aisle integer);
INSERT INTO NAJAHSSTORE values (1, "Red Pens", 52, 2, 1);
insert into najahsstore values (2, "Blue Pens", 68, 2, 1);
insert into najahsstore values (3, "Travel Journals", 19, 10, 2);
insert into najahsstore values (4, "Space Journals", 26, 10, 2);
insert into najahsstore values (5, "Black Pens", 62, 2, 1);
insert into najahsstore values (6, "Fantasy Books", 90, 11, 3);
insert into najahsstore values (7, "Sci Fi Books", 52, 11, 3);
insert into najahsstore values (8, "Romance Books", 111, 11, 3);
insert into najahsstore values (9, "Adventure Books", 37, 11, 3);
insert into najahsstore values (10, "Water Bottles", 96, 3, 4);
insert into najahsstore values (11, "Chocolate Bars", 212, 2, 4);
insert into najahsstore values (12, "Chips", 40, 1, 4);
insert into najahsstore values (13, "Soda Bottles", 100, 3, 4);
insert into najahsstore values (14, "Mini Handsanitizer", 28, 1, 4);
insert into najahsstore values (15, "Phone Cases", 180, 8, 2);
select * from najahsstore order by quantity;
select aisle, item_name, min(price) from najahsstore;
select id, item_name, price from najahsstore where price>2 order by price
