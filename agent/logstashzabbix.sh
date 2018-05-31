#!/bin/bash

case $1 in
    status )
        systemctl status logstash | grep -q running && echo 1 || echo 0 ;;
    version )
        curl -s http://localhost:9600 | jq -r '.version' ;;
    heap_bytes )
        curl -s localhost:9600/_node/stats/jvm | jq -r '.jvm.mem.heap_used_in_bytes' ;;
    heap_percent )
        curl -s localhost:9600/_node/stats/jvm | jq -r '.jvm.mem.heap_used_percent' ;;
    heap_max )
        curl -s localhost:9600/_node/stats/jvm | jq -r '.jvm.mem.heap_max_in_bytes' ;;
    events_in )
        curl -s localhost:9600/_node/stats/pipelines | jq -r '.pipelines.main.events.in' ;;
    events_filtered )
        curl -s localhost:9600/_node/stats/pipelines | jq -r '.pipelines.main.events.filtered' ;;
    events_out )
        curl -s localhost:9600/_node/stats/pipelines | jq -r '.pipelines.main.events.out' ;;
    failures )
        curl -s localhost:9600/_node/stats/pipelines | jq -r '.pipelines.main.reloads.failures' ;;
esac
