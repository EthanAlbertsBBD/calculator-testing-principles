from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime
from schemas.responses import Person, Actor
from data.access import get_session

Base = declarative_base()


class ActorDao(Base):
    __tablename__ = "Actors"

    ActorID = Column(Integer, primary_key=True)
    MovieID = Column(Integer)
    FirstName = Column(String)
    LastName = Column(Integer)
    BirthDate = Column(DateTime)
    BirthPlace = Column(String)
    CountryOfBirth = Column(String)

    def get_actors(self) -> List[Any]:
        session = get_session()
        actors = session.query(ActorDao).all()
        session.close()
        return actors

    def insert_actor(self, actor: Person) -> Any:
        session = get_session()
        session.add(
            ActorDao(
                MovieID=actor.movie_id,
                FirstName=actor.first_name,
                LastName=actor.last_name,
                BirthDate=actor.birth_date,
                BirthPlace=actor.birth_place,
                CountryOfBirth=actor.country_of_birth,
            )
        )
        session.commit()
        session.close()

    def update_actor(self, actor: Actor) -> Any:
        session = get_session()
        actor_to_update = session.query(ActorDao).filter(ActorDao.ActorID == actor.actor_id).first()

        if actor_to_update:
            actor_to_update.MovieID = actor.movie_id
            actor_to_update.FirstName = actor.first_name
            actor_to_update.LastName = actor.last_name
            actor_to_update.BirthDate = actor.birth_date
            actor_to_update.BirthPlace = actor.birth_place
            actor_to_update.CountryOfBirth = actor.country_of_birth
            session.commit()
        else:
            print("actor not found")
        session.close()

    def delete_actor(self, actor_id: int) -> Any:
        session = get_session()
        session.query(ActorDao).filter(ActorDao.ActorID == actor_id).delete()
        session.commit()
        session.close()

    def get_actor(self, first_name: str, last_name: str) -> Any:
        session = get_session()
        actor = (
            session.query(ActorDao)
            .filter(ActorDao.LastName == last_name)
            .filter(ActorDao.FirstName == first_name)
            .first()
        )
        session.close()
        return actor
