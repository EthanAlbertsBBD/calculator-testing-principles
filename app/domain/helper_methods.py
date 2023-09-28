from typing import List
from schemas.responses import Person, PersonMovies, Movie


def person_movies(actors: List[Person], movies: List[Movie]) -> List[PersonMovies]:
    return [
        PersonMovies(
            movie_id=actor.movie_id,
            first_name=actor.first_name,
            last_name=actor.last_name,
            birth_date=actor.birth_date,
            birth_place=actor.birth_place,
            country_of_birth=actor.country_of_birth,
            movie_names=[movie.movie_name for movie in movies if movie.movie_id == actor.movie_id],
        )
        for actor in actors
    ]
