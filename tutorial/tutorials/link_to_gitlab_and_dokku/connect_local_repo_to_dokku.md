## link local repository to dokku app on remote server 

### Add dokku remote to local git repository

#### Run in local terminal:

```bash
git remote add dokku dokku@[server-ip]:[app-name]
```

In this case, the "dokku" in "dokku@" is the user on the remote server created when dokku was installed. 

Dokku runs on its own user account on the remote server. You shouldn't have to use the dokku user to do anything else.