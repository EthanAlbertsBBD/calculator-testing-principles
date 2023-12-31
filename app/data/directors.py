from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime
from app.schemas.responses import Person, Director
from app.data.access import get_session

Base = declarative_base()


class DirectorDao(Base):
    __tablename__ = "Directors"

    DirectorID = Column(Integer, primary_key=True)
    MovieID = Column(Integer)
    FirstName = Column(String)
    LastName = Column(Integer)
    BirthDate = Column(DateTime)
    BirthPlace = Column(String)
    CountryOfBirth = Column(String)

    def get_directors(self) -> List[Any]:
        session = get_session()
        directors = session.query(DirectorDao).all()
        session.close()
        return directors

    def insert_director(self, director: Person) -> Any:
        session = get_session()
        session.add(
            DirectorDao(
                MovieID=director.movie_id,
                FirstName=director.first_name,
                LastName=director.last_name,
                BirthDate=director.birth_date,
                BirthPlace=director.birth_place,
                CountryOfBirth=director.country_of_birth,
            )
        )
        session.commit()
        session.close()

    def update_director(self, director: Director) -> Any:
        session = get_session()
        director_to_update = session.query(DirectorDao).filter(DirectorDao.DirectorID == director.director_id).first()

        if director_to_update:
            director_to_update.MovieID = director.movie_id
            director_to_update.FirstName = director.first_name
            director_to_update.LastName = director.last_name
            director_to_update.BirthDate = director.birth_date
            director_to_update.BirthPlace = director.birth_place
            director_to_update.CountryOfBirth = director.country_of_birth
            session.commit()
        else:
            print("Director not found")
        session.close()

    def delete_director(self, director_id: int) -> Any:
        session = get_session()
        session.query(DirectorDao).filter(DirectorDao.DirectorID == director_id).delete()
        session.commit()
        session.close()

    def get_director(self, first_name: str, last_name: str) -> Any:
        session = get_session()
        director = (
            session.query(DirectorDao)
            .filter(DirectorDao.LastName == last_name)
            .filter(DirectorDao.FirstName == first_name)
            .first()
        )
        session.close()
        return director
