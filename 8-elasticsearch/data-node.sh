#!/usr/bin/env bash
sudo yum update -y
sudo yum install java-1.8.0-openjdk.x86_64 -y
java -version
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch
sudo tee /etc/yum.repos.d/eslasticsearch.repo <<-'EOF'
[elasticsearch-6.x]
name=Elasticsearch repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
sudo  yum install elasticsearch -y
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch
sudo tee /etc/elasticsearch/elasticsearch.yml <<- 'EOF'
cluster.name: my-search-cluster
node.name: ${HOSTNAME}
node.master: false
node.data: true
path.data: /var/lib/elasticsearch
path.logs: /var/log/elasticsearch
network.host: _site_,_local_
discovery.zen.ping.unicast.hosts: ["1.2.3.4"]
http.max_content_length: 500mb
http.max_initial_line_length: 100kb
thread_pool.bulk.queue_size: -1
http.port: 9200
EOF
sudo systemctl start elasticsearch
sudo yum -y install firewalld
sudo systemctl start firewalld
sudo firewall-cmd --zone=public --add-port=9200/tcp --permanent
sudo firewall-cmd --zone=public --add-port=9300/tcp --permanent
sudo firewall-cmd --reload
#curl -X GET http://localhost:9200
