CREATE TRIGGER new_customer4
ON Registrations
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO CustomerDetails
    (
        WalletID, 
        CustomerID,
        NameOfCustomer,
        PAN_number,
        RegID
    )
    SELECT *
    FROM CustomerDetails;
END   


