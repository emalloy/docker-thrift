#!/usr/bin/env bash

CONFIGMAP_SITE_XML="/hbase/conf-inject/hbase-site.xml"


function start_hbase {
	        hbase thrift start -threadpool
	}

if [[ -e "${CONFIGMAP_SITE_XML}" ]]
  then
    ln -s ${CONFIGMAP_SITE_XML} /hbase/conf/hbase-site.xml && \
    start_hbase
  else start_hbase
fi
  

