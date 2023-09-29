from typing import Any, List
from fastapi import APIRouter
from app.schemas.requests import MovieInsert, MovieUpdate

# from data.access import test
from app.schemas.responses import Movie, MovieTest
from app.domain.movies import MoviesDomain


router = APIRouter(
    prefix="/movies",
    tags=["movies"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=MovieTest | Any, operation_id="GetMovies")
def get_movies():
    movies_domain = MoviesDomain()
    return MovieTest(movies=movies_domain.all_movies())


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


@router.get("/search", response_model=List[Movie] | None, operation_id="GetMovie")
def get_movie(movie_name: str):
    movie_domain = MoviesDomain()
    return movie_domain.search_movies(movie_name)
