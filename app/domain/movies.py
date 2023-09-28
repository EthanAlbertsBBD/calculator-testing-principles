from typing import List

from fastapi import HTTPException
from schemas.requests import MovieInsert, MovieUpdate
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

    def new_movie(self, movie: MovieInsert) -> None:
        self.data_access.insert_movie(movie)

    def update_movie(self, movie: MovieUpdate) -> None:
        self.data_access.update_movie(movie)

    def delete_movie(self, movie_id: int) -> None:
        self.data_access.delete_movie(movie_id)

    def search_movies(self, movie_name: str) -> List[Movie] | None:
        res = self.data_access.search_movies(movie_name)
        if res:
            movies = [
                Movie(
                    movie_id=row.movieid,
                    movie_name=row.moviename,
                    release_date=row.releasedate,
                    running_time=row.runningtime,
                    movie_description=row.moviedescription,
                    genre=row.genre,
                )
                for row in res
            ]
            return movies

        raise HTTPException(404)
