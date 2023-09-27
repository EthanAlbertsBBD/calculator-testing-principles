from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime

from data.access import get_session

Base = declarative_base()


class MovieDao(Base):
    __tablename__ = "Movies"

    MovieID = Column(Integer, primary_key=True)
    MovieName = Column(String)
    ReleaseDate = Column(DateTime)
    RunningTime = Column(Integer)
    MovieDescription = Column(String)
    Genre = Column(String)
    MoviePoster = Column(String)

    def get_movies(self) -> List[Any]:
        session = get_session()
        movies = session.query(MovieDao).all()
        session.close()
        return movies
