from typing import List
from fastapi import APIRouter
from schemas.responses import Director, PersonMovies, Person
from domain.directors import DirectorsDomain


router = APIRouter(
    prefix="/directors",
    tags=["directors"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=List[Director], operation_id="GetDirectors")
def get_directors():
    directors_domain = DirectorsDomain()
    return directors_domain.all_directors()


@router.get("/movies", response_model=List[PersonMovies], operation_id="GetDirectorsMovies")
def get_directors_movies():
    directors_domain = DirectorsDomain()
    return directors_domain.all_directors_movies()


@router.post("", operation_id="PostDirector")
def post_director(director: Person):
    directors_domain = DirectorsDomain()
    directors_domain.new_director(director)


@router.put("", operation_id="PutDirector")
def put_director(director: Director):
    directors_domain = DirectorsDomain()
    directors_domain.update_director(director)


@router.delete("", operation_id="DeleteDirector")
def delete_director(director_id: int):
    directors_domain = DirectorsDomain()
    directors_domain.delete_director(director_id)


@router.get("/search", response_model=Director | None, operation_id="GetDirector")
def get_director(first_name: str, last_name: str):
    director_domain = DirectorsDomain()
    return director_domain.get_director(first_name, last_name)
