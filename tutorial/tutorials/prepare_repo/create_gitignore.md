## create a .gitignore file in your project directory
It's important to have a gitignore file in our project directory. We don't want environment data committed to git. The virtual environment will always be built from scratch when the project is deployed on a new machine

## Generate gitignore using gitignore.io
### Install gitignore.io
Copy and paste script for Linux Bash install from https://docs.gitignore.io/install/command-line

#### Run in local terminal:

```bash
echo "function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/\$@ ;}" >> \
~/.bashrc && source ~/.bashrc
```
This script works by adding shortcut to your bash rc file that queries the website
#### Generate a gitignore file using gitignore.io
#### Run in terminal:
```bash
gi python,pycharm >> .gitignore
```
That generates a gitignore file with python and pycharm settings