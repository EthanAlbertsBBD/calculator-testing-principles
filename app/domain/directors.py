from typing import List
from data.directors import DirectorDao
from schemas.responses import Actor, Director


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
