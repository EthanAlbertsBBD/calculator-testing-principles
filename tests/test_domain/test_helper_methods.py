from app.domain.helper_methods import person_movies
from datetime import datetime
from app.schemas.responses import Person, Movie


def test_actor_movies():
    res = person_movies(
        actors=[
            Person(
                movie_id=1,
                first_name="Karl",
                last_name="Haupt",
                birth_date=datetime.now(),
                birth_place="Cape Town",
                country_of_birth="South Africa",
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
    )

    assert len(res) == 1
    assert res[0].first_name == "Karl"
    assert res[0].last_name == "Haupt"
    assert res[0].birth_place == 'Cape Town'
    assert res[0].country_of_birth == 'South Africa'
    assert res[0].movie_id == 1
    assert res[0].movie_names == ["test"]
