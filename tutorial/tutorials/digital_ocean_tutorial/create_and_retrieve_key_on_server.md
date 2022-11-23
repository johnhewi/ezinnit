## create and retrieve key on server

#### generate ssh keys

```bash
ssh-keygen
```
follow the prompts, example:
![img.png](../automate_deployment_from_gitlab/images/create_ssh_key.png)
it's telling me that the key has been saved in /root/.ssh/id_rsa
<br></br>
<br></br>

When prompted "enter file in which to save the key," you may enter:

```bash
/root/.ssh/id_rsa
```
<br></br>
<br></br>

#### get server key
to view the key, enter:
```bash
cat /root/.ssh/id_rsa
```
<br></br>
<br></br>

copy the key including first and last lines:<br>
"-----BEGIN OPENSSH PRIVATE KEY-----" <br>
"-----END OPENSSH PRIVATE-----"<br>
![img.png](../automate_deployment_from_gitlab/images/copy_key.png)







