FROM runpod/pytorch:3.10-2.0.0-117

RUN apt update && apt upgrade -y && apt install ffmpeg -y
RUN pip install --upgrade pip

WORKDIR /workspace
RUN git clone https://github.com/vladmandic/automatic

WORKDIR /workspace/automatic
RUN pip install -r requirements.txt

RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

RUN python installer.py

WORKDIR /workspace


WORKDIR /workspace/automatic
COPY ./styles.csv /workspace/automatic/styles.csv
COPY ./start.sh /workspace/automatic/start.sh
RUN chmod +x ./start.sh
COPY ./install-models.sh /workspace/automatic/install-models.sh
RUN chmod +x ./install-models.sh
RUN git pull
RUN python installer.py

WORKDIR /workspace

