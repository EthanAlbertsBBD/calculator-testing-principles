from typing import Any, List
from domain.movies import MoviesDomain
from data.actors import ActorDao
from schemas.responses import Actor, ActorsMovies


class ActorsDomain:
    def __init__(self) -> None:
        self.data_access = ActorDao()

    def all_actors(self) -> List[Actor]:
        data = self.data_access.get_actors()

        actors = [
            Actor(
                movie_id=row.MovieID,
                first_name=row.FirstName,
                last_name=row.LastName,
                birth_date=row.BirthDate,
                birth_place=row.BirthPlace,
                country_of_birth=row.CountryOfBirth,
                actor_id=row.ActorID,
            )
            for row in data
        ]

        return actors

    def all_actors_movies(self) -> List[ActorsMovies]:
        actors = self.all_actors()
        movie_domain = MoviesDomain()
        movies = movie_domain.all_movies()

        return [
            ActorsMovies(
                movie_id=actor.movie_id,
                first_name=actor.first_name,
                last_name=actor.last_name,
                birth_date=actor.birth_date,
                birth_place=actor.birth_place,
                country_of_birth=actor.country_of_birth,
                actor_id=actor.actor_id,
                movie_names=[movie.movie_name for movie in movies if movie.movie_id == actor.movie_id],
            )
            for actor in actors
        ]
