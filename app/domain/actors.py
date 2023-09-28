from typing import List
from data.actors import ActorDao
from schemas.responses import Actor


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
