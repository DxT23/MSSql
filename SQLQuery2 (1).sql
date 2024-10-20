
/*a) The list should include the track name, duration in minutes, net and gross unit prices (the gross price is to be calculated with a 27% VAT rate, and 
the track's duration is given in milliseconds – a whole number – which needs to be converted to minutes). Name the columns accordingly. 

b) Also, include the media type and artist's name, along with the album title. 

c) Add a new column that shows the price per minute for each music track. Ensure that the price per minute is a fractional number. Round the result to two decimal places. 

d) In a separate column, indicate the category classification based on the price per minute. Less than half a dollar 
should be "Cheap," between half a dollar and five dollars should be "Average," and above five dollars should be labeled as "Expensive." 
e) Include in the list only those tracks whose gross unit price (from part a) exceeds two. 

f) Sort the list based on the artist and album title. 

(213 rows)*/

select t.name [Track Name], milliseconds/1000.00/60 [Minutes], unitprice [Net Price],
unitprice * 1.27 [Gross Price], mt.name[MT Name], Ar.name [Artist Name], Al.title [Album Title],
Round(Unitprice/(milliseconds/1000.00/60), 2) [Price per minute],
Case 
	when Round(Unitprice/(milliseconds/1000.00/60), 2) < 0.5 then 'Cheap'
	when Round(Unitprice/(milliseconds/1000.00/60), 2) between 0.5 and 5 then 'Average'
	when Round(Unitprice/(milliseconds/1000.00/60), 2) > 5 then 'Expensive'
end
from track t join Album Al on t.AlbumId = Al.AlbumId
join Artist Ar on Al.ArtistId = Ar.Artistid
join mediatype mt on t.MediaTypeId = mt.MediaTypeId
where (unitprice * 1.27) > 2
order by Ar.name, Al.title
