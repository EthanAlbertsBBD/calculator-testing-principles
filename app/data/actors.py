from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime

from data.access import get_session

Base = declarative_base()


class ActorDao(Base):
    __tablename__ = "Actors"

    ActorID = Column(Integer, primary_key=True)
    MovieID = Column(Integer)
    FirstName = Column(String)
    LastName = Column(Integer)
    BirthDate = Column(DateTime)
    ActorImage = Column(String)
    BirthPlace = Column(String)
    CountryOfBirth = Column(String)

    def get_actors(self) -> List[Any]:
        session = get_session()
        actors = session.query(ActorDao).all()
        session.close()
        return actors
