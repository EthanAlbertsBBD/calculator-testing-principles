from typing import List
from fastapi import APIRouter
from schemas.responses import Producer
from domain.producers import ProducersDomain


router = APIRouter(
    prefix="/producers",
    tags=["producers"],
    responses={404: {"description": "Not found"}},
)


@router.get("", response_model=List[Producer], operation_id="Getproducers")
def get_producers():
    producers_domain = ProducersDomain()
    return producers_domain.all_producers()
