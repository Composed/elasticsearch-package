ELASTICSEARCH_PLUGIN=2.1.1

all:
	apt-get -qq update
	apt-get -qy install openjdk-7-jre-headless runit
	cd ../ && $(MAKE)
	cd ../ && $(MAKE) install

install:
	/usr/share/elasticsearch/bin/plugin -install \
	  elasticsearch/elasticsearch-cloud-aws/$(ELASTICSEARCH_PLUGIN)
	rm -rf /tmp/hsperfdata_*
	install -D -o root -g root -m 0644 cloud-aws-opts \
	  /etc/elasticsearch/opts.d/cloud-aws

.PHONY: all install
