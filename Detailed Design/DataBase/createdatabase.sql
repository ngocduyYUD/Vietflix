CREATE TABLE Movie(
	movie_Id SERIAL primary key,
	movie_Name TEXT NOT NULL,
	movie_Length TIME ,
	movie_Source TEXT NOT NULL,
	movie_Des TEXT , 
	movie_Thumb TEXT NOT NULL,
	movie_Actor TEXT ,
	movie_Year text NOT NULL,
	movie_Point text NOT NULL,
	trailer_Source text,
	movie_director text not null
)
 
create table Genre(
	genre_Id serial primary key,
	genre_Name text not null
)
 
create table "Language"(
	language_Id serial primary key,
	language_Name text not null
)
 drop table "Language"
create table Mov_Genre(
	movie_id int not null,
	genre_id int not null,
	constraint fk_movie_genre foreign key (movie_id) references movie(movie_id),
	constraint fk_genre_movie foreign key (genre_id) references genre(genre_id)
);
create table mov_language(
	movie_Id int not null,
	language_Id int not null,
	constraint fk_mov_lang foreign key (movie_Id) references movie(movie_Id),
	constraint fk_lang_mov foreign key (language_Id) references "Language"(language_Id)
)

create table "Member"(
	member_id serial,
	mail text not null,
	pass text not null,
	member_name text not null,
	package_id int,
	exp_package timestamp, 
	constraint fk_member_pack foreign key (package_id) references package(package_id)
);

alter table "Member" add primary key (member_id)

drop table favourite
create table favourite(
	movie_id int not null,
	member_id int not null,
	constraint fk_fav_member foreign key (member_id) references "Member"(member_id),
	constraint fk_fav_movie foreign key (movie_id) references movie(movie_id)
)

create table history(
	member_id int not null,
	movie_id int not null,
	pause_time time,
	constraint fk_his_member foreign key (member_id) references "Member"(member_id),
	constraint fk_his_movie foreign key (movie_id) references movie(movie_id)
)

create table package(
	package_id int primary key,
	package_name text not null,
	price int not null,
	package_time int not null
)