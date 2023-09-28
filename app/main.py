from fastapi import FastAPI
import uvicorn

from endpoints import movies, actors, directors, producers


def create_app() -> FastAPI:
    app = FastAPI(title="SecHQ Service Catalogue")

    app.include_router(movies.router)
    app.include_router(actors.router)
    app.include_router(directors.router)
    app.include_router(producers.router)

    return app


def main():
    app = create_app()
    uvicorn.run(app, host="localhost", port=8080)


if __name__ == "__main__":
    main()
