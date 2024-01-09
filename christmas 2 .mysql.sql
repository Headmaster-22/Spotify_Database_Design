CREATE TABLE ArtistS(
    artistSID INT PRIMARY KEY,
    artistSName VARCHAR (100) NOT NULL,
    artistSGender VARCHAR (50) DEFAULT ('Male'),
    artistSPhoneNumber INT NOT NULL
);
CREATE TABLE Follower(
    followerID INT PRIMARY KEY,
    followerName VARCHAR (50) NOT NULL,
    followerGender VARCHAR (50) DEFAULT ('Male'),
    followerPhoneNumber INT 
);
CREATE TABLE Track(
    trackID INT PRIMARY KEY,
    trackName VARCHAR (100) NOT NULL,
    artistsID INT FOREIGN KEY REFERENCES Artists (artistsID)
);
CREATE TABLE Playlists(
    playlistID  INT PRIMARY KEY,
    playlistName VARCHAR (100) NOT NULL,
    playlistSongs VARCHAR (100) NOT NULL 
);
CREATE TABLE Users(
    usersID INT PRIMARY KEY,
    usersName VARCHAR (50) NOT NULL,
    usersGender VARCHAR (100) DEFAULT ('Male'),
    userPhoneNumber INT NOT NULL 
);
CREATE TABLE Album(
    albumID INT PRIMARY KEY,
    albumName VARCHAR (100) NOT NULL,
    albumComposer VARCHAR (50),
    albumSongsNo INT DEFAULT (10)
);
CREATE TABLE Follows(
    artistsID INT FOREIGN KEY REFERENCES Artists(artistSID),
    followerID INT FOREIGN KEY REFERENCES Follower(followerID),
    followsQuantity INT DEFAULT (200)
);
CREATE TABLE Inclusions(
    trackID INT FOREIGN KEY REFERENCES Track(trackID),
    playlistID INT FOREIGN KEY REFERENCES Playlists(playlistID),
    inclusionQuantity INT DEFAULT (10),
    inclusionGenre VARCHAR (40) DEFAULT ('Hip-Hop')
);
CREATE TABLE Listen(
    playlistID INT FOREIGN KEY REFERENCES Playlists(playlistID),
    usersID INT FOREIGN KEY REFERENCES Users(usersID),
    listenGenre VARCHAR (40) DEFAULT ('Hip-Hop')
);
CREATE TABLE Listens(
    userSID INT FOREIGN KEY REFERENCES Users(usersID),
    albumID INT FOREIGN KEY REFERENCES Album(albumID),
    listensQuantity INT DEFAULT (25)
);
CREATE TABLE Uploads(
    artistsID INT FOREIGN KEY REFERENCES Artists(artistSID),
    albumID INT FOREIGN KEY REFERENCES Album(albumID),
    ReleaseDate DATE,
    albumGenre VARCHAR (20) DEFAULT ('Afro-beats')
);
SELECT * FROM ArtistS