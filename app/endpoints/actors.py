from typing import List
from fastapi import APIRouter
from schemas.responses import Actor, ActorsMovies
from domain.actors import ActorsDomain


router = APIRouter(
    prefix="/actors",
    tags=["actors"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=List[Actor], operation_id="GetActors")
def get_actors():
    actors_domain = ActorsDomain()
    return actors_domain.all_actors()


@router.get("/movies", response_model=List[ActorsMovies], operation_id="GetActorsMovies")
def get_actors_movies():
    actors_domain = ActorsDomain()
    return actors_domain.all_actors_movies()
