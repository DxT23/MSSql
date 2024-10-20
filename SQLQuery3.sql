/*Individual assignment 1 
Create a list of albums distributed by the company according to the following criteria: 
a) The list should include the name of the artist and the title of the album. 
b) In a new column, calculate the total length of the album's tracks in minutes. The length is given in 
milliseconds and can be easily converted. Round the result to one decimal place. (Ensure that the 
milliseconds column is an integer; division by an integer can result in data loss). 
c) Filter out the rows where the unit price is greater than one dollar. 
d) In a separate column, indicate how many music tracks are on the album. 
e) Remove albums from the result that have fewer than 5 music tracks.*/
select Artist.Name [Artist Name], Album.Title, round(SUM(Milliseconds)/1000/60.00,1) [Total minutes], COUNT(*)
from Artist join Album on Artist.ArtistId = Album.ArtistId
join track on track.albumid=album.albumid
where  UnitPrice <= 1
group by Artist.Name , Album.Title
having COUNT(*)>=5