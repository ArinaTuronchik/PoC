FROM python:3.6

WORKDIR /render

RUN  pip install --upgrade pip

RUN pip install ansible

COPY templates/* /render/templates/

COPY render.py  /render/render.py

CMD ["ansible-playbook", "ansible_renderer.yaml"]