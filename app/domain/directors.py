from typing import List
from app.domain.helper_methods import person_movies
from app.domain.movies import MoviesDomain
from app.data.directors import DirectorDao
from app.schemas.responses import PersonMovies, Director, Person
from fastapi import HTTPException


class DirectorsDomain:
    def __init__(self) -> None:
        self.data_access = DirectorDao()

    def all_directors(self) -> List[Director]:
        data = self.data_access.get_directors()

        directors = [
            Director(
                movie_id=row.MovieID,
                first_name=row.FirstName,
                last_name=row.LastName,
                birth_date=row.BirthDate,
                birth_place=row.BirthPlace,
                country_of_birth=row.CountryOfBirth,
                director_id=row.DirectorID,
            )
            for row in data
        ]

        return directors

    def all_directors_movies(self) -> List[PersonMovies]:
        directors = self.all_directors()
        movie_domain = MoviesDomain()
        movies = movie_domain.all_movies()

        return person_movies(directors, movies)  # type: ignore

    def new_director(self, director: Person) -> None:
        self.data_access.insert_movie(director)

    def update_director(self, director: Director) -> None:
        self.data_access.update_movie(director)

    def delete_director(self, director_id: int) -> None:
        self.data_access.delete_movie(director_id)

    def get_director(self, first_name: str, last_name: str) -> Director | None:
        director = self.data_access.get_director(first_name, last_name)
        if director:
            return Director(
                movie_id=director.MovieID,
                first_name=director.FirstName,
                last_name=director.LastName,
                birth_date=director.BirthDate,
                birth_place=director.BirthPlace,
                country_of_birth=director.CountryOfBirth,
                director_id=director.DirectorID,
            )
        raise HTTPException(404)
