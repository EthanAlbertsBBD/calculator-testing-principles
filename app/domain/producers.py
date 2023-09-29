from typing import List
from app.data.producers import ProducerDao
from app.schemas.responses import PersonMovies, Person, Producer
from app.domain.movies import MoviesDomain
from app.domain.helper_methods import person_movies
from fastapi import HTTPException


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

    def all_producers_movies(self) -> List[PersonMovies]:
        producers = self.all_producers()
        movie_domain = MoviesDomain()
        movies = movie_domain.all_movies()

        return person_movies(producers, movies)  # type: ignore

    def new_producer(self, producer: Person) -> None:
        self.data_access.insert_producer(producer)

    def update_producer(self, producer: Producer) -> None:
        self.data_access.update_producer(producer)

    def delete_producer(self, producer_id: int) -> None:
        self.data_access.delete_producer(producer_id)

    def get_producer(self, first_name: str, last_name: str) -> Producer | None:
        producer = self.data_access.get_producer(first_name, last_name)
        if producer:
            return Producer(
                movie_id=producer.MovieID,
                first_name=producer.FirstName,
                last_name=producer.LastName,
                birth_date=producer.BirthDate,
                birth_place=producer.BirthPlace,
                country_of_birth=producer.CountryOfBirth,
                producer_id=producer.ProducerID,
            )
        raise HTTPException(404)
