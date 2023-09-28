from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime

from data.access import get_session

Base = declarative_base()


class ProducerDao(Base):
    __tablename__ = "Producers"

    ProducerID = Column(Integer, primary_key=True)
    MovieID = Column(Integer)
    FirstName = Column(String)
    LastName = Column(Integer)
    BirthDate = Column(DateTime)
    ProducerImage = Column(String)
    BirthPlace = Column(String)
    CountryOfBirth = Column(String)

    def get_producers(self) -> List[Any]:
        session = get_session()
        producers = session.query(ProducerDao).all()
        session.close()
        return producers
