from datetime import datetime
from pydantic import BaseModel, Field


class MovieInsert(BaseModel):
    movie_name: str = Field(..., serialization_alias="movieName")
    release_date: datetime = Field(..., serialization_alias="releaseDate")
    running_time: int = Field(..., serialization_alias="runningTime")
    movie_description: str = Field(..., serialization_alias="movieDescription")
    genre: str = Field(..., serialization_alias="genre")


class MovieUpdate(MovieInsert):
    movie_id: int = Field(..., serialization_alias="movieId")


class PersonInsert(BaseModel):
    movie_id: int = Field(..., serialization_alias="movieID")
    first_name: str = Field(..., serialization_alias="firstName")
    last_name: str = Field(..., serialization_alias="lastName")
    birth_date: datetime = Field(..., serialization_alias="birthPlace")
    birth_place: str = Field(..., serialization_alias="birthPlace")
    country_of_birth: str = Field(..., serialization_alias="countryOfBirth")
