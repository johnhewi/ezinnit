#! /bin/sh
# shellcheck disable=SC1079
source ezinnit/ezinnit.config
ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa

ssh_key=`cat /root/.ssh/id_rsa`
echo ssh key: $ssh_key

echo adding ssh key to gitlab
curl --request POST --header "PRIVATE-TOKEN: $token" \
    "https://$gitlab_domain/api/v4/projects/$username%2F$appname/variables" \
    --form "key=SSH_PRIVATE_KEY" --form "value=$ssh_key"

echo installing dokku
wget https://raw.githubusercontent.com/dokku/dokku/v0.28.4/bootstrap.sh
sudo DOKKU_TAG=v0.28.4 bash bootstrap.sh
echo adding keys to dokku admin
cat ~/.ssh/authorized_keys | dokku ssh-keys:add admin
echo creating app
dokku apps:create $appname
echo clearing global domains
dokku domains:clear-global


echo setting domains to dokku app...

for i in ${domain//,/ }
do
        dokku domains:add "$appname" "$i"
done

echo setting proxy port to 80
dokku proxy:ports-set $appname http:80:5000

echo installing gitlab runner from gitlab-runner-downloads.s3.amazonaws.com
# Download the binary for your system
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

echo giving gitlab runner permission to execute
# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

echo creating a gitlab runner user
# Create a GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

echo install gitlab runner and run as a service
# Install and run as a service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start

echo registering gitlab runner
sudo gitlab-runner register \
  --non-interactive \
  --url "https://$gitlab_domain/" \
  --registration-token "$runner_token" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --maintenance-note "created by ezinnit" \
  --tag-list "$appname, $ip, $domain, ezinnit" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"

echo installing letsencrypt from letsencrypt.org
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
echo setting letsencrypt email
dokku config:set --no-restart $appname DOKKU_LETSENCRYPT_EMAIL=$email
echo enabling letsencrypt for app
dokku letsencrypt:enable $appname
echo enabling letsencrypt cron job for renewing certificate
dokku letsencrypt:cron-job --add
echo saved as server-script.sh in project directory where ezinnit was run
echo
