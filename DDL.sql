Create database Donor_tracking_database;

Create Table  Event (

Event_ID int primary key,
Event_name varchar (20) not null,
Event_date date not null,
Venue_name varchar (20) not null,
City varchar (20) not null,
street_name varchar (20) not null

);


Create Table Donor (

Donor_ID int primary key,
SSN int unique not null,
Donor_first_name varchar(15) not null,
Donor_Last_name varchar (15) not null,
Registration_date date not null,
Email varchar (30) not null,
Birth_date date not null,
Country varchar (20) not null,
City varchar (20) not null,
Street_name varchar (20) not null,
nationality varchar (25) default 'jordanian',
staff_Id int,
constraint FK_Staff_ID foreign key (Staff_ID) references Staff(Staff_ID) on update cascade on delete cascade
 

);



CREATE TABLE Donation (

    Donation_ID int primary key,
    Donor_ID int not null,
    Amount int not null check (Amount > 100),
    Donation_date date not null,
    constraint FK_Donor foreign key (Donor_ID) references Donor(Donor_ID) on update cascade on delete cascade
);


create table Donor_phone(

Donor_ID int not null,
Phone_number int ,
primary key (Donor_ID,Phone_number),
constraint FK_Donor_Phone foreign key (Donor_ID) references Donor (Donor_ID) on update cascade on delete cascade

);

Create table donation_Allocation(

Event_ID int not null,
Donation_ID int not null,
primary key (Event_ID, Donation_ID),
constraint fk_event foreign key (Event_ID) references Event(Event_ID) on update cascade on delete cascade,
constraint fk_donation foreign key (Donation_ID) references Donation(Donation_ID) on update cascade on delete no action

);


create table participation(

Donor_ID int not null,
Event_ID int not null,
Participation_date date not null,
primary key (Donor_ID, Event_ID),
constraint fk_donor_participation foreign key (Donor_ID) references Donor(Donor_ID) on update cascade on delete cascade,
constraint fk_event_participation foreign key (Event_ID) references Event(Event_ID) on update cascade on delete cascade

);


create table Staff (

Staff_ID int not null primary key,
Staff_First_Name varchar(20) not null,
Staff_Last_Name varchar(20) not null,
Salary int not null,
Level varchar(10) not null check (Level in ('admin', 'employee')),
Email varchar(30) not null,
Birth_Date date not null,
Country varchar(20) not null,
City varchar(20) not null,
Street_Name varchar(20) not null
        
);


create table Staff_phone (

Staff_ID int ,
Phone_number int,
primary key (Staff_ID, Phone_number),
constraint fk_staff_phone foreign key (Staff_ID) references Staff(Staff_ID) on update cascade on delete restrict
        
);








