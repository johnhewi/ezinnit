### push local repository to dokku app on remote server
Once you have added a gitignore, a Procfile and a requirements.txt file to your project directory, and added gunicorn to your requirements.txt file and committed all these files to main, you can push your project to the remote server.


#### Run in terminal:

```bash
git push dokku
```

This will push your project to the remote server and install the dependencies in the dokku container using the requirements.txt file.
