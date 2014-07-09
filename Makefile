ELASTICSEARCH_VERSION := 1.2.1
ELASTICSEARCH_TARBALL := elasticsearch-$(ELASTICSEARCH_VERSION).tar.gz
ELASTICSEARCH_URL := https://download.elasticsearch.org/elasticsearch/elasticsearch/$(ELASTICSEARCH_TARBALL)
ELASTICSEARCH_EXTRACT := elasticsearch-$(ELASTICSEARCH_VERSION)
INSTALL_ROOT := /usr/share/elasticsearch
CONFIG_ROOT := /etc/elasticsearch
LOG_ROOT := /var/log/service/elasticsearch
SV_DIR := /etc/sv/elasticsearch

all: | $(ELASTICSEARCH_EXTRACT)

$(ELASTICSEARCH_EXTRACT): $(ELASTICSEARCH_TARBALL)
	tar -zxf "$<"

$(ELASTICSEARCH_TARBALL):
	curl -SsLO "$(ELASTICSEARCH_URL)"
	shasum -a 1 -c "$(ELASTICSEARCH_TARBALL).sha1.txt"

install:
	rm -rf "$(INSTALL_ROOT)" "$(CONFIG_ROOT)"
	mv "$(ELASTICSEARCH_EXTRACT)" "$(INSTALL_ROOT)"
	mv "$(INSTALL_ROOT)/config" "$(CONFIG_ROOT)"
	cp -R elasticsearch-extra/* /
