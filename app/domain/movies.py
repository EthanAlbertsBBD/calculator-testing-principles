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
                movie_id=row.movieid,
                movie_name=row.moviename,
                release_date=row.releasedate,
                running_time=row.runningtime,
                movie_description=row.moviedescription,
                genre=row.genre,
            )
            for row in data
        ]

        return movies
