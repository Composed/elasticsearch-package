ELASTICSEARCH_VERSION := 0.90.13
ELASTICSEARCH_AWS_VERSION := 1.16.0
CONFIG_ROOT := /etc/elasticsearch

all:
	echo "nothing to do"

install:
	install -o root -g root config/elasticsearch.yml $(CONFIG_ROOT)/elasticsearch.yml
	/usr/share/elasticsearch/bin/plugin install elasticsearch/elasticsearch-cloud-aws/$(ELASTICSEARCH_AWS_VERSION)
