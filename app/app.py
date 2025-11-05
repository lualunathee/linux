from flask import Flask
import os
app = Flask(__name__)
@app.get("/")
def index():
    return "Hello from Flask in Docker! Version: " + os.getenv("APP_VERSION","local")
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
