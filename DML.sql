

insert into Event (Event_ID, Event_name, Event_date, Venue_name, City, Street_name)
values 
(1, 'Charity Gala', '2025-03-15', 'Grand Hall', 'Amman', 'King Street'),
(2, 'Food Drive', '2025-04-10', 'Community Center', 'Irbid', 'Queen Street'),
(3, 'Blood Donation Camp', '2025-05-05', 'Health Center', 'Zarqa', 'Main Road'),
(4, 'Clothing Drive', '2025-06-20', 'Town Hall', 'Madaba', 'Market Street');

Select * from Event;


insert into Staff (Staff_ID, Staff_First_Name, Staff_Last_Name, Salary, Level, Email, Birth_Date, Country, City, Street_Name)
values 
(1, 'Alice', 'Johnson', 1500, 'admin', 'alice.johnson@EduYouth.com', '1988-02-20', 'Jordan', 'Amman', 'King Street'),
(2, 'Bob', 'Brown', 1200, 'employee', 'bob.brown@EduYouth.com', '1992-06-15', 'Jordan', 'Irbid', 'Queen Street'),
(3, 'Clara', 'Wilson', 1800, 'admin', 'clara.wilson@EduYouth.com', '1985-09-05', 'Jordan', 'Zarqa', 'Main Road'),
(4, 'David', 'Taylor', 1400, 'employee', 'david.taylor@EduYouth.com', '1990-04-10', 'Jordan', 'Madaba', 'Market Street');

Select * from Staff;


insert into Donor (Donor_ID, SSN, Donor_first_name, Donor_Last_name, Registration_date, Email, Birth_date, Country, City, Street_name, Nationality, Staff_ID)
values 
(1, 123456789, 'John', 'Doe', '2025-01-01', 'john.doe@icloud.com', '1985-05-15', 'Jordan', 'Amman', 'Rainbow Street', 'American', 1),
(2, 987654321, 'Jane', 'Smith', '2025-01-15', 'jane.smith@icloud.com', '1990-07-20', 'Jordan', 'Irbid', 'Main Street', 'Jordanian', 2),
(3, 112233445, 'Michael', 'Brown', '2025-02-10', 'michael.brown@gmail.com', '1978-03-25', 'Jordan', 'Zarqa', 'Highway Street', 'Canadian', 3),
(4, 998877665, 'Sara', 'Davis', '2025-02-25', 'sara.davis@gmail.com', '1982-12-10', 'Jordan', 'Madaba', 'Park Lane', 'Jordanian', 4),
(5, 123432455, 'Sameer', 'Jasem', '2025-1-8', 'Sameer.jasem@icloud.com', '1979-04-5', 'Jordan', 'Amman', 'Yarmook Street', 'Canadian', 3);

select * from donor; 

insert into Donation (Donation_ID, Donor_ID, Amount, Donation_date)
values 
(1, 1, 500, '2025-03-01'),
(2, 2, 150, '2025-03-05'),
(3, 3, 200, '2025-03-15'),
(4, 4, 300, '2025-03-20'),
(5, 1, 700, '2025-03-23');

Select * from donation;


insert into Donor_Phone (Donor_ID, Phone_number)
values 
(1, 789456123),
(1, 453452655),
(2, 987123456),
(3, 654321987),
(4, 123789654),
(3, 123123124);

Select * from Donor_Phone;

insert into Donation_Allocation (Event_ID, Donation_ID)
values 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

Select * From donation_allocation;

insert into Participation (Donor_ID, Event_ID, Participation_Date)
values 
(1, 1, '2025-03-15'),
(2, 2, '2025-04-10'),
(3, 3, '2025-05-05'),
(4, 4, '2025-06-20'),
(4, 1, '2025-06-05'),
(3, 2, '2025-01-11');

Select * from participation;


insert into Staff_phone (Staff_ID, Phone_number)
values 
(1, 789123456),
(2, 654789321),
(3, 321987654),
(4, 987654321);

Select * from Staff_phone;




 /*
 1)
 This view, View_All_Donations, provides a comprehensive summary of all donations,
 including the donation details (ID, amount, and date), donor information 
 (first name, last name, and email), and the associated event details 
 (name and date). It joins the Donation, Donor, Donation_Allocation, 
 and Event tables to consolidate data into a single, easy-to-query view
 */
create view View_All_Donations as
select 
    d.Donation_ID, 
    d.Amount, 
    d.Donation_date, 
    dn.Donor_first_name, 
    dn.Donor_last_name, 
    dn.Email, 
    e.Event_name, 
    e.Event_date 
from Donation d
join Donor dn on d.Donor_ID = dn.Donor_ID
join Donation_Allocation da on d.Donation_ID = da.Donation_ID
join Event e on da.Event_ID = e.Event_ID;

Select * from View_All_Donations;



/*
2) 
view all the donors contact information
*/

CREATE VIEW View_Donor_Contact AS
SELECT 
    d.Donor_ID,
    d.Donor_first_name,
    d.Donor_last_name,
    d.Email,
    d.City,
    d.Country,
    dp.Phone_number
FROM Donor d
LEFT JOIN Donor_phone dp ON d.Donor_ID = dp.Donor_ID;

select * from View_Donor_Contact;


/*
3)
view all the staff contact information
*/

CREATE VIEW View_Staff_Contact AS
SELECT 
    s.Staff_ID,
    s.Staff_First_Name,
    s.Staff_Last_Name,
    s.Email,
    s.City,
    s.Country,
    sp.Phone_number
FROM Staff s
LEFT JOIN Staff_phone sp ON s.Staff_ID = sp.Staff_ID;

Select * from View_Staff_Contact;


/*
4)
The View_Total_Donations_Per_Event aggregates and displays the total donation amounts allocated to each event.
 It includes the event details (ID, name, and date) along with the total sum of donations associated with each event.
 The view joins the Event, Donation_Allocation, and Donation tables, 
 grouping the results by event to calculate the total donations per event. 
 This is useful for tracking the financial contributions received for each specific event.
*/

create view View_Total_Donations_Per_Event as
select 
    e.Event_ID, 
    e.Event_name, 
    e.Event_date, 
    sum(d.Amount) as Total_Donations 
from Event e
join Donation_Allocation da on e.Event_ID = da.Event_ID
join Donation d on da.Donation_ID = d.Donation_ID
group by e.Event_ID, e.Event_name, e.Event_date;

Select * from View_Total_Donations_Per_Event;


/*
1)
This procedure calculates the total donations received from donors in each country
*/

DELIMITER $$
CREATE PROCEDURE Get_Total_Donations_By_Country ()
BEGIN
    SELECT 
        d.Country,
        SUM(dn.Amount) AS Total_Donations
    FROM Donor d
    JOIN Donation dn ON d.Donor_ID = dn.Donor_ID
    GROUP BY d.Country;
END$$
DELIMITER ;

CALL Get_Total_Donations_By_Country();


/*
2)
This procedure identifies donors who have contributed more than a specified amount
*/


DELIMITER $$

CREATE PROCEDURE Get_Largest_Donors (
    IN p_Min_Amount INT
)
BEGIN
    SELECT d.Donor_ID,d.Donor_first_name,d.Donor_last_name,SUM(dn.Amount) AS Total_Contribution
    FROM Donor d
    JOIN Donation dn ON d.Donor_ID = dn.Donor_ID
    GROUP BY d.Donor_ID, d.Donor_first_name, d.Donor_last_name
    having SUM(dn.Amount) > p_Min_Amount;
END $$

DELIMITER ;

Call get_Largest_donors (100);


/*
3)
This procedure takes an event ID and returns the list of donors who participated, along with their contact information.
*/

DELIMITER $$
CREATE PROCEDURE Get_Donors_participate (
    p_Event_ID INT
)
BEGIN
    SELECT 
        d.Donor_ID,
        d.Donor_first_name,
        d.Donor_last_name,
        d.Email,
        dp.Phone_number
    FROM Donor d
    JOIN Participation p ON d.Donor_ID = p.Donor_ID
    LEFT JOIN Donor_phone dp ON d.Donor_ID = dp.Donor_ID
    WHERE p.Event_ID = p_Event_ID;
END $$
DELIMITER ;

Call Get_Donors_participate();




/*
4)
get the number doantions by country
*/

DELIMITER $$
CREATE PROCEDURE Get_number_of_donation_by_country ()
BEGIN
    SELECT 
        d.Country,
        count(dn.donation_ID) AS Number_of_donations
    FROM Donor d
    JOIN Donation dn ON d.Donor_ID = dn.Donor_ID
    GROUP BY d.Country;
END$$
DELIMITER ;

Call Get_number_of_donation_by_country;



