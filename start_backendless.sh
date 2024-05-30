env \
  RAZZLE_PROXY_ES_DSN_datahub=http://10.120.10.131:60168/data_searchui_datahub \
  RAZZLE_PROXY_QA_DSN_datahub=http://10.120.10.204:60022/api \
  RAZZLE_PROXY_ES_DSN_globalsearch=http://10.120.10.131:60168/data_searchui \
  RAZZLE_PROXY_QA_DSN_globalsearch=http://10.120.10.204:60022/api \
  RAZZLE_DEV_PROXY_API_PATH=http://10.50.4.111:9765/Plone \
  yarn start
