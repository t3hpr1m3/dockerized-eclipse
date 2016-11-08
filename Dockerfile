FROM debian:jessie
MAINTAINER Josh Williams <theprime@codingprime.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		default-jdk \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL \
		"http://mirror.cc.columbia.edu/pub/software/eclipse/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz" \
		-o /tmp/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz \
	&& tar -C /opt -xzf /tmp/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz \
	&& rm /tmp/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz \
	&& apt-get purge -y --auto-remove

VOLUME /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["/opt/eclipse/eclipse"]
