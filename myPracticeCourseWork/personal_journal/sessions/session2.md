[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md) 

# Session 2

## Topics covered
*What topics were covered in this session*

My work for this class used the local copy of the instructors session 2 at [Session2](../../session2)

Created a web page html example using [w3schools](https://www.w3schools.com/Html/)

```
[vagrant@localhost html]$ cd /var/www/html
[vagrant@localhost html]$ sudo nano test3.html
[vagrant@localhost html]$ ls
examplewebpage.html  test2.html  test3.html
[vagrant@localhost html]$ sudo nano test4.html
[vagrant@localhost html]$ sudo nano test4.html
```


## Personal Notes and research following this session
*Which class sessions and personal research refers to technology in this proposal. Link to examples.*

- During this session, I learned how to use SSH to connect to remote machines and switch to the ansible user account for automation tasks. I also learn how ansible uses SSH keys to manage multiple hosts without requiring passwords.

- Through personal research, I gain a better understanding of ansible controller, managed  nodes, and the role of SSH in network automation. This helps improve my Linux and system administration skills.



## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*
 
- I Used vagrant up to set three machines up and running that the ansible controller, ubuntu_1, and the rocky_1. I also used the vagrant status to check if the three machines were up and running 
 
```
vagrant-examples\example2-2> vagrant status
Current machine states:

ansible_controller        running (virtualbox)
ubuntu_1                  running (virtualbox)
rocky_1                   running (virtualbox)

```

- I use the vagrant ssh to ssh into the different machine. Firstly i ssh into the ansible_controller as shown below 
 
```

vagrant-examples\example2-2> vagrant ssh ansible_controller
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Nov  1 01:29:40 PM UTC 2026

  System load:           0.01
  Usage of /:            16.1% of 30.34GB
  Memory usage:          28%
  Swap usage:            0%
  Processes:             128
  Users logged in:       0
  IPv4 address for eth0: 10.0.2.15
  IPv6 address for eth0: fd17:625c:f037:2:a00:27ff:fef8:c2eb


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.
vagrant@ansible-controller:~$

```
- From the ansible account, I was able to ssh into the other machines as shown below

```
vagrant@ansible-controller:~$ ssh ansible@192.168.56.20
The authenticity of host '192.168.56.20 (192.168.56.20)' can't be established.
ED25519 key fingerprint is SHA256:VjufUgJCRplYbNSq6ATc0g/DLpYxoTbOJ7Eaml2Enlc.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.56.20' (ED25519) to the list of known hosts.
ansible@192.168.56.20's password:
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Nov  1 01:34:47 PM UTC 2026

  System load:           0.08
  Usage of /:            14.7% of 30.34GB
  Memory usage:          21%
  Swap usage:            0%
  Processes:             130
  Users logged in:       0
  IPv4 address for eth0: 10.0.2.15
  IPv6 address for eth0: fd17:625c:f037:2:a00:27ff:fef8:c2eb


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ansible@ubuntu-1:~$



ansible@ubuntu-1:~$ ssh ansible@192.168.56.30
The authenticity of host '192.168.56.30 (192.168.56.30)' can't be established.
ED25519 key fingerprint is SHA256:NcU1EQT5o1v+HYAdqF972vTlrHoEppCN9OSuFUfeIQE.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.56.30' (ED25519) to the list of known hosts.
Load key "/home/ansible/.ssh/id_rsa": error in libcrypto
ansible@192.168.56.30's password:

This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.
Activate the web console with: systemctl enable --now cockpit.socket

[ansible@rocky-1 ~]$

```
- I used sudo su ansible to switch to the ansible account, the ssh public and private keys are shared between the machines as shown below:

```

Last login: Sun Nov  1 13:38:58 2026
[ansible@rocky-1 ~]$ sudo su ansible
[ansible@rocky-1 ~]$


ansible@ubuntu-1:~$ sudo su ansible
ansible@ubuntu-1:~$

```
- In the ansible account, was automatically authenticated as the ansible user to the other machines

```


ansible@ubuntu-1:~$ sudo su ansible
ansible@ubuntu-1:~$ ssh 192.168.56.30
Load key "/home/ansible/.ssh/id_rsa": error in libcrypto
ansible@192.168.56.30's password:

This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.
Activate the web console with: systemctl enable --now cockpit.socket

Last login: Sun Nov  1 13:46:32 2026
[ansible@rocky-1 ~]$

```

- I tried if i could ping the other machines from the ansible_controller but it fails because i had to ssh into each machine to accept the host key from the ansible_account as shown below.

```
ansible@ansible-controller:~$ sudo su ansible
ansible@ansible-controller:~$ cd /vagrant/ansible/project-ansible2-1
ansible@ansible-controller:/vagrant/ansible/project-ansible2-1$ ansible -i inventory.ini all -m ping
[WARNING]: Ansible is being run in a world writable directory (/vagrant/ansible/project-ansible2-1), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
[ERROR]: Task failed: Failed to connect to the host via ssh: Load key "/home/ansible/.ssh/id_rsa": error in libcrypto
ansible@192.168.56.30: Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

192.168.56.30 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: Load key \"/home/ansible/.ssh/id_rsa\": error in libcrypto\r\nansible@192.168.56.30: Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).",
    "unreachable": true
}
[ERROR]: Task failed: Failed to connect to the host via ssh: Host key verification failed.
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

192.168.56.10 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: Host key verification failed.",
    "unreachable": true
}
[ERROR]: Task failed: Failed to connect to the host via ssh: Load key "/home/ansible/.ssh/id_rsa": error in libcrypto
ansible@192.168.56.20: Permission denied (publickey,password).
Origin: <adhoc 'ping' task>

{'action': 'ping', 'args': {}, 'timeout': 0, 'async_val': 0, 'poll': 15}

192.168.56.20 | UNREACHABLE! => {
    "changed": false,
    "msg": "Task failed: Failed to connect to the host via ssh: Load key \"/home/ansible/.ssh/id_rsa\": error in libcrypto\r\nansible@192.168.56.20: Permission denied (publickey,password).",
    "unreachable": true
}

```
- After i ssh into the other machines, was still unable to use Ansible ping because the ssh private KEY (id_rsa) on the ansible controller was corrupted. This cause the libcrypto error and prevent ssh key authentication. I fixed this issue by creating a new ssh key pair and copy the public key to manage all nodes using ssh-copy-id.After that, ansible was able to authenticate successfully and ping all the client machines  as shown below 

```
ansible@ansible-controller:/vagrant/ansible/project-ansible2-1$ cd
ansible@ansible-controller:~$ mv ~/.ssh/id_rsa ~/.ssh/id_rsa.broken
ansible@ansible-controller:~$ mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.broken
ansible@ansible-controller:~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ansible/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/ansible/.ssh/id_rsa
Your public key has been saved in /home/ansible/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:y4hLvqKdavTFK2W4WWpCuCpkbHOf53mzOmeP5CskgAU ansible@ansible-controller
The key's randomart image is:
+---[RSA 4096]----+
| E.              |
|   .             |
|  o              |
| . .             |
|o   +   S        |
|.O o O + .       |
|*.+ % * o.       |
|o+.@ = ++=.      |
|Bo=.=.o+B==.     |
+----[SHA256]-----+
ansible@ansible-controller:~$ ssh-keygen -y -f ~/.ssh/id_rsa
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDbQ43uc2j4CRDA0+Qysw6wBXatrOjcmk5ob3luHRLThW5umhk9hMNW3RyJwcA82+AsEtHe9YFT4/Quu9296nkN6d2Xed7L1NC/vT14YTa3oD5ZjyehNW9V6yQgaXH9RX3ZgRbBnVr+tN+S3esyxiJfGgp3R+0FC1KBMlQDe8Sp/7gP/iVdKtFFoPyvGbLOkhrRUQOgJPX0k+1RxAlQwvgKcPCRm307CDrGybkwmOj2Shk/j4Shrqy/j8Pr61rWJfD+pOKtHwWoabFAu/mnjA+YpkkZyJhbMc3pBEMc6DkUbohXbLZWE3ahYlnW6UbHPx4eVLiR/28bv18ldae6mqZTf3EwImrZCdBWq9XBkTlf3vFjS0oDKVhkFs9vVK/pFQ4ks7ZkOtAteaw8G0t0iBBATwsDIzbkSPZ9LFUoTF71FxzLjuuwHfXddOjiejquSj8b065JMK7SdoVFQ+4BsBtmqjwGXkpetTBwp0lGvjytXQLdg/RT4Rj6gWjdjo5Ao3CB/Rs1v1EH1xkGgiDsUaKVTkNVh2rCC26Mm5YuViSa2fSO+HdbFp58m2oxekxxVdCZIvQjpp7N1aa6CWnQc4B3S3tV5Ax3od+VSyjB3v4NH+eadAw/wAw3KMsPSmksOwIKB1SeWHyU7MeYYO0TztSZgUDfPRml8K/595v/xz7GOQ== ansible@ansible-controller
ansible@ansible-controller:~$ ssh-copy-id ansible@192.168.56.10
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ansible/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansible@192.168.56.10's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ansible@192.168.56.10'"
and check to make sure that only the key(s) you wanted were added.

ansible@ansible-controller:~$ ssh-copy-id ansible@192.168.56.20
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ansible/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansible@192.168.56.20's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ansible@192.168.56.20'"
and check to make sure that only the key(s) you wanted were added.

ansible@ansible-controller:~$ ssh-copy-id ansible@192.168.56.30
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ansible/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansible@192.168.56.30's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ansible@192.168.56.30'"
and check to make sure that only the key(s) you wanted were added.

ansible@ansible-controller:~$ ssh ansible@192.168.56.20
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Nov  1 04:28:59 PM UTC 2026

  System load:           0.02
  Usage of /:            14.7% of 30.34GB
  Memory usage:          26%
  Swap usage:            0%
  Processes:             158
  Users logged in:       1
  IPv4 address for eth0: 10.0.2.15
  IPv6 address for eth0: fd17:625c:f037:2:a00:27ff:fef8:c2eb


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.
Last login: Sun Nov  1 16:22:33 2026 from 192.168.56.10
ansible@ubuntu-1:~$ ssh 192.168.56.10
Load key "/home/ansible/.ssh/id_rsa": error in libcrypto
ansible@192.168.56.10's password:
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Nov  1 04:30:21 PM UTC 2026

  System load:           0.79
  Usage of /:            16.2% of 30.34GB
  Memory usage:          35%
  Swap usage:            0%
  Processes:             176
  Users logged in:       2
  IPv4 address for eth0: 10.0.2.15
  IPv6 address for eth0: fd17:625c:f037:2:a00:27ff:fef8:c2eb


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.
Last login: Sun Nov  1 16:23:17 2026 from 192.168.56.20
ansible@ansible-controller:~$ cd /vagrant/ansible/project-ansible2-1
ansible@ansible-controller:/vagrant/ansible/project-ansible2-1$ ansible -i inventory.ini all -m ping
[WARNING]: Ansible is being run in a world writable directory (/vagrant/ansible/project-ansible2-1), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
[WARNING]: Host '192.168.56.10' is using the discovered Python interpreter at '/usr/bin/python3.12', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
192.168.56.10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Host '192.168.56.30' is using the discovered Python interpreter at '/usr/bin/python3.9', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
192.168.56.30 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Host '192.168.56.20' is using the discovered Python interpreter at '/usr/bin/python3.12', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
192.168.56.20 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}
ansible@ansible-controller:/vagrant/ansible/project-ansible2-1$

```
- I tried to ping the clients machine now using the user  name and password authentication instead of the ssh key authentication as shown below.

```

ansible@ansible-controller:/vagrant/ansible/project-ansible2-1$ cat inventory2.ini
[controllers]
ansible_controller ansible_host=192.168.56.10 ansible_connection=ssh ansible_ssh_user=admin ansible_ssh_pass=minad1234

[ubuntu-hosts]
ubuntu_1           ansible_host=192.168.56.20 ansible_connection=ssh ansible_ssh_user=admin ansible_ssh_pass=minad1234

[rocky-hosts]
rocky_1            ansible_host=192.168.56.30 ansible_connection=ssh ansibleansible@ansible-controller:/vagrant/ansible/project-ansible2-1$ ansible -i inventory2.ini all -m ping2-1$ ansible -i inventory2.ini all -m ping
[WARNING]: Ansible is being run in a world writable directory (/vagrant/ansible/project-ansible2-1), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
[WARNING]: Host 'rocky_1' is using the discovered Python interpreter at '/usr/bin/python3.9', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
rocky_1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Host 'ubuntu_1' is using the discovered Python interpreter at '/usr/bin/python3.12', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
ubuntu_1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Host 'ansible_controller' is using the discovered Python interpreter at '/usr/bin/python3.12', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
ansible_controller | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}
ansible@ansible-controller:/vagrant/ansible/project-ansible2-1$


```




## Summary of learning
*What did you learn through these exercises*

During this session, I learn how to used ssh to remotely access and manage different Linux machines from an ansible controller . I practise switching to the ansible user account using sudo su absible and understood the purpose of the ansible account for automation tasks. I also learn how ssh key authentication works and how it allows secure access to remote hosts without repeatedly entering passwords. I successfully connected to the ubuntu_1 and rocky_1 machine using their IP addresses which help me gain a better understanding of remote system administration .
