from datetime import datetime
from unittest.mock import Mock, patch

from fastapi import HTTPException
import pytest

from app.data.movies import MovieDao
from app.domain.movies import MoviesDomain


movies_domain = MoviesDomain()


def test_search_movies_success():
    session_patcher = patch("app.data.access.get_session")
    session_fty = session_patcher.start()
    session_fty.return_value = Mock()

    movie_patcher = patch("app.data.movies.MovieDao.search_movies")
    movie_fty = movie_patcher.start()
    movie_fty.return_value = [
        MovieDao(
            movieid=1,
            moviename="test",
            releasedate=datetime.now(),
            runningtime=1,
            moviedescription="test",
            genre="test",
        )
    ]

    result = movies_domain.search_movies("test")

    assert len(result) == 1
    assert result[0].movie_id == 1
    assert result[0].movie_name == "test"
    assert result[0].running_time == 1
    assert result[0].movie_description == "test"
    assert result[0].genre == "test"


def test_search_movies_fail():
    session_patcher = patch("app.data.access.get_session")
    session_fty = session_patcher.start()
    session_fty.return_value = None

    movie_patcher = patch("app.data.movies.MovieDao.search_movies")
    movie_fty = movie_patcher.start()
    movie_fty.return_value = None

    with pytest.raises(HTTPException) as e:
        movies_domain.search_movies("test")
    assert str(e.value) == "404"
