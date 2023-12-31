FROM python:3.9-slim

RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y autoremove && \
    apt-get -y install \
        git \
        curl \
        libgomp1 \
    && \
    apt-get -y clean

COPY requirements.txt /src/
RUN pip install -r /src/requirements.txt

COPY main.py /src/
WORKDIR src

EXPOSE 5292/tcp


ENTRYPOINT ["python"]
CMD ["/src/main.py"]
