from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime
from schemas.responses import Person, Producer
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

    def insert_producer(self, producer: Person) -> Any:
        session = get_session()
        session.add(
            ProducerDao(
                MovieID=producer.movie_id,
                FirstName=producer.first_name,
                LastName=producer.last_name,
                BirthDate=producer.birth_date,
                BirthPlace=producer.birth_place,
                CountryOfBirth=producer.country_of_birth,
            )
        )
        session.commit()
        session.close()

    def update_producer(self, producer: Producer) -> Any:
        session = get_session()
        producer_to_update = session.query(ProducerDao).filter(ProducerDao.producerID == ProducerDao.producerID).first()

        if producer_to_update:
            producer_to_update.MovieID = producer.movie_id
            producer_to_update.FirstName = producer.first_name
            producer_to_update.LastName = producer.last_name
            producer_to_update.BirthDate = producer.birth_date
            producer_to_update.BirthPlace = producer.birth_place
            producer_to_update.CountryOfBirth = producer.country_of_birth
            session.commit()
        else:
            print("producer not found")
        session.close()

    def delete_producer(self, producer_id: int) -> Any:
        session = get_session()
        session.query(ProducerDao).filter(ProducerDao.producer_id == producer_id).delete()
        session.commit()
        session.close()
