from app.domain.helper_methods import person_movies
from datetime import datetime
from app.schemas.responses import Person, Movie


def test_actor_movies():
    res = person_movies(
        actors=[
            Person(
                movie_id=1,
                first_name="test",
                last_name="surname",
                birth_date=datetime.now(),
                birth_place="test",
                country_of_birth="test",
            )
        ],
        movies=[
            Movie(
                movie_id=1,
                movie_name="test",
                release_date=datetime.now(),
                running_time=0,
                movie_description="test",
                genre="test",
            )
        ],
    )  # type: ignore

    assert len(res) == 1
