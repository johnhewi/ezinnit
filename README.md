## deploy with continuous integration via easyinnit

### to download easyinnit into your project directory:
```bash
wget https://raw.githubusercontent.com/johnhewi/ezinnit/main/ezinnit
```

### to run easyinnit:
```bash
bash easyinnit
```

### to download easyinnit.config template:
```bash
wget https://raw.githubusercontent.com/johnhewi/ezinnit/main/ezinnit.config
```

### you will need:
* your gitlab username 
* your gitlab account domain (if your account is with gitlab.com, then the gitlab domain is `gitlab.com`)
* your gitlab personal access token
* your server ip address
* the domain or subdomain you wish to point to your new app, for example: `mynewapp.mydomain.com`
* the name of the app you wish to create on the server, for example, `mynewapp`. This will also become the name of the project on gitlab.
* email address to use for registering with [letsencrypt](https://letsencrypt.org/)
* the type of the app: either flask, django, fastApi or just deploy the environment as is

### warning
* if you select an app, ezinnit will write over your procfile, settings.py, main.py etc. 
* app selection is only for use in initializing a brand new flask, django or fastApi app

### easyinnit.config file
if you don't have a easyinnit.config file in your root directory, 
the script will prompt you for the above values and create one.
Alternitively, you can download the easyinnit.config template 
to your root directory and input the values in the file and then run the script.

### easyinnit's mission:
to automatically deploy an app and set it up for continuous integration.
At the push of a button, your app will be live on your server and ready for continuous integration.

### what easyinnit does
* checks for easyinnit.config, if it doesn't exist, it prompts you for the values and creates an easyinnit.config file
* uses [toptotal](https://www.toptal.com/developers/gitignore) to create a .gitignore file in your project directory
* installs gunicorn in local environment
* creates a procfile in project directory
* for django apps: replaces settings.py, creates runtime.txt, collects static, migrates ands sets local ENV
* creates a .gitlab-ci.yml (gitlab pipeline) file in your project directory
* creates a requirements.txt file in your project directory
* creates a new gitlab repository and commits your project to main
* gets the runner token for the new repository from gitlab
* creates ssh keys on remote server
* downloads and installs dokku on remote server
* creates dokku app on remote server
* sets the domain for the dokku app on remote server
* sets the apps port to 5000 on remote server
* downloads and creates a gitlab runner on remote server
* registers the gitlab runner on remote server
* downloads and installs [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt)
* enables encryption for app with TLS certificate from [letsencrypt](https://letsencrypt.org/)
* adds a chron job to automatically renew TLS certificates


