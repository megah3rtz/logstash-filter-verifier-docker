#!/bin/bash

echo "[+] Starting tests"
for file in $(ls /logstash/tests)
  do
    /usr/bin/logstash-filter-verifier /logstash/tests/$file /logstash/filters/
done
