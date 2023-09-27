from fastapi import FastAPI
import uvicorn

from endpoints import movies


def create_app() -> FastAPI:
    app = FastAPI(title="SecHQ Service Catalogue")
    app.include_router(movies.router)
    return app


def main():
    app = create_app()
    uvicorn.run(app, host="localhost", port=8080)


if __name__ == "__main__":
    main()
