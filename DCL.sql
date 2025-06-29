Create user Employee IDENTIFIED BY '1122';
grant Select on donor_tracking_database.donor to Employee;


Create user Adminstrator IDENTIFIED BY '3333';
grant Select, Insert, Update, Delete on donor_tracking_database.* to Adminstrator;

CREATE USER EventManager IDENTIFIED BY '2025';
GRANT SELECT, INSERT, UPDATE ON donor_tracking_database.Event TO EventManager;
GRANT SELECT ON donor_tracking_database.Donation_Allocation TO EventManager;
GRANT SELECT ON donor_tracking_database.Participation TO EventManager;

CREATE USER DataAnalyst IDENTIFIED BY '3555';
GRANT SELECT, EXECUTE ON donor_tracking_database.* TO DataAnalyst;  
