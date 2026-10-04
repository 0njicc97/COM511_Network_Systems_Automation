[Main Menu](../../../sessions/README.md) |[session2](../../session2/) | [Session 2 Notes](../docs/sessionNotes.md)

# Session 2 Notes - Automated provisioning of servers using Ansible

## Recap - vagrant provisioning

In [session1](../../session1/) we saw how we could quickly provision virtual machines for experiments using Vagrant.
We also saw how we could include bash command scripts to run after the machine was booted.
This allows us to add software to provisioned virtual machines for use in experiments.

You were left with an exercise to provision the Apache Web Server on a RHEL/Rocky Linux machine and on an Ubuntu machine.

Answers to this exercise are in [session2/vagrant-examples/example2-1](../../session2/vagrant-examples/example2-1).
Go through these examples and make sure you understand how the provisioning works.

## Provisioning multiple machines with shared keys and passwords and a host only network

So far we have relied on Vagrant to provision a `vagrant` user which can be used for login using `vagrant ssh`

The vagrant user has no password login and `vagrant ssh` relies on vagrant generated private keys placed in the `.vagrant` folder.

For our work going forwards, we will need to provision machines with additional users (`admin` and `ansible`) which can be accessed using passwords and SSH directly without Vagrant.

The machines provisioned so far have had only one `Network Interface Card (NIC)` which is connected to a `Network Address Translation (NAT)` network in VirtualBox. 

Virtual Box uses `Dynamic Host Control Protocol (DHCP)` to automatically allocate each virtual machine an IP address. 
VirtualBox translates that address into a mapped port on the host computer's network. 
This allows the virtual machine to talk to the Internet an but it does not allow the host or the Internet to connect directly to the virtual machine.

We will now create in each machine a second NIC connected to a `Host Only Network` which is directly connected to a virtual NIC in the host. 

Instead of using DHCP, vagrant will provision a static IP address for each machine so that we know which machine is mapped to which IP address.

We create new users with passwords and also corresponding private and public SSH keys to allow authentication between the machines using SSH.

Look at the exercises in  [session2/vagrant-examples/example2-2](../../session2/vagrant-examples/example2-2)  which provisions 3 machines.

|Name        |IP Address eth0                       | ip address eth1                 | Operating System            | Notes        |
|:-----------|:-------------------------------------|:--------------------------------|:----------------------------|:-------------|
|ansible-controller | DHCP<BR>Gateway              | 192.168.56.10 <BR>Gateway 192.168.56.1                         | Ubuntu 24.04                |              |
|ubuntu-1 | DHCP<BR>Gateway              | 192.168.56.20 <BR>Gateway 192.168.56.1                                   | Ubuntu 24.04                |              |
|rocky_1 | DHCP<BR>Gateway               | 192.168.56.30 <BR>Gateway 192.168.56.1                                   | Rocky linux 9.6           |              |
|host               | NAT<BR>Gateway               | 192.168.56.1                                | Windows               |              |
rockylinux-9.6

| User Name       | Password |
|:----------------|:------------|
| vagrant         | SSH Key Only (vagrant ssh)  |
| ansible         | SSH Key minad1234          |
| admin           | no SSH Key minad1234          |





