# logstash-filter-verifier-docker
logstash-filter-verifier in a docker container

using code from https://github.com/magnusbaeck/logstash-filter-verifier

Building the container:

``` docker build . -t logstash-filter-verifier:latest ```

Running the container

``` docker run -d -v <FULL_PATH>/filters:/logstash/filters -v <FULL_PATH>/tests:/logstash/tests logstash-filter-verifier:latest ```

Results of tests will be in docker logs


