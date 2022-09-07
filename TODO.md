# SYSTEM

- [x] Namespace
- [x] Master Pod
- [x] Slave Pod
- [X] SSH
- [x] Rsync
- [x] Curl
- [x] Cron | Crontab
- [x] Test Files
- [x] PVC
    - [x] SSH PVC (100Mi)
    - [x] ROOT PVC (10Gi)

## _Alternative methods:_
Manually append your public key to the remote ssh server's key to authorized_keys file. For example, copy the content of your ~/.ssh/id_rsa.pub to the server's ~/.ssh/authorized_keys file.
Using the following command combination

```sh
$ cat ~/.ssh/id_rsa.pub | ssh user@remote-host 'cat >> ~/.ssh/authorized_keys'
```

## _Tricks!:_
You have to create the .ssh directory and the authorized_keys file the first time.

Create the .ssh directory:
```sh
mkdir ~/.ssh
```

Set the right permissions:
```sh
chmod 700 ~/.ssh
```

Create the authorized_keys file:
```sh
touch ~/.ssh/authorized_keys
```

Set the right permissions:
```sh
chmod 600 ~/.ssh/authorized_keys
```

The permissions are important! It won't work without the right permissions!

Now you can add the public key to the authorized_keys file:

```sh
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

You have to add the public key of your computer to the authorized_keys file of the computer you want to access using SSH Keys!