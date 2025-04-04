FROM python:3.13.2-slim

ENV PYTHONUNBUFFERED True

# set the working directory
WORKDIR /usr/src/app

# install dependencies
COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

# copy src code
COPY ./wiki_map ./wiki_map

EXPOSE 4000

# start the server
CMD ["uvicorn", "wiki_map.main:app", "--host", "0.0.0.0", "--port", "4000", "--proxy-headers"]
