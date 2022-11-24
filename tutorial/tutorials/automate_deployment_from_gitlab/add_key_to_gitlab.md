## add key to gitlab

#### Go to gitlab repository environment variables

in gitlab repository, on left menu select settings>CI/CD
![img.png](images/settings_ci_cd.png)

in the variables section select "expand"
![img_1.png](images/select_expand.png)

select "Add Variable"
![img.png](images/add_variable.png)

now name Key: "SSH_PRIVATE_KEY" and paste [your server's key file](../digital_ocean_tutorial/create_and_retrieve_key_on_server.md) file into the Value field
![img.png](images/add_private_key.png)
now click "Add Variable"



