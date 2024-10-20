/*a) Query the relevant tables to retrieve the year of invoice issuance and the genre of the track(s) sold on the invoice.
b) Summarize the calculated net value of invoice items and quantity in separate columns based on the year and genre.
c) Include only those tracks that appear on at least one playlist.
d) Exclude tracks that do not have a composer.
e) Include in the list only tracks that are longer than the average length of tracks in the same genre.
f.) Create a yearly recurring ranking in a new column for the list. Base the ranking on the total quantity sold (higher quantity results in a better ranking). The ranking should follow the Olympic-style format.
67 rows
Last row:
2013	Electronica/Dance	0.99	1	10*/

select YEAR(invoicedate), g.name, Sum(il.unitprice * il.quantity), sum(quantity),
Rank() over (partition by year(invoicedate) order by sum(quantity) desc)
from invoice i join invoiceline il on i.invoiceid = il.invoiceid
join track t on il.trackid = t.trackid
join genre g on t.genreid = g.genreid
where t.trackid in (select trackid from playlisttrack)
and composer is not null
and Milliseconds > (select avg(milliseconds) from track t2 where t2.genreid = t.genreid)
group by YEAR(invoicedate), g.name