FROM python:3.11
WORKDIR /app
COPY . /app
RUN apt-get -qq update && apt-get -qq install -y git wget ffmpeg mediainfo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt
RUN RUN apt-get update && apt-get install --yes pipenv
RUN pipenv run python app.py
EXPOSE 8080
CMD ["python3","-m","repthon"]
