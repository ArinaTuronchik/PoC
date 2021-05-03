FROM python:3.6

WORKDIR /render

COPY requirements.txt /render/requirements.txt

RUN  pip install --upgrade pip

RUN pip install -r requirements.txt

COPY templates/* /render/templates/

COPY render.py  /render/render.py

CMD ["python", "render.py"]