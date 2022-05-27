import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from pydantic import BaseModel


class LogModel(BaseModel):
    log: str


class LogResponseModel(BaseModel):
    log: str


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins="*",
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/", response_model=LogResponseModel)
async def root(log: LogModel):
    return {"log": log.log}


if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=80,
        log_level="warning",
        reload=True,
        debug=False,
    )
