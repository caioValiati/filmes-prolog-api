:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_cors)).


% Define a HTTP handler
:- http_handler(root(films), handle_films_request, []).
:- set_setting(http:cors, [*]).


% Filme data (com imagem em base64 e sinopse)
film('The Green Mile', 'Frank Darabont', 1999, 'drama', 'others', 188, 'USA', 'Tom Hanks', 8.7, 719, 'https://media-cache.cinematerial.com/p/500x/hee7ckor/the-green-mile-movie-poster.jpg?v=1456162832', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has yet to prove that he is the killer.').
film('Bang Bang! You''re Dead!', 'Guy Ferland', 2002, 'drama', 'others', 87, 'Hungary', 'Ben Foster', 7.7, 16, 'https://m.media-amazon.com/images/M/MV5BYTU0Zjc4ZTktOWY5ZC00ZTM0LWE5M2QtY2U0ZGYxZjFhMWU3XkEyXkFqcGdeQXVyMTQxNzMzNDI@.V1_FMjpg_UX580.jpg', 'A young woman and her daughter struggle to survive the violence of war, despite the fact that they are both part of the same family.').
film('Dogville', 'Lars von Trier', 2003, 'drama', 'others', 178, 'Denmark', 'Nicole Kidman', 7.7, 45, 'https://m.media-amazon.com/images/M/MV5BMTkwNTg2MTI1NF5BMl5BanBnXkFtZTcwMDM1MzUyMQ@@.V1_FMjpg_UX486.jpg', 'An epic Tale of the Dogville, set in 1930s New York.').
film('Detachment', 'Tony Kaye', 2011, 'drama', 'others', 100, 'USA', 'Adrien Brody', 7.9, 30, 'https://m.media-amazon.com/images/M/MV5BMTAxNDU2OTUyNDdeQTJeQWpwZ15BbWU4MDM2NTM4MjIy.V1_FMjpg_UX509.jpg', 'A young man becomes involved in an accident and helps a police investigation.').
film('Schindler''s List', 'Steven Spielberg', 1993, 'drama', 'others', 195, 'USA', 'Liam Neeson', 8.4, 259, 'https://m.media-amazon.com/images/M/MV5BYjM5ZjYxNjQtZjdhYi00NzBiLTgyNGItOGU3YTYwYWE0NmEzXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX675.jpg', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.').
film('Requiem for a Dream', 'Darren Aronofsky', 2000, 'drama', 'others', 102, 'USA', 'Jared Leto', 7.9, 520, 'https://m.media-amazon.com/images/M/MV5BZTRkYTQyZjktNjcxMC00MjU1LWEwMTktMTViNWMwY2UzZDcwXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX788.jpg', 'A young boy and his sister struggle to survive after a terrible accident.').
film('Biutiful', 'Alejandro Gonzalez Inarritu', 2010, 'drama', 'others', 148, 'Spain', 'Javier Bardem', 7.6, 12, 'https://m.media-amazon.com/images/M/MV5BMzI4OTQ0MDQyNl5BMl5BanBnXkFtZTcwODY5MjQwNA@@.V1_FMjpg_UY2048.jpg', 'A woman who has an easy life becomes a succesful entrepreneur after falling in love with a succesful family.').
film('The Matrix', 'Lana Wachowski', 1999, 'action', 'sci-fi', 136, 'USA', 'Keanu Reeves', 8.7, 1600, 'https://m.media-amazon.com/images/M/MV5BMzYxZGIyM2MtZDQ0NC00Y2M5LTk0NTAtNDk5ZTg1MjZjMTFiXkEyXkFqcGdeQXVyMTY4MjE1MDA@.V1_FMjpg_UY5990.jpg', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.').
film('Gladiator', 'Ridley Scott', 2000, 'action', 'drama', 155, 'USA', 'Russell Crowe', 8.5, 1400, 'https://m.media-amazon.com/images/M/MV5BZjdiZTI5YTgtZDdiNi00YzhmLTllMWEtZDM1ZjJiMzUyYTc5XkEyXkFqcGdeQXVyMTAyOTE2ODg0.V1_FMjpg_UX849.jpg', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.').
film('Inception', 'Christopher Nolan', 2010, 'action', 'sci-fi', 148, 'USA', 'Leonardo DiCaprio', 8.8, 2000, 'https://m.media-amazon.com/images/M/MV5BMTUzMzUyOTktNmYyNS00YTA1LWIxNmQtMGIzZDYxZGI3OTliXkEyXkFqcGdeQXVyMTYzMDM0NTU@.V1_FMjpg_UY2812.jpg', 'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.').
film('The Dark Knight', 'Christopher Nolan', 2008, 'action', 'thriller', 152, 'USA', 'Christian Bale', 9.0, 2300, 'https://m.media-amazon.com/images/M/MV5BM2E1ZjEyYWQtMjgyMy00ZTkwLThkM2QtN2YwM2NmYzAyYjE0XkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX800.jpg', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.').
film('The Conjuring', 'James Wan', 2013, 'horror', 'thriller', 112, 'USA', 'Vera Farmiga', 7.5, 450, 'https://m.media-amazon.com/images/M/MV5BNDliYTEwZTItN2M5Mi00M2Q5LWExNzgtOGQ0ODM2ZDE2OTQ3XkEyXkFqcGdeQXVyMTAyOTE2ODg0.V1_FMjpg_UY3701.jpg', 'Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their house. ').
film('Get Out', 'Jordan Peele', 2017, 'horror', 'thriller', 104, 'USA', 'Daniel Kaluuya', 7.7, 700, 'https://m.media-amazon.com/images/M/MV5BYzJhNWUwNWQtMDE2Ni00YTNmLWIxOTQtODFkMTMwOWU3NzkyXkEyXkFqcGdeQXVyNzI0MjY5NDk@.V1_FMjpg_UX625.jpg', 'A young African-American visits his white girlfriend''s parents for the summer, and falls in love with them.').
film('Parasite', 'Bong Joon Ho', 2019, 'thriller', 'drama', 132, 'South Korea', 'Song Kang-ho', 8.6, 1500, 'https://m.media-amazon.com/images/M/MV5BNDhhZjkyNGItY2VmZi00NjJhLWI0MzMtZTBlMjhlNzE0NzNiXkEyXkFqcGdeQXVyMTA4NjE0NjEy.V1_FMjpg_UX400.jpg', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.').
film('Interstellar', 'Christopher Nolan', 2014, 'sci-fi', 'drama', 169, 'USA', 'Matthew McConaughey', 8.6, 1800, 'https://m.media-amazon.com/images/M/MV5BMzg0NzYyNDMtZTkxMS00NmYzLWJkMDAtMmNlYTY1MTRmM2IwXkEyXkFqcGdeQXVyMTYzMDM0NTU@.V1_FMjpg_UY3459.jpg', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.').
film('Avengers: Endgame', 'Anthony Russo', 2019, 'action', 'sci-fi', 181, 'USA', 'Robert Downey Jr.', 8.4, 1900, 'https://m.media-amazon.com/images/M/MV5BNTRkZDU0NDQtYzdkNS00MGMzLTk3MmEtYjgyMWNhYzRkZDc4XkEyXkFqcGdeQXVyMTI5ODk3NDU1.V1_FMjpg_UX681.jpg', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.').
film('Joker', 'Todd Phillips', 2019, 'drama', 'thriller', 122, 'USA', 'Joaquin Phoenix', 8.5, 1600, 'https://m.media-amazon.com/images/M/MV5BZTk2YmY1OTMtN2NhYi00OGE4LWEwZWEtZDI4YWEyZWJmMWNmXkEyXkFqcGdeQXVyMTAyOTE2ODg0.V1_FMjpg_UX648.jpg', 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution against the corrupting government.').
film('Pulp Fiction', 'Quentin Tarantino', 1994, 'crime', 'drama', 154, 'USA', 'John Travolta', 8.9, 2000, 'https://m.media-amazon.com/images/M/MV5BN2RiMTA1ZGQtOTNhYi00MjQyLTk0MzAtMWE1OTM2NWUxNzBkXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX808.jpg', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.').
film('The Shawshank Redemption', 'Frank Darabont', 1994, 'drama', 'crime', 142, 'USA', 'Tim Robbins', 9.3, 2300, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@.V1_FMjpg_UX1200.jpg', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.').
film('Forrest Gump', 'Robert Zemeckis', 1994, 'drama', 'romance', 142, 'USA', 'Tom Hanks', 8.8, 1800, 'https://m.media-amazon.com/images/M/MV5BNmQ2MmQ4MzMtYjRkOC00MjkwLTllYmEtOTI0MDBjNjQwZWU5XkEyXkFqcGdeQXVyMjMyMzI4MzY@.V1_FMjpg_UY3504.jpg', 'A man with a low IQ has accomplished great things in his life and been able to help his way out of trouble.').
film('The Godfather', 'Francis Ford Coppola', 1972, 'crime', 'drama', 175, 'USA', 'Marlon Brando', 9.2, 2200, 'https://m.media-amazon.com/images/M/MV5BZjgwNzE5ODgtYzAyZC00YTZhLThhNDktMDVlOGNhYzk5NTVkXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UY2142.jpg', 'An organized crime dynasty''s aging patriarch transfers control of his clandestine empire to his reluctant son.').
film('The Godfather: Part II', 'Francis Ford Coppola', 1974, 'crime', 'drama', 202, 'USA', 'Al Pacino', 9.0, 2000, 'https://m.media-amazon.com/images/M/MV5BOGM2M2Q0ZWQtZjc5NC00NDY4LWIxYTktMDE4ZjIyYTRlNTIyXkEyXkFqcGdeQXVyODc0OTEyNDU@.V1_FMjpg_UX844.jpg', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.').
film('Se7en', 'David Fincher', 1995, 'crime', 'thriller', 127, 'USA', 'Brad Pitt', 8.6, 1600, 'https://m.media-amazon.com/images/M/MV5BZDgyZmY5MmItY2I3Ny00NjA4LWFhNmItMGQ4ZGJhZDk5YjU3XkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX746.jpg', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.').
film('The Silence of the Lambs', 'Jonathan Demme', 1991, 'crime', 'thriller', 118, 'USA', 'Jodie Foster', 8.6, 1400, 'https://m.media-amazon.com/images/M/MV5BMzNkMGM2OWItYmNiYS00YmZhLTg0ZjctOGYxMTE2ODZmNGFiXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX811.jpg', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer in the prison. ').
film('Fight Club', 'David Fincher', 1999, 'drama', 'thriller', 139, 'USA', 'Edward Norton', 8.8, 1900, 'https://m.media-amazon.com/images/M/MV5BMzM0ZTA4MjctZDgzMi00M2RjLTg4ZmEtY2QwOWQ5MTFmNDgzXkEyXkFqcGdeQXVyMTY4MjE1MDA@.V1_FMjpg_UY6162.jpg', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.').
film('The Shining', 'Stanley Kubrick', 1980, 'horror', 'drama', 146, 'USA', 'Jack Nicholson', 8.4, 1000, 'https://m.media-amazon.com/images/M/MV5BM2M0NTNhNGMtMmVlMS00MDRjLWI5MzctYmVlNzdhMTQ0ZDE1XkEyXkFqcGdeQXVyMTAyOTE2ODg0.V1_FMjpg_UX960.jpg', 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic brother sees horrific forebodings from his past.').
film('The Usual Suspects', 'Bryan Singer', 1995, 'crime', 'thriller', 106, 'USA', 'Kevin Spacey', 8.5, 1300, 'https://m.media-amazon.com/images/M/MV5BOGE5NDRjNzctZDk2Zi00OGVjLWI4YzgtNzRkMjdjZjRhNmFjXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX758.jpg', 'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.').
film('Inglourious Basterds', 'Quentin Tarantino', 2009, 'adventure', 'drama', 153, 'USA', 'Brad Pitt', 8.3, 1200, 'https://m.media-amazon.com/images/M/MV5BM2M5YzVlMDctZWI2ZC00MjdlLWE1YzctMTQ5OGQ1NGJhZWMyXkEyXkFqcGdeQXVyMTAzMDM4MjM0.V1_FMjpg_UX754.jpg', 'In the early 1960s, young pesticideist Basterds, a determined hard nut, works to earn a small government justicars license to operate a farm in the U.S.').
film('La La Land', 'Damien Chazelle', 2016, 'comedy', 'drama', 128, 'USA', 'Ryan Gosling', 8.0, 800, 'https://m.media-amazon.com/images/M/MV5BMmMzMzk4OTUtMjBhYy00YWNiLThiNWEtNWQ0NjYyMDBiZTYyXkEyXkFqcGdeQXVyMTAyOTE2ODg0.V1_FMjpg_UX821.jpg', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.').
film('The Wolf of Wall Street', 'Martin Scorsese', 2013, 'biography', 'comedy', 180, 'USA', 'Leonardo DiCaprio', 8.2, 1100, 'https://m.media-amazon.com/images/M/MV5BYTIzN2ZlMWEtYmRmMi00YWRlLThkZWYtMjZjNTliMWU4NGJkXkEyXkFqcGdeQXVyMTYzMDM0NTU@.V1_FMjpg_UY5000.jpg', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.').

% Ator/Atriz data
actress('Nicole Kidman').
actress('Natalie Portman').

actor(X) :- not(actress(X)).

% Funções auxiliares
english(Y) :- film(Y, _, _, _, _, _, X, _, _, _, _, _), X == 'USA'.
foreign(Y) :- film(Y, _, _, _, _, _, X, _, _, _, _, _), X \== 'USA'.

% Handler para a rota /films
handle_films_request(Request) :-
    http_parameters(Request, [
        genre(Genre, [optional(true)]),
        subgenre(Subgenre, [optional(true)]),
        year(YearAtom, [optional(true)]),
        duration(Duration, [optional(true)]),
        country(Country, [optional(true)])
    ]),
    atom_number_safe(YearAtom, Year),
    findall(
        json{title: Title, director: Director, year: FilmYear, genre: FilmGenre, subgenre: Subgenre, duration: FilmDuration, country: FilmCountry, actor: Actor, rating: Rating, votes: Votes, image: Image, synopsis: Synopsis},
        search_films(Title, Director, FilmYear, FilmGenre, Subgenre, FilmDuration, FilmCountry, Actor, Rating, Votes, Image, Synopsis, Genre, Subgenre, Year, Duration, Country),
        Films
    ),
    cors_enable,
    reply_json(Films).

atom_number_safe(Atom, Number) :-
    ( var(Atom) -> Number = _ ; atom_number(Atom, Number) ).

% Pesquisa filmes baseado nos parâmetros fornecidos
search_films(Title, Director, FilmYear, FilmGenre, Subgenre, FilmDuration, FilmCountry, Actor, Rating, Votes, Image, Synopsis, GenreParam, SubgenreParam, YearParam, DurationParam, CountryParam) :-
    film(Title, Director, FilmYear, FilmGenre, Subgenre, FilmDuration, FilmCountry, Actor, Rating, Votes, Image, Synopsis),
    (var(GenreParam) ; GenreParam == FilmGenre),
    (var(SubgenreParam) ; SubgenreParam == Subgenre),
    (var(YearParam) ; YearParam == FilmYear),
    (var(DurationParam) ; (
        DurationParam == 'short', FilmDuration =< 90 ;
        DurationParam == 'long', FilmDuration > 90, FilmDuration =< 170 ;
        DurationParam == 'verylong', FilmDuration > 170
    )),
    (var(CountryParam) ; (
        CountryParam == 'english', english(Title) ;
        CountryParam == 'foreign', foreign(Title)
    )).

% Inicializa o servidor HTTP
:- initialization
    http_server(http_dispatch, [port(8080)]).