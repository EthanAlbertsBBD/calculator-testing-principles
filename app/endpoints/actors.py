from typing import List
from fastapi import APIRouter
from schemas.responses import Actor, PersonMovies, Person
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


@router.get("/movies", response_model=List[PersonMovies], operation_id="GetActorsMovies")
def get_actors_movies():
    actors_domain = ActorsDomain()
    return actors_domain.all_actors_movies()


@router.post("", operation_id="PostActor")
def post_actor(actor: Person):
    actors_domain = ActorsDomain()
    actors_domain.new_actor(actor)


@router.put("", operation_id="PutActor")
def put_actor(actor: Actor):
    actors_domain = ActorsDomain()
    actors_domain.update_actor(actor)


@router.delete("", operation_id="DeleteActor")
def delete_actor(actor_id: int):
    actors_domain = ActorsDomain()
    actors_domain.delete_actor(actor_id)


@router.get("/search", response_model=Actor | None, operation_id="GetActor")
def get_actor(first_name: str, last_name: str):
    actors_domain = ActorsDomain()
    return actors_domain.get_actor(first_name, last_name)
