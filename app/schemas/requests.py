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
