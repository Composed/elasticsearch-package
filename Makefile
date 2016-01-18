ELASTICSEARCH_VERSION := 0.90.13
ELASTICSEARCH_TARBALL := elasticsearch-$(ELASTICSEARCH_VERSION).tar.gz
ELASTICSEARCH_URL := https://download.elastic.co/elasticsearch/elasticsearch/$(ELASTICSEARCH_TARBALL)
ELASTICSEARCH_EXTRACT := elasticsearch-$(ELASTICSEARCH_VERSION)
INSTALL_ROOT := /usr/share/elasticsearch
ELASTICSEARCH_SHA1_URL=https://download.elastic.co/elasticsearch/elasticsearch/$(ELASTICSEARCH_TARBALL).sha1.txt
ELASTICSEARCH_SHA1=$(ELASTICSEARCH_TARBALL).sha1.txt
CONFIG_ROOT := /etc/elasticsearch
LOG_ROOT := /var/log/service/elasticsearch
SV_DIR := /etc/sv/elasticsearch

all: | $(ELASTICSEARCH_EXTRACT)

$(ELASTICSEARCH_EXTRACT): $(ELASTICSEARCH_TARBALL)
	tar -zxf "$<"

$(ELASTICSEARCH_TARBALL):
	curl -SsLO "$(ELASTICSEARCH_URL)"
	curl -o $(ELASTICSEARCH_SHA1) -SsLO "$(ELASTICSEARCH_SHA1_URL)"
	shasum -a 1 -c "$(ELASTICSEARCH_TARBALL).sha1.txt"

install:
	rm -rf "$(INSTALL_ROOT)" "$(CONFIG_ROOT)"
	mv "$(ELASTICSEARCH_EXTRACT)" "$(INSTALL_ROOT)"
	mv "$(INSTALL_ROOT)/config" "$(CONFIG_ROOT)"
	cp -R elasticsearch-extra/* /

clean:
	rm -rf $(ELASTICSEARCH_TARBALL)* 
