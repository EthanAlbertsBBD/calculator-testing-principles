import os
from dotenv import load_dotenv
import sqlalchemy as db
from sqlalchemy.orm import sessionmaker

load_dotenv()
password = os.environ.get("DB_PASSWORD", "")

engine = db.create_engine(
    f"mssql+pyodbc://sa:{password}@.\\LOCAL/MovieDB?driver=ODBC Driver 17 for SQL Server"
)


def get_session():
    Session = sessionmaker(bind=engine)
    return Session()


def test():
    inspector = db.inspect(engine)
    schemas = inspector.get_schema_names()

    for schema in schemas:
        print("schema: %s" % schema)
        for table_name in inspector.get_table_names(schema=schema):
            for column in inspector.get_columns(table_name, schema=schema):
                print("Column: %s" % column)
