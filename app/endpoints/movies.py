from typing import List
from fastapi import APIRouter
from schemas.responses import Movie
from domain.movies import MoviesDomain


router = APIRouter(
    prefix="/movies",
    tags=["movies"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=List[Movie], operation_id="GetMovies")
def get_movies():
    movies_domain = MoviesDomain()
    return movies_domain.all_movies()
