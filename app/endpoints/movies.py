from typing import Any, List
from fastapi import APIRouter
from schemas.requests import MovieInsert, MovieUpdate

# from data.access import test
from schemas.responses import Movie
from domain.movies import MoviesDomain


router = APIRouter(
    prefix="/movies",
    tags=["movies"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=List[Movie] | Any, operation_id="GetMovies")
def get_movies():
    movies_domain = MoviesDomain()
    return movies_domain.all_movies()


@router.post("", operation_id="PostMovie")
def post_movie(movie: MovieInsert):
    movies_domain = MoviesDomain()
    movies_domain.new_movie(movie)


@router.put("", operation_id="PutMovie")
def put_movie(movie: MovieUpdate):
    movies_domain = MoviesDomain()
    movies_domain.update_movie(movie)


@router.delete("", operation_id="DeleteMovie")
def delete_movie(movie_id: int):
    movies_domain = MoviesDomain()
    movies_domain.delete_movie(movie_id)
