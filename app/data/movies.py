from typing import Any, List
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime
from schemas.requests import MovieInsert, MovieUpdate

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

    def insert_movie(self, movie: MovieInsert) -> Any:
        session = get_session()
        session.add(
            MovieDao(
                moviename=movie.movie_name,
                releasedate=movie.release_date,
                runningtime=movie.running_time,
                moviedescription=movie.movie_description,
                genre=movie.genre,
            )
        )
        session.commit()
        session.close()

    def update_movie(self, movie: MovieUpdate) -> Any:
        session = get_session()
        movie_to_update = session.query(MovieDao).filter(MovieDao.movieid == movie.movie_id).first()

        if movie_to_update:
            movie_to_update.moviename = movie.movie_name
            movie_to_update.releasedate = movie.release_date
            movie_to_update.runningtime = movie.running_time
            movie_to_update.moviedescription = movie.movie_description
            movie_to_update.genre = movie.genre
            session.commit()
        else:
            print("Movie not found")
        session.close()

    def delete_movie(self, movie_id: int) -> Any:
        session = get_session()
        session.query(MovieDao).filter(MovieDao.movieid == movie_id).delete()
        session.commit()
        session.close()
