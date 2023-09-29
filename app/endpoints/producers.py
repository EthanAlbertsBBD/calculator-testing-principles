from typing import List
from fastapi import APIRouter
from app.schemas.responses import Producer, PersonMovies, Person
from app.domain.producers import ProducersDomain


router = APIRouter(
    prefix="/producers",
    tags=["producers"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=List[Producer], operation_id="Getproducers")
def get_producers():
    producers_domain = ProducersDomain()
    return producers_domain.all_producers()


@router.get("/movies", response_model=List[PersonMovies], operation_id="GetProducersMovies")
def get_producers_movies():
    producers_domain = ProducersDomain()
    return producers_domain.all_producers_movies()


@router.post("", operation_id="PostProducer")
def post_producer(producer: Person):
    producers_domain = ProducersDomain()
    producers_domain.new_producer(producer)


@router.put("", operation_id="PutProducer")
def put_producer(producer: Producer):
    producers_domain = ProducersDomain()
    producers_domain.update_producer(producer)


@router.delete("", operation_id="DeleteProducer")
def delete_producer(producer_id: int):
    producers_domain = ProducersDomain()
    producers_domain.delete_producer(producer_id)


@router.get("/search", response_model=Producer | None, operation_id="GetProducer")
def get_producer(first_name: str, last_name: str):
    director_domain = ProducersDomain()
    return director_domain.get_producer(first_name, last_name)
