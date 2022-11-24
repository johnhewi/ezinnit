## create a requirements.txt file in project directory

#### Install upreq
upreq creates a requirements.txt file from your local environment with one simple command

[upreq docs and installation guide](www.github.com/robswc/upreq)

#### To install upreq on MacOS 
in terminal, local environment, run:
```bash
curl -s https://api.github.com/repos/robswc/upreq/releases/latest | grep "browser_download_url.*upreq-darwin" | cut -d : -f 2,3 | tr -d \" | wget -qi -
chmod +x upreq-darwin
sudo mv upreq-darwin /usr/local/bin/upreq
```

#### Use upreq to create a requirements.txt file

In terminal, in local environment, in project directory, run:
```bash
upreq
```
This creates a requirements.txt file in your project directory with all the dependencies in your local environment. If you run the command again, it will update the requirements.txt with any changes in your local environment's dependencies.

Be on the lookout for upproc as well!

