all:
	apt-get -q update
	apt-get -qy install openjdk-7-jre-headless runit
	dpkg -i ../elasticsearch.deb

install:
	/usr/share/elasticsearch/bin/plugin -install \
	  elasticsearch/elasticsearch-cloud-aws/1.16.0
	rm -rf /tmp/hsperfdata_*
	install -D -o root -g root -m 0644 cloud-aws-opts \
	  /etc/elasticsearch/opts.d/cloud-aws

.PHONY: all install
