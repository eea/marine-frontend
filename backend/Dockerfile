FROM eeacms/plone:5.2.4-78

RUN mv /plone/instance/versions.cfg /plone/instance/eea-versions.cfg

COPY src/docker/* /
COPY src/plone/* /plone/instance/

RUN /docker-setup.sh
