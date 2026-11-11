[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md) 

# Session 4

## Topics covered
*What topics were covered in this session*

- Installed and verify ansible on the pxe server

- Set up a PXE server to run and stimulate an installation of an operating system on a PXE client machine.

- modify the PXE server vagrant script to provision an ansible user with ssh keys and install ansible on the pxe server.

- 


## Personal Notes and research following this session
*Which class sessions and personal research refers to technology in this proposal. Link to examples.*



## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*

- used the command `ansible --version` to check wether ansible was install on the pxe server. 

- Used the command `sudo apt install -y ansible` to install ansible on the pxe server. as shown below. 

```
vagrant@pxe-server:~$ ansible --version
-bash: ansible: command not found
vagrant@pxe-server:~$ sudo apt update
Hit:1 http://security.ubuntu.com/ubuntu noble-security InRelease
Hit:2 http://us.archive.ubuntu.com/ubuntu noble InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu noble-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
251 packages can be upgraded. Run 'apt list --upgradable' to see them.
vagrant@pxe-server:~$ sudo apt install -y ansible
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  ansible-core ieee-data python3-argcomplete python3-dnspython
  python3-kerberos python3-libcloud python3-lockfile python3-netaddr
  python3-ntlm-auth python3-passlib python3-requests-ntlm
  python3-resolvelib python3-selinux python3-simplejson python3-winrm




## Summary of learning
*What did you learn through these exercises*