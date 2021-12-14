#!/bin/bash

cd ~||exit;

wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz

tar zxvf node_exporter-1.3.1.linux-amd64.tar.gz

mv ~/node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/node_exporter||exit;

cat > /etc/systemd/system/node_exporter.service << EOF
[Unit]
Description=node_exporter
Documentation=https://prometheus.io/
After=network.target
[Service]
Type=simple
ExecStart=/usr/local/bin/node_exporter
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

systemctl start node_exporter

systemctl status node_exporter

systemctl enable node_exporter
