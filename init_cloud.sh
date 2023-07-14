#!/usr/bin/bash
# Reference: https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9

# Timezone Set
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
date

sudo yum install -y kernel-headers-$(uname -r) kernel-devel-$(uname -r)
sudo modprobe wireguard
sudo modprobe iptable_filter
sudo modprobe iptable_nat

sudo yum -y install git docker yum-cron; \
 sudo sed -i '/update_cmd/s/= .*/= security/' /etc/yum/yum-cron-hourly.conf; \
 sudo sed -i '/update_messages/s/= .*/= no/' /etc/yum/yum-cron-hourly.conf; \
 sudo sed -i '/apply_updates/s/= .*/= yes/' /etc/yum/yum-cron-hourly.conf; \
 sudo sed -i '/download_updates/s/= .*/= yes/' /etc/yum/yum-cron-hourly.conf; \
 sudo sed -i '/download_updates/s/= .*/= no/' /etc/yum/yum-cron.conf; \
 sudo service yum-cron start; \
 sudo chkconfig yum-cron on; \
 sudo service docker start; \
 sudo usermod -aG docker ec2-user; \
 sudo chkconfig docker on; \
 sudo sh -c "echo 'export DOCKER_COMPOSE_IMAGE_TAG=ghcr.io/linuxserver/docker-compose:alpine' >> /etc/profile.d/dockerComposeAlpineImageTagEnv.sh"; \
 sudo curl -L --fail https://raw.githubusercontent.com/linuxserver/docker-docker-compose/master/run.sh -o /usr/local/bin/docker-compose; \
 sudo chmod +x /usr/local/bin/docker-compose; \
 sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose; \
 sudo reboot;
