CREATE TABLE IF NOT EXISTS Performers (
   PerformersID SERIAL PRIMARY KEY,
   Performer_Name TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS Genres (
   GenresID SERIAL PRIMARY KEY,
   Genre TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS Albums (
   AlbumID SERIAL PRIMARY KEY,
   Album_Title TEXT NOT NULL,
   Release_Year_Album INTEGER NOT NULL
)

CREATE TABLE IF NOT EXISTS Tracks(
   TrackID SERIAL PRIMARY KEY,
   Track_Name TEXT NOT NULL,
   Duration TIME NOT NULL,
   Album_ID INTEGER NOT NULL REFERENCES Albums(AlbumID)  
)

CREATE TABLE IF NOT EXISTS Collections(
   CollectionID SERIAL PRIMARY KEY,
   Collection_Name TEXT NOT NULL,
   Release_Year_Collection INTEGER NOT NULL
)

CREATE TABLE IF NOT EXISTS Performers_Genres(
   PerformersID INTEGER REFERENCES Performers(PerformersID),
   GenresID INTEGER REFERENCES Genres(GenresID),
   CONSTRAINT pkPG PRIMARY KEY (PerformersID, GenresID)
)

CREATE TABLE IF NOT EXISTS Performers_Albums(
   PerformersID INTEGER REFERENCES Performers(PerformersID),
   AlbumID INTEGER REFERENCES Albums(AlbumID),
   CONSTRAINT pkPA PRIMARY KEY (PerformersID, AlbumID)
)

CREATE TABLE IF NOT EXISTS Tracks_Collections(
   id SERIAL PRIMARY KEY,
   CollectionID INTEGER NOT NULL REFERENCES Collections(CollectionID),
   TrackID INTEGER NOT NULL REFERENCES Tracks(TrackID)
)

