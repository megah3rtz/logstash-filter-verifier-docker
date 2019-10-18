#!/bin/bash

echo "[+] Starting tests"
/usr/bin/logstash-filter-verifier /logstash/tests/ /logstash/filters/
