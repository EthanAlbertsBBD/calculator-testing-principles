from typing import List
from fastapi import APIRouter
from schemas.responses import Director, PersonMovies
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
