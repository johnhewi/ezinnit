## steps for deploying django apps:

### create a Procfile in your project directory, and put this line in it:
```bash
web: gunicorn project_name.wsgi
```
replace "project_name" with the name of your project

<br></br>

### change your settings.py file:

#### import os
add this line to the top of settings.py:
```python
import os
```
<br></br>



#### change static settings:

replace this line in settings.py:
```python
STATIC_URL = 'static/'
```

with these lines:
```python
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
STATIC_URL = 'static/'
STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')
```

<br></br>

#### change allowed hosts:
add the server's IP to ALLOWED_HOSTS in settings.py
```python
ALLOWED_HOSTS = ['your_server_ip', 'localhost']
```


<br></br>

### add a runtime.txt file to your project directory

add this line to runtime.txt:
```bash
python-3.8.10
```

<br></br>

### run collect static on local repository before deploying
```bash
python manage.py collectstatic
```


