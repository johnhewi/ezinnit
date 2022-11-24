## create a Procfile in your project directory

make a new file in your directory named "Procfile" (no extension)


for a flask app, in Procfile write:
```bash
web: gunicorn app:app
```

This procfile, we are instructing gunicorn to run the app named "app" that is in the app folder.

if app.py was renamed to main.py, the procfile would be:
```bash
web: gunicorn main:app
```

for a django app, the Procfile would be:
```bash
web: gunicorn project_name.wsgi
```
