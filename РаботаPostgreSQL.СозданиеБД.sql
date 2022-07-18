CREATE TABLE IF NOT EXISTS Performers (
    PerformersID SERIAL PRIMARY KEY,
    Performer_Name TEXT NOT NULL,
    Genre TEXT NOT NULL,
    Albums TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
   GenresID SERIAL PRIMARY KEY,
   Genre TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
   AlbumID SERIAL PRIMARY KEY,
   Album_Title TEXT NOT NULL,
   Performer_Name TEXT NOT NULL,
   Track_Name TEXT NOT NULL,
   Release_Year_Album INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks(
   TrackID SERIAL PRIMARY KEY,
   Track_Name TEXT NOT NULL,
   Duration TIME NOT NULL,
   Album_Title TEXT NOT NULL,
   Album_ID INTEGER NOT NULL REFERENCES Albums(AlbumID)  
);

CREATE TABLE IF NOT EXISTS Collections(
   CollectionID SERIAL PRIMARY KEY,
   Collection_Name TEXT NOT NULL,
   Track_Name TEXT NOT NULL,
   Release_Year_Collection INTEGER NOT NULL
);

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
   TrackID INTEGER NOT NULL REFERENCES Tracks(TrackID),
   Track_Name TEXT NOT NULL
)

-- треки-альбомы один ко многим, один и тот же трек может быть в разных альбомах
-- исполнитель-жанр многие 1 вариант
-- исполнитель-альбом многие 1 вариант
-- треки-сборники многие 2 вариант (трек во множестве сборников)
-- 1 вариант: без повторной записи
-- 2 вариант: с возможжностью повторной записи (студент - отправка ДЗ много раз, например)