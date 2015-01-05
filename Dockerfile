FROM jpetazzo/dind
# Boot up a jenkins instance with the docker daemon running.
# We are going to run our builds inside their own build container.
# This is based heavily on https://github.com/aespinosa/docker-jenkins.
# My additions are concerning the docker magic, which itself comes from
# https://github.com/jpetazzo/dind/blob/master/wrapdocker
MAINTAINER Briely Marum <brielymarum@gmail.com>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless
ADD http://mirrors.jenkins-ci.org/war/1.595/jenkins.war /opt/jenkins.war
ADD run.sh /run.sh
RUN chmod +x /run.sh
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["/run.sh"]
EXPOSE 8080
CMD [""]