
--- using Group by clause and Aggregate functions:
---1.Count of Books in Each Category [This shows how many books exist in each category.]

SELECT c.CategoryName,
COUNT(b.BookID) AS TotalBooks
FROM Book b
JOIN Category c ON b.CategoryID = c.CategoryID
GROUP BY c.CategoryName;


---2.Number of Books Loaned by Each Member [This shows how many books each member has borrowed.]

SELECT m.Name AS MemberName,
COUNT(l.LoanID) AS TotalLoans
FROM   Loan l
JOIN  Member m ON l.MemberID = m.MemberID
GROUP BY  m.Name;

-- 3.Average Number of Loans per Librarian [Shows how many loans each librarian has handled and the average loan duration.]
SELECT lib.Name AS LibrarianName,
COUNT(l.LoanID) AS TotalLoans,
AVG(JULIANDAY(COALESCE(l.ReturnDate, DATE('now'))) - JULIANDAY(l.LoanDate)) AS AvgLoanDuration
FROM Loan l
JOIN Librarian lib ON l.LibrarianID = lib.LibrarianID
GROUP BY lib.Name;

-- 4. Total Loans per Category [This aggregates loan counts by book category.]
SELECT c.CategoryName,
COUNT(l.LoanID) AS TotalLoans
FROM  Loan l
JOIN  Book b ON l.BookID = b.BookID
JOIN  Category c ON b.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

---5. Members Who Borrowed More Than 1 Book [This filters and shows only those members who borrowed more than one book.]
SELECT m.Name,
COUNT(l.LoanID) AS LoanCount
FROM Loan l
JOIN  Member m ON l.MemberID = m.MemberID
GROUP BY  m.MemberID
HAVING COUNT(l.LoanID) > 1;



