# <p align="center">ezinnit
### <p align="center">Automated CICD Utility</p>

Continuous integration means that from the moment you begin your project, 
frequent commits to main are automatically deployed.
Continuous deployment means that from the moment you begin your project, 
you always have a live build of your app in a container on a remote server 
with a secure public connection.

After running ezinnit, your webapp will be running on your server, live at the https domain of your choice and future commits to your main branch will automatically deploy to the live app.

In a completely automated process, ezinnit initializes and pushes your gitlab repository and deployment pipeline and then installs dokku and a gitlab runner on your server. 
Your gitlab repository is configured to 
automatically deploy any commits to your main branch
to your server, where your app is automatically built in a container 
and served at your public https domain.

ezinnit includes app templates for new django, flask and fastApi projects.

### to initiate continuous integration and deployment:
```bash
mkdir ezinnit
wget https://raw.githubusercontent.com/johnsyncs/ezinnit/main/ezinnit -P ezinnit
bash ezinnit/ezinnit
```
(run ezinnit in your project's root directory)



### You will be prompted for:
1. gitlab username
2. gitlab domain (if your account is with gitlab.com, then the gitlab domain is `gitlab.com`)
3. [gitlab personal access token](tutorial/tutorials/link_to_gitlab_and_dokku/get_personal_access_token.md)
4. app name (also becomes your gitlab repository name)
5. ip address of your remote server
6. the domain or subdomain you wish to point to your new app, for example: `mynewapp.mydomain.com`
7. email address to use for registering with [letsencrypt](https://letsencrypt.org/)
8. optional app template: django, flask or fastApi

### requirements:
* a python virtual environment (with pip) with your app installed (or to make a django project from scratch, see bottom of readme)
* git
* a gitlab account (gitlab.com accounts must be verified to use gitlab runners, but verification is free)
* a server running Ubuntu 20.04 [how to create a digital ocean droplet](tutorial/tutorials/digital_ocean_tutorial/create_digital_ocean_droplet.md)
* your local machine's ssh key registered on gitlab
* your local machine's ssh key added to your new server's allowed hosts ([digital ocean tutorial](tutorial/tutorials/digital_ocean_tutorial/create_digital_ocean_droplet.md))
* for your domain to work, you need a DNS \"A\" record pointing your domain to your server ip address [(create the DNS \"A\" record before running ezinnit)](tutorial/tutorials/link_to_gitlab_and_dokku/point_url_to_dokku_app.md)

### warning!
* this script creates new ssh keys on the remote server!
* if you select an app template, ezinnit will write over files, including your procfile, settings.py, main.py etc. Only use the templates for brand new projects.

### what ezinnit does
* checks for ezinnit.config, if it doesn't exist, it prompts you for the values and creates an ezinnit.config file
* uses [toptotal](https://www.toptal.com/developers/gitignore) to create a .gitignore file in your project directory
* runs app template script if you've selected one (django, flask and fastApi are included in this release)
* creates a gitlab pipeline for automated deployment (.gitlab-ci.yml) in your project directory
* creates a requirements.txt file in your project directory
* initializes git repository, sets initial branch to main, sets remote to new gitlab repository, commits and pushes to gitlab
* gets the runner token for the new repository from gitlab
* copies ezinnit.config to server
* runs server initialization script on the remote server, which does the following:
* creates new ssh keys on server
* uploads server's ssh keys to gitlab repository
* downloads and installs [dokku](https://dokku.com/) on server (this takes a few minutes)
* creates dokku app on server 
* sets the domain for the dokku app on server
* sets the apps port to 80:5000 on server
* downloads and creates a gitlab runner on server
* registers the gitlab runner on server
* downloads and installs [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt) on server
* enables encryption for app on server with TLS certificate from [letsencrypt](https://letsencrypt.org/) on server
* adds a chron job on server to automatically renew TLS certificates
* for django, flask and fastApi, creates and runs a script: `ezrun` to find an open port and run locally in development environment
* when ezinnit completes, gitlab will automatically begin deploying your app to your server. ezinnit will give you a link to your new repository where you can check on the deployment status.

#### to find an open port and run django, flask or fastApi ezinnit template apps locally in development environment:
```bash
bash ezrun
```

### Deploy Now and Forever
 
Use ezinnit whenever you start a new webapp project. At the push of a button, your project will begin with a gitlab repository that automatically deploys main commits to a container on the server of your choice, where your app is running and available at the domain of your choice.
<br><br>You can now develop for the true environment your app is intended for with instant feedback about how changes will impact real world usability. You know instantly if your app will build in a container and how it will behave on a live server.
<br><br> When you start a project with ezinnit, you're really doing CICD. From day one, you hit the ground running with a live app on your own server on your own domain, so you can focus on what only you can do.
### to start a django project from scratch:

```bash
mkdir ezinnit
wget https://raw.githubusercontent.com/johnsyncs/ezinnit/main/ezinnit%20template%20scripts/django.innit -P ezinnit
bash ezinnit/django.innit
```

### <p align="center">Synctivate
<p align="center">Custom Software
<br><a href="https://synctivate">synctivate.com</a>
<br><a href="https://github.com/johnhewi">John Hewitt</a>
<br><a href="https://github.com/robswc">Robert Carroll</a>

Copyright 2022 Synctivate

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.