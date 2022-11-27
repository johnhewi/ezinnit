## set proxy port for remote dokku app

read more about proxy management on [dokku's docs](https://dokku.com/docs~v0.8.2/advanced-usage/proxy-management/)

run in terminal on remote server:
```bash
dokku proxy:ports-set [app-name] http:80:5000
```

now you can access your app at your_server_ip:5000

## point subdomain url to dokku app

set the subdomain url to point to your dokku app
```bash
dokku domains:set yourappname subdomain.domain.com
```

for example, if my app name is tutorial, and my subdomain is "tutorial.johnstutorial.com", I would run:
```bash
dokku domains:set tutorial tutorial.johnstutorial.com
```

now when we run `dokku domains:report` we should see:
```bash
=====> tutorial domains information
       Domains app enabled:           true
       Domains app vhosts:            tutorial.johnstutorial.com
       Domains global enabled:        false
       Domains global vhosts:         
```

web traffic to your subdomain will now route to your app