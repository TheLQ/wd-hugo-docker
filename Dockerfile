FROM debian:bookworm

RUN set -e -x && \
	sed 's#deb.debian.org#192.168.66.11:3142/deb.debian.org#' /etc/apt/sources.list.d/debian.sources && \
	apt update && \
	apt-get install -y libncurses5 procps && \
	apt-get clean

ADD HUGO-7.4.5.x86_64.tar.gz /hugo
WORKDIR /hugo
RUN set -e -x && \
	cd /hugo && \
	mv    hugo-7.4.5.x86_64/* . && \
	rm -r hugo-7.4.5.x86_64 && \
	echo 1 > .hugo_lic

