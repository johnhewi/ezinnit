## install dokku

#### the following installation instructions are from dokku's website: [Dokku installation instructions](https://dokku.com/docs/getting-started/installation/)
<br></br>


#### while logged into the remote server:
```bash
wget https://raw.githubusercontent.com/dokku/dokku/v0.28.4/bootstrap.sh
sudo DOKKU_TAG=v0.28.4 bash bootstrap.sh
```
dokku will now install, it will take a couple minutes
<br></br>
<br></br>


now just cut and paste this code from [dokku](https://dokku.com/docs/getting-started/installation/) into the terminal and run it: 
```bash
# usually your key is already available under the current user's `~/.ssh/authorized_keys` file
cat ~/.ssh/authorized_keys | dokku ssh-keys:add admin

# you can use any domain you already have access to
# this domain should have an A record or CNAME pointing at your server's IP
dokku domains:set-global dokku.me

# you can also use the ip of your server
dokku domains:set-global 10.0.0.2

# finally, you can use sslip.io to get subdomain support
# as you would with a regular domain name
# this would be done by appending `.sslip.io` to your ip address
dokku domains:set-global 10.0.0.2.sslip.io

```

