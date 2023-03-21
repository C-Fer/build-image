FROM python:3.10-slim

WORKDIR /usr/app

RUN python3 -m virtualenv .env

ENV PATH="/usr/app/.env/bin:$PATH"

RUN pip install gunicorn

COPY init /usr/app/.env/bin/.

COPY requirements.txt .

RUN pip install -r requirements.txt

ENV PATH="/usr/app/.env/bin:$PATH"

CMD /usr/app/.env/bin/init


