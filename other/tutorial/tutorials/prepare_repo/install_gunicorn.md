## install gunicorn on local environment

### Install gunicorn on local environment

#### in Pycharm: 
in the bottom tabs, where you can select "Terminal", select "python packages" search for gunicorn and click install

*[For other installation instructions, see the gunicorn install docs](https://docs.gunicorn.org/en/stable/install.html)*


## if you already have a requirements.txt file add gunicorn to it:

In terminal, in local environment, in project directory, run:
```bash 
upreq
```

upreq will add gunicorn to your requirements.txt file

You could now run your app in your local environment via gunicorn with the command:

```bash
gunicorn app:app
```