import os
import sqlalchemy as db
from sqlalchemy.orm import sessionmaker

password = os.environ.get("DB_PASSWORD", "")
engine = db.create_engine(
    f"mssql+pyodbc://movie_user:{password}@localhost/MovieDB?driver=ODBC+Driver+17+for+SQL+Server"
)


def get_session():
    Session = sessionmaker(bind=engine)
    return Session()
