from typing import List
from data.producers import ProducerDao
from schemas.responses import Producer


class ProducersDomain:
    def __init__(self) -> None:
        self.data_access = ProducerDao()

    def all_producers(self) -> List[Producer]:
        data = self.data_access.get_producers()

        producer = [
            Producer(
                movie_id=row.MovieID,
                first_name=row.FirstName,
                last_name=row.LastName,
                birth_date=row.BirthDate,
                birth_place=row.BirthPlace,
                country_of_birth=row.CountryOfBirth,
                producer_id=row.ProducerID,
            )
            for row in data
        ]

        return producer
