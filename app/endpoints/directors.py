from typing import List
from fastapi import APIRouter
from schemas.responses import Director
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
