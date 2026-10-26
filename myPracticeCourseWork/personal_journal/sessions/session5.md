[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md) 

# Session 5

## Topics covered
*What topics were covered in this session*

docker and docker desktop

## Personal Notes and research following this session
*Which class sessions and personal research refers to technology in this proposal. Link to examples.*

running docker with the command docker run -it ubuntu:22.04.

docker run -it specifies to run an interactive terminal process in the container.

```
example5_1> docker run -it ubuntu:22.04
Unable to find image 'ubuntu:22.04' locally
22.04: Pulling from library/ubuntu
cf1a5487baaf: Pull complete
637115e4c229: Download complete
Digest: sha256:0a9887931b0e38af2e3487ed39e29436b0535c4f3f52e57745baaf79d1898956
Status: Downloaded newer image for ubuntu:22.04
root@6ec0f2f42be0:/# ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@6ec0f2f42be0:/#

```
Tried typing in the command ifconfig but it says command not found because I had not install the network tools so i used the command apt update and apt install net-tools to update and install the networking tools

```
root@6ec0f2f42be0:/# ipconfig
bash: ipconfig: command not found
root@6ec0f2f42be0:/# ifconfig
bash: ifconfig: command not found
root@6ec0f2f42be0:/# apt update
Get:1 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [7955 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/multivers

root@6ec0f2f42be0:/# apt install net-tools
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  net-tools
0 upgraded, 1 newly installed, 0 to remove and 3 not upgraded.
Need to get 204 kB of archives.
After this operation, 819 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 net-tools amd64 1.60+git20181103.0eebece-1ubuntu5.4 [204 kB]
Fetched 204 kB in 1s (338 kB/s)
debconf: delaying package configuration, since apt-utils is not installed

```





## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*

install and update the network tools to be able to see the IP address of the machine and interface eth0 IP address can be use to communicate with other containers when i type in the command ifconfig

```

root@6ec0f2f42be0:/# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 26:fe:87:39:c8:9f  txqueuelen 0  (Ethernet)
        RX packets 47077  bytes 67237109 (67.2 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 31807  bytes 2234451 (2.2 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        
```
Tried looking at the routing table with the command route -n
I find out the gate way address 172.17.0.1 is actually the address of the host machine on the docker network

```
root@8b8a21fd38d2:/# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.17.0.1      0.0.0.0         UG    0      0        0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0 0 

```

Tried to ping google.com with the command ping but it did not work because i had to install the ping so i used the command apt install iputils-ping to install ping 


```
root@8b8a21fd38d2:/# ping google.com
bash: ping: command not found
root@8b8a21fd38d2:/# apt install iputils-ping
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libcap2-bin libpam-cap
The following NEW packages will be installed:
  iputils-ping libcap2-bin libpam-cap
0 upgraded, 3 newly installed, 0 to remove and 3 not upgraded.
Need to get 77.0 kB of archives.
After this operation, 280 kB of additional disk space will be used.

```
Now ping google.com and it works

```

root@8b8a21fd38d2:/# ping google.com
PING google.com (142.250.129.138) 56(84) bytes of data.
64 bytes from 142.250.129.138 (142.250.129.138): icmp_seq=1 ttl=63 time=13.7 ms
64 bytes from 142.250.129.138 (142.250.129.138): icmp_seq=2 ttl=63 time=10.9 ms
64 bytes from 142.250.129.138 (142.250.129.138): icmp_seq=3 ttl=63 time=8.86 ms
^C
--- google.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 8.857/11.138/13.706/1.989 ms
root@8b8a21fd38d2:/# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.17.0.1      0.0.0.0         UG    0      0        0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 eth0

```

also ping the host machine interface eth0 IP adddress 172.17.0.1 successfull

```

root@8b8a21fd38d2:/# ping 172.17.0.1
PING 172.17.0.1 (172.17.0.1) 56(84) bytes of data.
64 bytes from 172.17.0.1: icmp_seq=1 ttl=64 time=0.081 ms
64 bytes from 172.17.0.1: icmp_seq=2 ttl=64 time=0.093 ms
^C
--- 172.17.0.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1028ms
rtt min/avg/max/mdev = 0.081/0.087/0.093/0.006 ms
root@8b8a21fd38d2:/# exit
exit
```
type in exit and leave the docker container returned to the host and this exit shut down and all the changes i made to the internals of the container are lost if the container is deleted so i used the command docker run -it -d. the -d will ensure the docker keep running even after i exit.

```
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker run -it -d ubuntu:22.04
aabbde5971c8034f8f6c3cdc8d076d32655eae46fcebb6484bb13469a8cb0aa2
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1>
```
docker ps use to show the containers that are running

```
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker ps
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS         PORTS     NAMES
aabbde5971c8   ubuntu:22.04   "/bin/bash"   11 seconds ago   Up 9 seconds             suspicious_booth
```
open an interactive terminal session in the running container using its ID

```
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker exec -it aabbde5971c8 bash
root@aabbde5971c8:/#

```

I exit the container from the terminal, it it is  still running. (check with docker ps)
 
```

root@aabbde5971c8:/# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug aabbde5971c8
    Learn more at https://docs.docker.com/go/debug-cli/
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker ps
CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS         PORTS     NAMES
aabbde5971c8   ubuntu:22.04   "/bin/bash"   2 minutes ago   Up 2 minutes             suspicious_booth

```

I stop or kill the container to shut it down using its id. (stop tries to do the shutdown gracefully before using kill which brutally shuts down the container - like turning off the power).

```

PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker kill aabbde5971c8

```

I try and install apache on the container

```
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker run -it
 -d -p 8081:80 --name ubuntu1 ubuntu:22.04
185f712e939186c7c424fae7179adbf8785b65ccd175c140363bae88baca6284
PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1>

```

 docker exec -it ubuntu1 bash : This command creates and starts a new Ubuntu 22.04 Docker container. The -it option provides an interactive terminal, -d runs the container in the background, --name ubuntu1 assigns an easy-to-remember name to the container, and -p 8081:80 maps port 8081 on the host computer to port 80 inside the container. Port mapping allows services running in the container to be accessed from the host machine

```

PS C:\devel\gitrepos\COM511_Network_Systems_Automation\myPracticeCourseWork\session5\vagrant-examples\example5_1> docker exec -it ubuntu1 bash
root@185f712e9391:/#

```

apt update : This command updates the package index inside the Ubuntu container. It downloads the latest information about available software packages from Ubuntu repositories, ensuring that the newest versions can be installed.

```
root@185f712e9391:/# apt update
Get:1 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [96.8 kB]

```

apt install apache2 : This command installs the Apache2 web server software inside the container. Apache is one of the most widely used web servers and will be used to host web pages within the Docker container.

```

root@185f712e9391:/# apt install apache2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils bzip2 ca-certificates
  file libapr1 libaprutil1 libaprutil1-dbd-sqlite3
  libaprutil1-ldap libbrotli1 libcurl4 libexpat1
  libgdbm-compat4 libgdbm6 libicu70 libjansson4 libldap-2.5-0
  libldap-common liblua5.3-0 libmagic-mgc libmagic1
  libnghttp2-14 libperl5.34 libpsl5 librtmp1 libsasl2-2
  libsasl2-modules libsasl2-modules-db libsqlite3-0 libssh-4
  libxml2 mailcap media-types mime-support netbase openssl
  perl perl-modules-5.34 publicsuffix ssl-cert xz-utils
Suggested packages:

```

service apache2 start : This command starts the Apache web server service. Once running, Apache begins listening on port 80 inside the container and can serve web pages to clients.

```

 *
root@185f712e9391:/# service apache2 start
 * Starting Apache httpd web server apache2
 *
 
 ```
 
 I test the access from the host machine by opening a browser and visit https://localhost:8080, The browser connects to port 8081 on the host computer. Docker forwards this traffic to port 80 in the container where Apache is running and it was a success
 
 Ubuntu Logo
Apache2 Default Page
It works!
This is the default welcome page used to test the correct operation of the Apache2 server after installation on Ubuntu systems. It is based on the equivalent page on Debian, from which the Ubuntu Apache packaging is derived. If you can read this page, it means that the Apache HTTP server installed at this site is working properly. You should replace this file (located at /var/www/html/index.html) before continuing to operate your HTTP server.

If you are a normal user of this web site and don't know what this page is about, this probably means that the site is currently unavailable due to maintenance. If the problem persists, please contact the site's administrator.

Configuration Overview
Ubuntu's Apache2 default configuration is different from the upstream default configuration, and split into several files optimized for interaction with Ubuntu tools. The configuration system is fully documented in /usr/share/doc/apache2/README.Debian.gz. Refer to this for the full documentation. Documentation for the web server itself can be found by accessing the manual if the apache2-doc package was installed on this server.

The configuration layout for an Apache2 web server installation on Ubuntu systems is as follows:


Had to install ifconfig to be able to find the ip address of the container

```

root@185f712e9391:/# apt install net-tools -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done

```

ifconfig: use to display the ip address 

```
root@185f712e9391:/# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 56:d0:07:bb:68:f5  txqueuelen 0  (Ethernet)
        RX packets 67203  bytes 95247405 (95.2 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 40220  bytes 2815798 (2.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        
```        






## Summary of learning
*What did you learn through these exercises*

In this lab, I learned how to use Docker Desktop to create and manage containers. I started an Ubuntu 22.04 container, accessed it through a terminal, and installed software using the apt package manager. I learned how to configure networking, check IP addresses and routing tables, and test connectivity using ping. I also installed and started the Apache web server inside a container and used port mapping to access the website from my host computer through a web browser. Finally, I learned how to manage containers using commands such as docker ps, docker exec, and docker stop.

