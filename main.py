from fastapi import FastAPI
#Heello
##
##

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World from FastAPI, deployed by CI/CD"}

@app.get("/status")
def get_status():
    return {"status": "up and running"}
