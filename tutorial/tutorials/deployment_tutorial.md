# Set up Server with Automated Deployment:

I made this tutorial for [Synctivate](https://www.synctivate.com) with patient instruction by [Rob](https://github.com/robswc), who developed the process. The tutorial enables one to deploy an app using [Dokku](https://dokku.com/) to a [DigitalOcean Droplet](https://www.digitalocean.com/products/droplets) and set up automatic deployment via a self-hosted instance of [GitLab](https://about.gitlab.com/).

<br>After following this tutorial, your web app will be live and pushing or merging to main will automatically deploy changes to the live server.

## [create droplet and install dokku](create_droplet_and_install_dokku.md)

## [prepare local repository for deployment](prepare_repo.md)

## [create dokku app on server](create_dokku_app.md)

## [deploy to dokku from gitlab](create_gitlab_runners.md)
