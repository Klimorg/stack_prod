# Dockerfile

FROM tiangolo/uvicorn-gunicorn:python3.8-slim

RUN apt-get update && apt-get install --no-install-recommends -y netcat && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

COPY ./app ./app


# FROM python:3.9-slim

# RUN apt-get update -y && rm -rf /var/lib/apt/lists/*

# WORKDIR /opt

# ENV ENV_FOR_DYNACONF production

# # https://docs.python.org/3/using/cmdline.html#envvar-PYTHONDONTWRITEBYTECODE
# # Prevents Python from writing .pyc files to disk
# ENV PYTHONDONTWRITEBYTECODE 1

# # ensures that the python output is sent straight to terminal (e.g. your container log)
# # without being first buffered and that you can see the output of your application (e.g. django logs)
# # in real time. Equivalent to python -u: https://docs.python.org/3/using/cmdline.html#cmdoption-u
# ENV PYTHONUNBUFFERED 1

# COPY ./requirements.txt /opt/app/requirements.txt

# RUN /usr/local/bin/python -m pip install --upgrade pip
# RUN pip install --no-cache-dir --upgrade -r /opt/app/requirements.txt

# COPY ./app /opt/app

# EXPOSE 8080

# # Start app
# ENTRYPOINT ["gunicorn", "-c", "app/gunicorn.py", "-k", "uvicorn.workers.UvicornWorker", "app.main:app"]
