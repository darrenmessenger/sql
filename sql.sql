

/*
Order all of the `Album` records by the `Title` field in 
ascending order
*/
SELECT * FROM Album ORDER BY Title;

/*
Order all of the `Album` records by the `Title` field in
descending order
*/
SELECT * FROM Album ORDER BY Title DESC;

/*
Order all of the `Album` records by the `ArtistId` field in 
ascending order, and within that, order by `Title`
*/
SELECT * FROM Album ORDER BY ArtistId, Title;

/*
Select the Track name and the Album title and order them
by the Album title, and then by the track name
*/
SELECT Track.Name, Album.Title FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
ORDER BY Album.Title, Track.Name;

/*
Select the `InvoiceDate`, `BillingCity` and `Total` from the
`Invoice` table. Order them descendingly and limit the results
to 5
*/
SELECT InvoiceDate, BillingCity, Total FROM Invoice
ORDER BY Total DESC
LIMIT 5;

/*
Select the `InvoiceDate`, `BillingAddress` and `Total` from the
`Invoice` table. Order them descendingly according to the `InvoiceDate`
*/
SELECT InvoiceDate, BillingAddress, Total FROM Invoice ORDER BY InvoiceDate DESC;

/*
We need to fire the last three people hired.
Select the EmployeeId, LastName, FirstName and HireDate of the 3 Employees with the most recent HireDate
Expected : 3 rows (starting with the following)
*/
SELECT EmployeeId, LastName, FirstName, HireDate FROM Employee
ORDER BY HireDate DESC
LIMIT 3;

/*
Disaster, we've heard from Steve Johnson's lawyers.
He claims that Michael Mitchell was hired on the same day as him, but was hired later in the day. Mitchell should have been let go, not him.
Confirm this by extending the number of results and make sure nobody else was hired on that day.
Then modify the query to return the correct 3 people.
Continue to use HireDate as the primary sort column, but use EmployeeId as the tie breaker.
Assume that a higher EmployeeId means they were hired later.
Expected : 3 rows (starting with the following)
*/
SELECT EmployeeId, LastName, FirstName, HireDate FROM Employee
ORDER BY HireDate DESC, EmployeeId DESC
LIMIT 3;

/*
Create a query that shows our 10 biggest invoices by Total value, in descending order.
If two invoices have the same Total, the more recent should appear first.
The query should also show the Name of the Customer
Expected: 10 rows
*/
SELECT 
    concat(Customer.FirstName, " ", Customer.LastName) as Name,
    Invoice.InvoiceDate as Date,
    Invoice.Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Total DESC
LIMIT 10;

/*
Get a count of all of the records in the `Customer` table
*/
SELECT COUNT(*) FROM Customer;

/*
Get a count of all of the records in the `Customer` table
*/
SELECT COUNT(FirstName) FROM Customer;

/*
Get a count of all of the records in the `Customer` table
where the customer's `FirstName` is "Frank"
*/
SELECT COUNT(*) FROM Customer WHERE FirstName = 'Frank';

/*
How Many Customers is Employee 4 the Sales Support Agent For?
*/
SELECT COUNT(FirstName) FROM Customer WHERE SupportRepId = 4;

/*
How Many Customers is Jane Peacock the Sales Support Agent For?
*/
SELECT Employee.FirstName AS Employee, COUNT(Customer.FirstName) AS Customer FROM Employee
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane';

/*
Which Media Type is most popular? How could you answer this with a single query? You probably cannot based on what you know so far. We will get there.
*/
SELECT Employee.FirstName AS Employee, COUNT(Customer.FirstName) AS Customer FROM Employee
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane';

/*
What is the date of birth of our oldest employee?
*/
SELECT MIN(BirthDate) FROM Employee;

/*
On what date was our most recent employee hired?
*/

SELECT MAX(HireDate) FROM Employee;


/*
Sum and total:
*/

SELECT TOTAL FROM Invoice
WHERE InvoiceId = 2;

SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine
WHERE InvoiceId = 2;

/*
How many customers do we have in the City of Berlin Expected : 2
*/

SELECT COUNT(city) FROM Customer WHERE city = "Berlin";

/*
How much has been made in sales for the track "The Woman King". Expected : 3.98
*/
SELECT SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), Track.Name AS Track FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";

/*
Create a list of the top 5 acts by number of tracks. The table should include the name of the artist and the number of tracks they have.
*/
SELECT Artist.Name AS Artist, COUNT(Track.TrackId) AS Track FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.Name)
DESC LIMIT 5;

/*
Insert the remaining Tracks for the Album Boy (except for the last 2-3, insert those as part of Challenge Three)
*/
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Twilight", 348, 2, 1, "U2", 210000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("An Cat Dubh", 348, 2, 1, "U2", 110000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Into the Heart", 348, 2, 1, "U2", 200000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Out of Control", 348, 2, 1, "U2", 100000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Stories for Boys", 348, 2, 1, "U2", 150000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("The Ocean", 348, 2, 1, "U2", 175000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("A Day Without Me", 348, 2, 1, "U2", 185000, 1234, 0.99);

/*
Run the following Query. It gives an error. Read and understand the error, then fix the problem

            Insert into Track (Name, AlbumId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
            values("Extra Track", 348, 1, "U2", 290000, 1234, 0.99);
            */
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES("Extra Track", 348, 2, 1, "U2", 290000, 1234, 0.99);

/*
Use one insert statement to insert multiple tracks at the same time
*/
INSERT INTO Track
    (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
    ("Another Time, Another Place", 348, 2, 1, "U2", 210000, 1234, 0.99),
    ("The Electric Co.", 348, 2, 1, "U2", 200000, 1234, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, "U2", 150000, 1234, 0.99);
    
