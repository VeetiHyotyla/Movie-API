CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    name VARCHAR(255)
);
CREATE TABLE "User" (
    "UserID" SERIAL PRIMARY KEY,    
    "Username" VARCHAR(100) NOT NULL UNIQUE, 
    "Password" VARCHAR(100) NOT NULL,
    "YearOfBirth" INT
);

INSERT INTO "User" ("Username", "Password", "YearOfBirth") VALUES
    ('reimarii', 'qwerty123', 1986),
    ('lizzy', 'abcdef', 1991),
    ('boss', 'salasana', 1981);
    
CREATE TABLE "Genre" (
    "GenreID" SERIAL PRIMARY KEY,
    "GenreName" VARCHAR(100) NOT NULL
);
INSERT INTO "Genre" ("GenreName") VALUES 
    ('Action'), 
    ('Comedy'), 
    ('Drama');

CREATE TABLE "Movie" (
    "MovieID" SERIAL PRIMARY KEY,
    "Title" VARCHAR(255) NOT NULL,
    "Year" INT,
    "GenreID" INT,
    "Review" TEXT,
    FOREIGN KEY ("GenreID") REFERENCES "Genre"("GenreID") ON DELETE SET NULL
);

INSERT INTO "Movie" ("Title", "Year", "GenreID") VALUES 
    ('Inception', 2010, 1), 
    ('The Terminator', 1984, 1),
    ('Tropic Thunder', 2008, 2),
    ('Borat', 2006, 2),
    ('Interstellar', 2014, 3),
    ('Joker', 2019, 3);
    
CREATE TABLE "Review" (
    "ReviewID" SERIAL PRIMARY KEY,
    "MovieID" INT,
    "UserID" INT,
    "ReviewText" TEXT,
    FOREIGN KEY ("MovieID") REFERENCES "Movie"("MovieID") ON DELETE CASCADE,
    FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE CASCADE
);
CREATE TABLE "Favorites" (
    "MovieID" INT,
    "UserID" INT,
    PRIMARY KEY ("MovieID", "UserID"),
    FOREIGN KEY ("MovieID") REFERENCES "Movie"("MovieID") ON DELETE CASCADE,
    FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE CASCADE
);
