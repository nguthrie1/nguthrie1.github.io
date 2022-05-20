# nguthrie1.github.io
SQL Practice Hub
"Challenge: Clothing alterations" Update and Delete Pt2

Step 1
We've created a database of clothes, and decided we need a price column. Use ALTER to add a 'price' column to the table. Then select all the columns in each row to see what your table looks like now.
Step 2
Now assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20 dollars, item 3 should be 30 dollars. When you're done, do another SELECT of all the rows to check that it worked as expected.
Step 3
Now insert a new item into the table that has all three attributes filled in, including 'price'. Do one final SELECT of all the rows to check it worked.

CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

alter table clothes add price integer;
select * from clothes;

update clothes set price =10 where id =1;
update clothes set price = 20 where id = 2;
update clothes set price = 30 where id =3;
select* from clothes;

insert into clothes (type, design, price) values ("vest", "blue stars", 40);
select* from clothes
