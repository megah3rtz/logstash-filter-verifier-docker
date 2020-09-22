#!/bin/bash

echo "[+] Starting tests"
/usr/bin/logstash-filter-verifier --sockets /logstash/tests/ /logstash/
