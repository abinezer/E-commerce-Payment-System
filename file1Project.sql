INSERT INTO RegTypes
VALUES ('001', 'Admin'),
        ('002', 'SuperAdmin'),
        ('003', 'Merchant'),
        ('004', 'Customer');


Insert into Registrations
Values('1234567', '8971898456', 'tyryr', '003'),
        ('2234567', '8971798456', 'tfryr', '003');

Insert into Permissions
Values ('001', 'Admin', 0,0,0,1),
        ('002', 'SuperAdmin', 1,1,1,1),
        ('003', 'Merchant', 0,0,0,1),
        ('004', 'Customer', 0,0,0,1);



INSERT into IFSC
VALUES ('123456789', 'ICIC RT Nagar', '67876456', 'RT Nagar', '560032'),
        ('223456789', 'IndusInd Frazer', '77876456', 'Frazer Town', '560035'),
        ('323456789', 'Axis Bank', '87876456', 'Marathahalli', '560047');


INSERT into Banks
VALUES ( '87876456','Axis Bank'),
        ( '77876456', 'IndusInd'),
        ( '67876456', 'ICICI ');

INSERT into Wallet
VALUES ('12345', 235, '34759826', '123456789'),
        ('22345', 573, '1233572', '223456789'),
        ('6790', 900, '279422', '323456789'),
        ('3611', 522, '4479421', '223456789');

INSERT into CustomerDetails
Values ('12345', '56565', 'Sarah S', '9876543219', '1234567'),
        ('22345', '66565', 'Nitish S', '8876543219', '2234567'),
        ('3611', '7945', 'Joshua M', '9076483622', '3864175');


INSERT INTO TransactionTypes
VALUES ('2970', 'Customer', 'Merchant'),
       ('2971', 'Customer', 'Customer'),
       ('2972', 'Merchant', 'Customer'),
       ('2973', 'Merchant', 'Merchant');

INSERT INTO Transactions
VALUES ('58314', '12345', '3611', 24, '2019-02-01', '18:42:10', '2971'),
       ('59314', '22345', '6790', 89, '2019-07-18', '09:32:30', '2970'),
       ('58414', '22345', '3611', 100, '2019-09-20', '20:42:10', '2970'),
       ('56714', '3611', '12345', 50, '2019-04-14', '22:45:10', '2971');








