  
/*
Select every track name and the track's associated media type
*/
SELECT Track.Name, MediaType.Name FROM Track 
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId;


/*
Select every track name and the track's associated genre, where the
name of the genre is "Jazz"
*/
SELECT Track.Name, Genre.Name FROM Track
INNER JOIN Genre on Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Jazz';

/*
Select every track name and the track's associated media type
and genre, where the name of the mdeia type is 
"Protected AAC audio file" and the genre is "Soundtrack"
*/
SELECT Track.Name, MediaType.Name, Genre.Name FROM Track
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
INNER JOIN Genre on Track.GenreId = Genre.GenreId
WHERE MediaType.Name = 'Protected AAC audio file' AND Genre.Name = 'Soundtrack';

/*
Filter to only show results for the 'Grunge' playlist
*/

SELECT Playlist.Name AS Playlist, Track.Name AS Track, Album.Title AS Album, Artist.Name AS Artist FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Playlist.Name = 'Grunge';



/* Find a playlist that contains only 1 track. */

SELECT Playlist.Name as Playlist, COUNT(*) From Playlist INNER JOIN PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId  GROUP BY Playlist HAVING count(*) = 1;

/* 
Create a query that shows our 10 biggest invoices by Total value, in descending order.

If two invoices have the same Total, the more recent should appear first.

The query should also show the Name of the Customer
*/

SELECT 
    concat(Customer.FirstName, " ", Customer.LastName) as Name,
    Invoice.InvoiceDate as Date,
    Invoice.Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Total DESC, InvoiceDate DESC
LIMIT 10;



/* How many customers do we have in the City of Berlin Expected : 2 */

  
SELECT COUNT(city) FROM Customer WHERE city = "Berlin";

/* How much has been made in sales for the track "The Woman King". Expected : 3.98 */

SELECT SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), Track.Name AS Track FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";


/*
Create a list of the top 5 acts by number of tracks. The table should include the name of the artist and the number of tracks they have.

            Iron Maiden	    213
            U2	            135
            Led Zeppelin	114
            Metallica	    112
            Deep Purple	    92

*/

SELECT Artist.Name AS Artist, COUNT(Track.TrackId) AS Track FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.Name)
DESC LIMIT 5;

/* 
to get id need to get them from tables 

select AlbumId from Album where Title = "boy";


*/

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Twilight", 348, 2, 1, "U2", 210000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("An Cat Dubh", 348, 2, 1, "U2", 110000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Into the Heart", 348, 2, 1, "U2", 200000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Out of Control", 348, 2, 1, "U2", 100000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Stories for Boys", 348, 2, 1, "U2", 150000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("The Ocean", 348, 2, 1, "U2", 175000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("A Day Without Me", 348, 2, 1, "U2", 185000, 1234, 0.99);

/* multiple values */


INSERT INTO Track
    (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
    ("Another Time, Another Place", 348, 2, 1, "U2", 210000, 1234, 0.99),
    ("The Electric Co.", 348, 2, 1, "U2", 200000, 1234, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, "U2", 150000, 1234, 0.99);