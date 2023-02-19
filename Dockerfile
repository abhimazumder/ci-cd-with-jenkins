FROM python:3.8.10

MAINTAINER Abhishek abhishek.am988@gmail.com

USER root

ENV HOME /home

WORKDIR $HOME

RUN apt update && \
    apt-get install -y python3-pip && \
    python3 -m pip install --user --upgrade pip && \
    pip install pytest && \
    git clone https://github.com/abhimazumder/devopsProjectTest.git && \
    cd devopsProjectTest && \
    python3.8 -m pytest -v test_mathlib.py

CMD ["python", "/bin/bash"]
