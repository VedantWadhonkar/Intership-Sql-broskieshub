create database LibraryDB;
use LibraryDB;

create table Author(
Authorid int primary key auto_increment,
Author_Name varchar(50) not null
);

create table Publisher(
Publisherid int primary key auto_increment,
Publisher_Name varchar(50) not null
);

create table Book(
Bookid int primary key auto_increment,
Title varchar(50) not null,
Authorid int,
Publisherid int,
foreign key (Authorid) references Author(Authorid),
foreign key(Publisherid) references Publisher(Publisherid)
);


insert into Author (Author_Name) values('J.K. Rowling');
insert into Author (Author_Name) values ('George Orwell');

insert into Publisher (Publisher_Name) values ('Bloomsbury');
insert into Publisher (Publisher_Name) values ('Secker & Warburg');

insert into Book(Title , Authorid ,Publisherid) values('Harry Potter and the Philosopher''s Stone', 1, 1);
insert into Book(Title, Authorid ,Publisherid) values ('1984', 2, 2);

select  Book.BookID, Book.Title, Author.Author_Name, Publisher.Publisher_Name
from Book
Join  Author on Book.AuthorID = Author.AuthorID
join  Publisher on Book.PublisherID = Publisher.PublisherID;



