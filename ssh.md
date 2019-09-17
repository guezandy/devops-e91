# Secure Shell

### Notes

- Uses both symettric and asymmetric encryption
- Default port 22
- connect using ssh key

### File transfer

- rsync
- scp

### Requirements for SSH connection

- sshd service on server B should be up and running.
- user Z is created on Server B.
- user Z on B has “authorized_keys” file that stores the public key of User Z on server A, while server A has the private key of user Z’s public key.
- the “authorized_keys” file is located in the home directory of the user Z on the path “~/.ssh/authorized_keys”.
- no firewall along the connection path between A and B is blocking port 22.

### Create SSH key

`ssh-keygen -f e91-rsa-key`

### Make a remote server support SSH

Copy users public key on to the servers authorized keys file
`remote-server $> echo ${content of ssh file ./id_rsa.pub} >> ${server path/.ssh/authorized_keys}`

Note:
When using ssh key authentication, it's good to make sure of the following permissions settings:

- Your ~/.ssh/authorized_keys file has "rw" permission only for you, and no one else (i.e. chmod 600)
- Your ~/.ssh/ directory has "rwx" permissions only for you (i.e. chmod 700)
- Your home directory has write access only for you (try the command "ls -ld ~username")

Verify
`ls -ld ~/.ssh/` -> `drwx------`
`ls -ld ~/.ssh/authorized_keys` -> `-rw------`
`ls -ld ~<root user/ andrewr>` -> `drwx-----`

### Login using SSH

`ssh -i ~routeToSSH/.ssh/e91-rsa-key username@remote-server-ip`
A couple things to check:

- If you are not prompted for a passphrase at all, the server knows nothing about your public key or you did not configure a passphrase; check to make sure that you installed your public key correctly on the server
- If you are prompted for the passphrase, but then prompted for a password as well, check the permissions on the server. If the problem persists, try regenerating a new key pair and replace the old with the new pair.
- For verbose debugging information of the authentication process, add the option "-v" or even "-vv" when you run ssh.

### Moving files between 2 servers that both have your public key ssh authorized

- In this case you can setup an SSH Tunnel
- Connect using `-A` switch `ssh -A username@remote_machine`

### Permanently add your SSH file path to a machine

`ssh-add ~/.ssh/e91-rsa-key`

### How to specifically setup comms between 2 remote servers

1. `ssh user@server1`
2. Generate ssh `ssh-keygen -f /home/user/.ssh/id_rsa -N ''`
3. Confirm login from one server to the other
4. Confirm you can login to the second from the first
   While SSH'd into server1 run `ssh user@server2`
5. To deploy your public key to a server on which you have password access, use from server1 `ssh-copy-id user@server2`
6. Confirm - `ssh user@server` -> `ssh user@server2`
