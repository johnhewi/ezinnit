# <p align="center">ezinnit
### <p align="center">Easily Initialize Continuous Integration and Continuous Deployment</p>
Continuous integration means that from the moment you begin your project, 
commits to main should be automatically deployed. 
Continuous deployment means that from the moment you begin your project, 
you should have a live build of your app in a container on a remote server 
with a secure public connection. 

<br>This script initializes your gitlab repository and installs dokku on your server. 
Your gitlab repository and dokku are configured to 
automatically deploy any commits to your main branch
to your server, where your app is automatically built in a container
and securely served  at your domain.


### To download and run ezinnit:
```bash
mkdir ezinnit
wget https://raw.githubusercontent.com/johnsyncs/ezinnit/main/ezinnit -P ezinnit
bash ezinnit/ezinnit
```
(run ezinnit on the command line in your project directory)



### You will be prompted for:
1. gitlab username
2. gitlab_domain (if your account is with gitlab.com, then the gitlab domain is `gitlab.com`)
3. [gitlab personal access token](tutorial/tutorials/link_to_gitlab_and_dokku/get_personal_access_token.md)
4. app name (becomes your gitlab repository name)
5. ip address of your remote server
6. the domain or subdomain you wish to point to your new app, for example: `mynewapp.mydomain.com`
7. email address to use for registering with [letsencrypt](https://letsencrypt.org/)
8. optional app type for additional initialization templates, django, flask or fastApi

### requirements:
* a python 3 virtual environment containing your app
* your local machine's ssh key registered on gitlab
* your local machine's ssh key registered on your new server ([digital ocean tutorial](tutorial/tutorials/digital_ocean_tutorial/create_digital_ocean_droplet.md))
* a new server running Ubuntu 20.04 [how to create a digital ocean droplet](tutorial/tutorials/digital_ocean_tutorial/create_digital_ocean_droplet.md)
* for your domain to work, you need a DNS \"A\" record pointing your domain to your server ip address [(create the DNS \"A\" record before running ezinnit)](tutorial/tutorials/link_to_gitlab_and_dokku/point_url_to_dokku_app.md)
* this script was originally designed to replace the steps in [this tutorial](tutorial/deployment_tutorial.md)

### warning!
* this script creates new ssh keys on the remote server!
* if you select an app type, ezinnit will write over files, including your procfile, settings.py, main.py etc.
* app selection is only for use in initializing a brand new flask, django or fastApi app
* if you want to deploy your environment as is, just hit enter when prompted for app type

### what ezinnit does
* checks for ezinnit.config, if it doesn't exist, it prompts you for the values and creates an ezinnit.config file
* uses [toptotal](https://www.toptal.com/developers/gitignore) to create a .gitignore file in your project directory
* installs gunicorn in local environment
* runs template script for your platform if you've selected one
* creates a gitlab pipeline for automated deployment (.gitlab-ci.yml) in your project directory
* creates a requirements.txt file in your project directory
* initializes git repository, sets initial branch to main, sets remote to new gitlab repository, commits and pushes to gitlab
* gets the runner token for the new repository from gitlab
* copies ezinnit.config to server
* runs server initialization script on the remote server, which does the following:
* creates new ssh keys on server
* uploads server's ssh keys to gitlab repository
* downloads and installs [dokku](https://dokku.com/) on server
* creates dokku app on server
* sets the domain for the dokku app on server
* sets the apps port to 80:5000 on server
* downloads and creates a gitlab runner on server
* registers the gitlab runner on server
* downloads and installs [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt) on server
* enables encryption for app on server with TLS certificate from [letsencrypt](https://letsencrypt.org/) on server
* adds a chron job on server to automatically renew TLS certificates

### start your project with ezinnit for CI/CD 

ezinnit deploys an app in a python environment to a docker container using [dokku](https://dokku.com/) and configures it for [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration) and [continuous deployment](https://en.wikipedia.org/wiki/Continuous_deployment) via [gitlab](https://gitlab.com).
At the push of a button, your app will be live and future changes will be automatically deployed.

After running ezinnit, a docker container on your server is securely (https) serving your app to your specified domain, `https://yourdomain.com`. A new gitlab repository is created and configured for [CI/CD](https://en.wikipedia.org/wiki/CI/CD) via a gitlab pipeline and runner. Commits to the main branch in your new gitlab repository will be automatically deployed to the live app.

There are additional features for initializing a completely new [flask](https://flask.palletsprojects.com/), [django](https://www.djangoproject.com/) or [fastApi](https://fastapi.tiangolo.com/) app. If you just want to deploy your local environment as is, do not enter an app type. If you set app type to django, flask or fastApi, some of your project files will be overwritten. For Django apps, debug mode will be OFF in the deployed app, but the local ENV will be set to DEVELOPMENT. When running locally, debug mode will be ON. \
If you're trying to deploy an existing project, don't select an app type

ezinnit is modular, and different deployment scripts and template scripts can be swapped out relatively easily.

### to start a django project from scratch:

```bash
mkdir ezinnit
wget https://raw.githubusercontent.com/johnsyncs/ezinnit/main/ezinnit%20template%20scripts/django.innit -P ezinnit
bash ezinnit/ezinnit
```

### <p align="center">Synctivate
<p align="center">Custom Software
<br><a href="https://synctivate">synctivate.com</a>
<br><a href="https://github.com/johnhewi">John Hewitt</a>
<br><a href="https://github.com/robswc">Robert Carroll</a>

