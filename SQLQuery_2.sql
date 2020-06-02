--Sum of Amounts in the Transactions between customer to customer

SELECT SUM(Amount) AS SumOfTransactions
FROM Transactions AS T
WHERE EXISTS(SELECT *
             FROM Transactions 
             WHERE PayID = '2971');


--Sum of money in the wallets of those who have an account in ICICI bank

SELECT SUM(WalletAmount) AS SumOfAmounts
FROM Wallet
WHERE EXISTS(SELECT *
             FROM IFSC, Wallet
             WHERE BankID_no = '67876456' AND IFSCno = IFSC_code);








