# ezinnit
ezinnit automatically deploys a new app with [dokku](https://dokku.com/) and configures it for [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration) and [continuous deployment](https://en.wikipedia.org/wiki/Continuous_deployment) via [gitlab](https://gitlab.com).
At the push of a button, your app will be live and future changes will be automatically deployed.

After running ezinnit, your app is hosted on your server, running in a docker container and live at `https://yourdomain.com`. A new gitlab repository is created and configured for [CI/CD](https://en.wikipedia.org/wiki/CI/CD): commits to the main branch in your new gitlab repository will be automatically deployed to the live app. 

There are some additional features for NEW flask, django and fastApi apps. If you just want to deploy your local environment as is, do not enter an app type. If you set app type to django, flask or fastApi, some of your project files will be overwritten to create a basic, functioning template. For Django apps, debug mode will be OFF in the deployed app, but the local ENV will be set to DEVELOPMENT. Thus when running locally, debug mode will be ON. When app type is django, the settings.py file will be overwritten. When app type is fastApi, the main.py file will be overwritten.  


ezinnit was created by John Hewitt for https://synctivate.com

### download ezinnit into your project directory:
```bash
wget https://raw.githubusercontent.com/johnhewi/ezinnit/main/ezinnit
```

### run ezinnit:
```bash
bash ezinnit
```

### (optional) download ezinnit.config template:
```bash
wget https://raw.githubusercontent.com/johnhewi/ezinnit/main/ezinnit.config
```

### you will need:
* a python 3 virtual environment containing your app
* your [gitlab](https://gitlab.com) username
* your gitlab account domain (if your account is with gitlab.com, then the gitlab domain is `gitlab.com`. If you are using a self-hosted gitlab instance, then the gitlab domain might be something like `git.mydomain.com`)
* your [gitlab personal access token](tutorial/get_personal_access_token.md)
* your local machine's ssh key registered on gitlab
* your local machine's ssh key registered on your new server (digital ocean sets this up automatically, see [tutorial](tutorial/tutorials/digital_ocean_tutorial/create_digital_ocean_droplet.md)
* your server ip address (new droplet running Ubuntu 20.04) [how to create a digital ocean droplet](tutorial/tutorials/digital_ocean_tutorial/create_digital_ocean_droplet.md)
* the domain or subdomain you wish to point to your new app, for example: `mynewapp.mydomain.com`
* a DNS \"A\" record pointing your subdomain.domain to your server ip address [(create the DNS \"A\" record before running ezinnit)](tutorial/tutorials/link_to_gitlab_and_dokku/point_url_to_dokku_app.md)
* the name of the app you wish to create on the server, for example, `mynewapp`. This will also become the name of the project on gitlab. (This MUST match the django project name if app type is django!)
* email address to use for registering with [letsencrypt](https://letsencrypt.org/)
* the type of the app: either flask, django, fastApi or just deploy the environment as is
* this script was originally designed to replace the steps in [this tutorial](tutorial/tutorials/deployment_tutorial.md)
### warning!
* if you select an app type, ezinnit will write over files, including your procfile, settings.py, main.py etc.
* app selection is only for use in initializing a brand new flask, django or fastApi app
* if you want to deploy your environment as is, just hit enter when prompted for app type

### ezinnit.config file
if you don't have a ezinnit.config file in your root directory,
the script will prompt you for the above values and create one.
Alternatively, you can download the ezinnit.config template
to your root directory and input the values in the file and then run the script.


### what ezinnit does
* checks for ezinnit.config, if it doesn't exist, it prompts you for the values and creates an ezinnit.config file
* uses [toptotal](https://www.toptal.com/developers/gitignore) to create a .gitignore file in your project directory
* installs gunicorn in local environment
* creates a procfile in project directory if django, flask or fastApi app type is selected
* for django apps: replaces settings.py, creates runtime.txt, collects static, migrates
* creates a gitlab pipeline for automated deployment (.gitlab-ci.yml) in your project directory
* creates a requirements.txt file in your project directory
* initializes git repository, sets initial branch to main, sets remote to new gitlab repository, commits repository and pushes to gitlab
* sets local ENV to DEVELOPMENT
* gets the runner token for the new repository from gitlab
* creates ssh keys on remote server
* uploads server's ssh keys to gitlab repository
* downloads and installs dokku on remote server
* creates dokku app on remote server
* sets the domain for the dokku app on remote server
* sets the apps port to 80:5000 on remote server
* downloads and creates a gitlab runner on remote server
* registers the gitlab runner on remote server
* downloads and installs [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt)
* enables encryption for app with TLS certificate from [letsencrypt](https://letsencrypt.org/)
* adds a chron job to automatically renew TLS certificates


