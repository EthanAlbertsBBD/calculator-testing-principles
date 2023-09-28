from typing import Any, List

from fastapi import HTTPException
from domain.movies import MoviesDomain
from data.actors import ActorDao
from schemas.responses import Actor, PersonMovies, Person
from domain.helper_methods import person_movies


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

    def all_actors_movies(self) -> List[PersonMovies]:
        actors = self.all_actors()
        movie_domain = MoviesDomain()
        movies = movie_domain.all_movies()

        return person_movies(actors, movies)  # type: ignore

    def new_actor(self, actor: Person) -> None:
        self.data_access.insert_actor(actor)

    def update_actor(self, actor: Actor) -> None:
        self.data_access.update_actor(actor)

    def delete_actor(self, actor_id: int) -> None:
        self.data_access.delete_actor(actor_id)

    def get_actor(self, first_name: str, last_name: str) -> Actor | None:
        actor = self.data_access.get_actor(first_name, last_name)
        if actor:
            return Actor(
                movie_id=actor.MovieID,
                first_name=actor.FirstName,
                last_name=actor.LastName,
                birth_date=actor.BirthDate,
                birth_place=actor.BirthPlace,
                country_of_birth=actor.CountryOfBirth,
                actor_id=actor.ActorID,
            )
        raise HTTPException(404)
