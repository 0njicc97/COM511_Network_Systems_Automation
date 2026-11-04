[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md) 

# Session 3

## Topics covered

*- I this lab, I install a dnsmasq on the ansible_controller to turn it into a DHCP/DNS server for the other machines on the dhcp_network


## Personal Notes and research following this session
*Which class sessions and personal research refers to technology in this proposal. Link to examples.*

- This session built on previous networking and Ansible labs. I researched how DHCP, DNS, MAC addresses, DHCP reservations, and DNSMasq work together to automate network configuration. I also explored how DHCP assigns IP addresses, how DNS resolves hostnames to IP addresses, and how Ansible can automate the deployment and management of these services across multiple machines.


## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*

- I Log into the ansible_controler (vagrant ssh ansible_controller), I change to the ansible user ( sudo su ansible), and ssh to the ansible_controller on address 192.168.100.254


```

vagrant@ansible-controller:~$ sudo su ansibe
su: user ansibe does not exist or the user entry does not contain all the required fields
vagrant@ansible-controller:~$ sudo su ansible
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ansible@ansible-controller:/home/vagrant$ ssh 192.168.100.254
The authenticity of host '192.168.100.254 (192.168.100.254)' can't be established.
ED25519 key fingerprint is SHA256:VjufUgJCRplYbNSq6ATc0g/DLpYxoTbOJ7Eaml2Enlc.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added '192.168.100.254' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Nov  2 03:39:32 PM UTC 2026

  System load:           0.06
  Usage of /:            16.2% of 30.34GB
  Memory usage:          30%
  Swap usage:            0%
  Processes:             139
  Users logged in:       1
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

ansible@ansible-controller:~$

```
- I set up a dnsmasq server on the ansible_controller so other machines connected to this network can obtain an IP address.

```
vagrant@ansible-controller:~$ sudo su ansible
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ansible@ansible-controller:/home/vagrant$ cd /vagrant/ansible/project-ansible3-1
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ ansible-playbook -i inventory/dev/hosts.ini setup-dnsmasq-server.yml
[WARNING]: Ansible is being run in a world writable directory (/vagrant/ansible/project-ansible3-1), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir

PLAY [Configure DHCP and DNS server] *******************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Host 'ansible-controller' is using the discovered Python interpreter at '/usr/bin/python3.12', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
ok: [ansible-controller]

TASK [dnsmasq-config : Install dnsmasq server packages] ************************
changed: [ansible-controller]

TASK [dnsmasq-config : remove systemd-resolved] ********************************
changed: [ansible-controller]

TASK [dnsmasq-config : Deploy dnsmasq.conf] ************************************
changed: [ansible-controller]

TASK [dnsmasq-config : Deploy DHCP reservations] *******************************
changed: [ansible-controller]

TASK [dnsmasq-config : Capture DHCP reservations] ******************************
changed: [ansible-controller]

TASK [dnsmasq-config : Display DHCP reservations to console] *******************
ok: [ansible-controller] => {
    "msg": [
        "# templates/dhcp-reservations.conf.j2",
        "# Static DHCP reservations",
        "dhcp-host=08:00:27:FF:FF:A1,192.168.100.254,ansible-controller",
        "dhcp-host=08:00:27:FF:FF:A2,192.168.100.10,ubuntu-1",
        "dhcp-host=08:00:27:FF:FF:A3,192.168.100.20,ubuntu-2"
    ]
}

TASK [dnsmasq-config : Deploy local DNS entries] *******************************
changed: [ansible-controller]

TASK [dnsmasq-config : Capture local DNS entries] ******************************
changed: [ansible-controller]

TASK [dnsmasq-config : Display local DNS entries to console] *******************
ok: [ansible-controller] => {
    "msg": [
        "# templates/local-dns.conf.j2",
        "# Local DNS entries from inventory",
        "address=/ansible-controller.lab.example.com/192.168.100.254",
        "address=/ansible-controller-eth1.lab.example.com/192.168.100.254",
        "address=/ubuntu-1.lab.example.com/192.168.100.10",
        "address=/ubuntu-1-eth1.lab.example.com/192.168.100.10",
        "address=/ubuntu-2.lab.example.com/192.168.100.20",
        "address=/ubuntu-2-eth1.lab.example.com/192.168.100.20",
        "",
        "# Additional DNS entries",
        "",
        "# CNAME aliases"
    ]
}

TASK [dnsmasq-config : Start Dnsmasq] ******************************************
changed: [ansible-controller]

RUNNING HANDLER [restart dnsmasq] **********************************************
changed: [ansible-controller]

PLAY RECAP *********************************************************************
ansible-controller         : ok=12   changed=9    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$

```

- I checked the status of the dnsmasq configurationand it was actively running. 

```

ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ sudo systemctl status dnsmasq
● dnsmasq.service - dnsmasq - A lightweight DHCP and caching DNS server
     Loaded: loaded (/usr/lib/systemd/system/dnsmasq.service; enabled; pres>
     Active: active (running) since Mon 2026-11-02 16:03:56 UTC; 6min ago
    Process: 4510 ExecStartPre=/usr/share/dnsmasq/systemd-helper checkconfi>
    Process: 4516 ExecStart=/usr/share/dnsmasq/systemd-helper exec (code=ex>
    Process: 4523 ExecStartPost=/usr/share/dnsmasq/systemd-helper start-res>
   Main PID: 4521 (dnsmasq)
      Tasks: 1 (limit: 1057)
     Memory: 892.0K (peak: 2.4M)
        CPU: 111ms
     CGroup: /system.slice/dnsmasq.service
             └─4521 /usr/sbin/dnsmasq -x /run/dnsmasq/dnsmasq.pid -u
             
```

I used the command sudo cat `/etc/dnsmasq.conf` to view the main configuration file of the dnsmasq

```
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ sudo cat /et
c/dnsmasq.conf
# templates/dnsmasq.conf.j2
# Managed by Ansible

# Interface binding
interface=eth1
bind-interfaces

# Domain
domain=lab.example.com
local=/lab.example.com/

# DHCP
dhcp-range=192.168.100.210,192.168.100.230,1h
dhcp-option=option:router,192.168.100.254
dhcp-option=option:dns-server,10.0.2.15
dhcp-option=option:domain-name,lab.example.com
dhcp-option=option:ntp-server,10.0.2.15
dhcp-authoritative

# removed dhcp-leasefile option to avoid permission issues with dnsmasq running as non-root user
# defaults to /var/lib/misc/dnsmasq.leases when not specified
#dhcp-leasefile=/var/lib/dnsmasq/dnsmasq.leases

# DNS
server=10.0.2.3
server=8.8.8.8

# Logging
log-dhcp
log-queries
log-facility=/var/log/dnsmasq.log

# Security
bogus-priv
domain-needed
no-resolv
no-poll

# Cache
cache-size=1000

# Include additional configs
conf-dir=/etc/dnsmasq.d/,*.conf
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$

```

- sudo cat `/etc/dnsmasq.d/reservations.conf` to see the DHCP reservations addresses.

```
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ sudo cat /et
c/dnsmasq.d/reservations.conf
# templates/dhcp-reservations.conf.j2
# Static DHCP reservations
dhcp-host=08:00:27:FF:FF:A1,192.168.100.254,ansible-controller
dhcp-host=08:00:27:FF:FF:A2,192.168.100.10,ubuntu-1
dhcp-host=08:00:27:FF:FF:A3,192.168.100.20,ubuntu-2
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$

```

- sudo cat /var/lib/misc/dnsmasq.leases to see current lease in the dnsmasq.lease file.
 
```

ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ sudo cat /var/lib/misc/dnsmasq.leases
1793639089 08:00:27:ff:ff:a3 192.168.100.20 ubuntu-2 ff:af:81:8f:7d:00:02:00:00:ab:11:ef:a3:68:52:42:2c:74:91
1793639068 08:00:27:ff:ff:a2 192.168.100.10 ubuntu-1 ff:af:81:8f:7d:00:02:00:00:ab:11:46:6d:e2:63:32:02:69:0b
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$

```
- I ssh into on of the clients machine and use the command `sudo nmap --script broadcast-dhcp-discover -e eth1` to test if the dhcp server will be able to issues and IP address to a new machine on its network and it was successful as shown below.

```
vagrant@ansible-controller:~$ ssh ansible@192.168.100.20
The authenticity of host '192.168.100.20 (192.168.100.20)' can't be established.
ED25519 key fingerprint is SHA256:VjufUgJCRplYbNSq6ATc0g/DLpYxoTbOJ7Eaml2Enlc.

nsible@ubuntu-2:~$ sudo su ansible
ansible@ubuntu-2:~$ sudo nmap --script broadcast-dhcp-discover -e eth1
Starting Nmap 7.94SVN ( https://nmap.org ) at 2026-11-02 16:36 UTC
Pre-scan script results:
| broadcast-dhcp-discover:
|   Response 1 of 1:
|     Interface: eth1
|     IP Offered: 192.168.100.215
|     DHCP Message Type: DHCPOFFER
|     Server Identifier: 192.168.100.254
|     IP Address Lease Time: 1h00m00s
|     Renewal Time Value: 30m00s
|     Rebinding Time Value: 52m30s
|     Subnet Mask: 255.255.255.0
|     Broadcast Address: 192.168.100.255
|     NTP Servers: 10.0.2.15
|     Domain Name: lab.example.com
|     Domain Name Server: 10.0.2.15
|_    Router: 192.168.100.254
WARNING: No targets were specified, so 0 hosts scanned.
Nmap done: 0 IP addresses (0 hosts up) scanned in 10.14 seconds
ansible@ubuntu-2:~$

```
- I went into the ansible file and modify the current ansible scripts to reload the DHCP clients automatically when an IP address is changed in the inventory. from the inventory, i change the client IP addresses on the DHCP server to see if the the clients machine will automatically update with the new IP addresses from the DHCP server as shown below.

```

ansible@ansible-controller:~$ cd /vagrant/ansible/project-ansible3-1
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ cat inventory/dev/hosts.ini
[dns_server]
ansible-controller  eth0_ip=                  eth0_mac=                     eth1_ip=192.168.100.254                 eth1_mac=08:00:27:FF:FF:A1    ansible_host=192.168.100.254    ansibleport=22

[hosts]
ubuntu-1            eth0_ip=                  eth0_mac=                     eth1_ip=192.168.100.10                  eth1_mac=08:00:27:FF:FF:A2    ansible_host=192.168.100.10   ansible_port=22
ubuntu-2            eth0_ip=                  eth0_mac=                     eth1_ip=192.168.100.20                  eth1_mac=08:00:27:FF:FF:A3    ansible_host=192.168.100.20   ansible_port=22
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ nano inventory/dev/hosts.ini

ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$ cat inventory/dev/hosts.ini
[dns_server]
ansible-controller  eth0_ip=                  eth0_mac=                     eth1_ip=192.168.100.254                 eth1_mac=08:00:27:FF:FF:A1    ansible_host=192.168.100.254    ansibleport=22

[hosts]
ubuntu-1            eth0_ip=                  eth0_mac=                     eth1_ip=192.168.100.40                  eth1_mac=08:00:27:FF:FF:A2    ansible_host=192.168.100.10   ansible_port=22
ubuntu-2            eth0_ip=                  eth0_mac=                     eth1_ip=192.168.100.30                  eth1_mac=08:00:27:FF:FF:A3    ansible_host=192.168.100.20   ansible_port=22
ansible@ansible-controller:/vagrant/ansible/project-ansible3-1$

```

- I run the playbook again to see if the reservation changes as shown below.

```

ok: [ansible-controller] => {
    "msg": [
        "# templates/dhcp-reservations.conf.j2",
        "# Static DHCP reservations",
        "dhcp-host=08:00:27:FF:FF:A1,192.168.100.254,ansible-controller",
        "dhcp-host=08:00:27:FF:FF:A2,192.168.100.40,ubuntu-1",
        "dhcp-host=08:00:27:FF:FF:A3,192.168.100.30,ubuntu-2"
        
```

 - I try to ssh into the client machine with the new address from the DHCP server it did not work because the client machine was still usig the old IP address and i needed to ssh into this machine with the old IP address and ran the command (`sudo dhcpclient -r eth1`) which will release the new IP address and i now used it to ssh into this client machines as shown below.
 
 ```
 vagrant@ansible-controller:~$ ssh ansible@192.168.100.10
ssh: connect to host 192.168.100.10 port 22: No route to host
vagrant@ansible-controller:~$ ssh ansible@192.168.100.40
The authenticity of host '192.168.100.40 (192.168.100.40)' can't be established.
ED25519 key fingerprint is SHA256:VjufUgJCRplYbNSq6ATc0g/DLpYxoTbOJ7Eaml2Enlc.
This host key is known by the following other names/addresses:




ansible@ubuntu-1:~$ ssh ansible@192.168.100.30
The authenticity of host '192.168.100.30 (192.168.100.30)' can't be established.
ED25519 key fingerprint is SHA256:VjufUgJCRplYbNSq6ATc0g/DLpYxoTbOJ7Eaml2Enlc.
This host key is known by the following other names/addresses:


 ```       


## Summary of learning
*What did you learn through these exercises*

- Through out this session, I learn how to use ansible to automate the installation and configuration of a dnsmasqserver. I configure the ansible controller to act as both the DHCP and DNS server, allowing client machines to automatically obtain IP address and resolve host names. I learn how DHCP reservation use MAC addresses to assign fixed IP addresses, how DNS record map host names to IP addresses, and how to verify active leases using the dnsmasq.lease file. I also tested DHCP functionality using Nmap and explore the challenge of automatically updating client IP addresses when DHCP reservation change.
