/*Individual assignment 2 
Query which partners from which cities made purchases on the online store, and how many different tracks 
they bought. 
a) Query the postal code and city of the customers! If the postal code is not filled out, display "no data." 
b) Join invoices and invoice items, and calculate the total net value of the invoice items in a new column. (Net 
= unit price * quantity). Name the column appropriately. 
c) In a separate column, also query how many different track IDs were involved in the purchases. Name the 
column appropriately. 
d) Exclude customers where the company name is filled out, and only include transactions from 2012 in the 
list! 
e) Remove from the list the cities where only one type of track was purchased.*/

select ISNULL(PostalCode, 'no data') [PostalCode], city, i.invoiceid , SUM(il.Unitprice * il.Quantity) [Net], COUNT(distinct t.TrackId)[Distinct TrackID]
from Customer c join invoice i on c.CustomerId = i.CustomerId
join invoiceline il on i.invoiceid = il.InvoiceId
join track t on il.trackid = t.TrackId
Where Company is null
group by ISNULL(PostalCode, 'no data'), city, i.invoiceid
having COUNT(distinct t.TrackId) > 1

