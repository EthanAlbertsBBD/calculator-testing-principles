from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime

from data.access import get_session

Base = declarative_base()


class DirectorDao(Base):
    __tablename__ = "Directors"

    DirectorID = Column(Integer, primary_key=True)
    MovieID = Column(Integer)
    FirstName = Column(String)
    LastName = Column(Integer)
    BirthDate = Column(DateTime)
    DirectorImage = Column(String)
    BirthPlace = Column(String)
    CountryOfBirth = Column(String)

    def get_directors(self) -> List[Any]:
        session = get_session()
        directors = session.query(DirectorDao).all()
        session.close()
        return directors
