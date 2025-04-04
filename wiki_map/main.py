from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from wiki_map.smoke_test.main import router

app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(router, prefix="/smoke-test")


@app.get("/")
def health():
    return {"message": "OK we"}
