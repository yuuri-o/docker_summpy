FROM ubuntu
MAINTAINER yuurio <yuuri.o@gmail.com>

RUN apt-get update && apt-get install -y \
	git \
	curl \
	python

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python

RUN apt-get update && apt-get install -y \
	python-numpy \
	python-scipy \
	mecab \
	python-mecab \
	mecab-ipadic-utf8 

RUN pip install \
	networkx \
	scikit-learn \
	cherrypy \
	pulp

RUN git clone https://github.com/recruit-tech/summpy.git
WORKDIR /summpy
EXPOSE 8080
ENTRYPOINT python -m summpy.server -h 0.0.0.0 -p 8080

