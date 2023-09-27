from typing import List
from data.movies import MovieDao
from schemas.responses import Movie


class MoviesDomain:
    def __init__(self) -> None:
        self.data_access = MovieDao()

    def all_movies(self) -> List[Movie]:
        data = self.data_access.get_movies()

        movies = [
            Movie(
                movie_id=row.MovieID,
                movie_name=row.MovieName,
                release_date=row.ReleaseDate,
                running_time=row.RunningTime,
                movie_description=row.MovieDescription,
                genre=row.Genre,
            )
            for row in data
        ]

        return movies
