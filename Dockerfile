FROM debian

ENV VERIFIER_VERSION 1.6.2

RUN apt-get update -y && apt-get install wget gnupg2 openjdk-11-jre apt-transport-https -y --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update -y && apt install logstash -y --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/
RUN wget -qO - https://github.com/magnusbaeck/logstash-filter-verifier/releases/download/${VERIFIER_VERSION}/logstash-filter-verifier_${VERIFIER_VERSION}_linux_amd64.tar.gz | tar xvzf - -C /usr/bin 
RUN apt-get clean && rm -rf /var/lib/apt/
COPY runtests.sh /
CMD ["/runtests.sh"]
