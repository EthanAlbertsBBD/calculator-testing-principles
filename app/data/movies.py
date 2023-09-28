from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime

from data.access import get_session

Base = declarative_base()


class MovieDao(Base):
    __tablename__ = "movies"

    movieid = Column(Integer, primary_key=True)
    moviename = Column(String)
    releasedate = Column(DateTime)
    runningtime = Column(Integer)
    moviedescription = Column(String)
    genre = Column(String)

    def get_movies(self) -> List[Any]:
        session = get_session()
        movies = session.query(MovieDao).all()
        session.close()
        return movies
