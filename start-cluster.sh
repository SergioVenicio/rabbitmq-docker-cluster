#!/bin/bash

NODE_1=rabbitmq-1
NODE_2=rabbitmq-2
NODE_3=rabbitmq-3

docker exec -ti $NODE_2 bash -c "rabbitmqctl stop_app; rabbitmqctl join_cluster rabbit@rabbitmq-1; rabbitmqctl start_app"
docker exec -ti $NODE_3 bash -c "rabbitmqctl stop_app; rabbitmqctl join_cluster rabbit@rabbitmq-1; rabbitmqctl start_app"
docker exec -ti $NODE_1 bash -c "rabbitmqctl set_policy ha-all '' '{\"ha-mode\":\"all\", \"ha-sync-mode\":\"automatic\"}'"