FROM debian
RUN apt-get update -y && apt-get install wget -y && apt-get clean
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update -y && apt install logstash apt-transport-https gnupg2 -y
RUN wget https://github.com/magnusbaeck/logstash-filter-verifier/releases/download/1.5.1/logstash-filter-verifier_1.5.1_amd64.deb
RUN dpkg -i logstash-filter-verifier_1.5.1_amd64.deb
RUN apt-get clean
COPY runtests.sh /
CMD ["/runtests.sh"]
