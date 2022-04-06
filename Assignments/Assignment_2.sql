SELECT * From tracks;
/* ===============================================================================================================================
1. How many tracks does each album have? Your solution should include Album id and its number of tracks sorted from highest to lowest.*/
SELECT AlbumId, Count( AlbumId) as track_number
FROM tracks
GROUP By AlbumId
ORDER By AlbumId ASC, track_number ASC;
-- SELECT AlbumId, Count( *) as track_number FROM tracks GROUP By AlbumId ORDER By track_number DESC, ;
/* ===============================================================================================================================
2. Find the album title of the tracks. Your solution should include track name and its album title.==============================*/
SELECT tracks.name, albums.Title
from tracks Inner JOIN albums
On tracks.AlbumId = albums.AlbumId;
/* ===============================================================================================================================
3.Find the minimum duration of the track in each album. Your solution should include album id, album title and duration of the 
track sorted from highest to lowest. ============================================================================================*/
SELECT tracks.AlbumId, albums.Title, MIN(Milliseconds) as min_duration
from tracks
Inner JOIN albums On tracks.AlbumId = albums.AlbumId
GROUP BY tracks.name
Order By tracks.AlbumId DESC;
/* ===============================================================================================================================
4.Find the total duration of each album. Your solution should include album id, album title and its total duration 
sorted from highest to lowest. ==================================================================================================*/
SELECT tracks.AlbumId, albums.Title, sum(Milliseconds) as total_duration
from tracks
Inner JOIN albums On tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId 
Order BY total_duration DESC;
/* ===============================================================================================================================
5.Based on the previous question, find the albums whose total duration is higher than 70 minutes. Your solution should include 
album title and total duration. ================================================================================================*/
SELECT albums.Title, sum(Milliseconds)/1000000.0 as total_duration_sc
from tracks Inner JOIN albums On tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId 
HAVING total_duration_sc > 70
Order BY total_duration_sc DESC;




 







