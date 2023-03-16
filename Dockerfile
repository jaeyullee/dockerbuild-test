FROM image-registry.openshift-image-registry.svc:5000/openshift/eap73-openjdk11-openshift-rhel8:7.3.10-2

COPY --chown=jboss:root ./standalone-openshift.xml /opt/eap/standalone/configuration/

EXPOSE 8080

COPY --chown=jboss:root ./ROOT.war /opt/eap/standalone/deployments/

ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone-openshift.xml

USER jboss

CMD /bin/bash
