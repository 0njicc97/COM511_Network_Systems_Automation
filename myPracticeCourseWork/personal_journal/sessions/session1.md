[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md)

# Session 1

## Topics covered

*What topics were covered in this session*

  - Downloaded and installed VirtualBox, created a virtual machine from an ISO file, installed Vagrant, and installed Apache on Ubuntu/Linux.

## Personal Notes and research following this session

- Personal Research:

Researched the differences between Virtual Machines and Containers.
Investigated how Docker manages containers and networking.
Learned about Apache Web Server configuration and hosting websites.
Explored the use of Ansible inventories for managing multiple hosts.
Reviewed Git and GitHub workflows for version control and project management.


*Which class sessions and personal research refers to technology in this proposal. Link to examples.*
## Exercises and results

 - Technologies Used in This Proposal:

Git/GitHub - Source code management and version control.
Vagrant - Automated creation and management of virtual machines.
VirtualBox - Hypervisor used to run virtual machines.
Ansible - Configuration management and infrastructure automation.
Docker - Container creation and management.
Apache HTTP Server - Web server deployment.
Linux (Ubuntu) - Operating system used for server environments.



*What exercises did you complete. What results. Screen shots and notes*


- Installed Apache on the ubuntu machine by uncommenting the following line on the ubuntu vagrant file*:   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
  SHELL





&#x20; *# Enable provisioning with a shell script. Additional provisioners such as*

&#x20; *# Ansible, Chef, Docker, Puppet and Salt are also available. Please see the*

&#x20; *# documentation for more information about their specific syntax and use.*

&#x20;   *config.vm.provision "shell", inline: <<-SHELL*

&#x20;    *apt-get update*

&#x20;    *apt-get install -y apache2*

&#x20;  *SHELL*

*end

Last login: Fri Oct 30 05:27:09 2026 from 10.0.2.2*

*vagrant@vagrant:\~$ systemctl status apache2*

*● apache2.service - The Apache HTTP Server*

&#x20;    *Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)*

&#x20;    *Active: active (running) since Fri 2026-10-30 05:48:30 UTC; 55s ago*

&#x20;      *Docs: https://httpd.apache.org/docs/2.4/*

&#x20;  *Main PID: 2422 (apache2)*

&#x20;     *Tasks: 55 (limit: 3425)*

&#x20;    *Memory: 5.1M*

&#x20;       *CPU: 57ms*

&#x20;    *CGroup: /system.slice/apache2.service*

&#x20;            *├─2422 /usr/sbin/apache2 -k start*

&#x20;            *├─2423 /usr/sbin/apache2 -k start*

&#x20;            *└─2424 /usr/sbin/apache2 -k start*





* *Installed httpd on the Rocky machine using the command sudo yum -y install httpd. httpd is also know as apache on the Linux machine* 



*```*

&#x20;   default: C:/devel/COM511\_Network\_Systems\_Automation/myPracticeCourseWork/session1/vagrant-examples/bento/rockylinux-9.6 => /vagrant

PS C:\\devel\\COM511\_Network\_Systems\_Automation\\myPracticeCourseWork\\session1\\vagrant-examples\\bento\\rockylinux-9.6> vagrant ssh



This system is built by the Bento project by Chef Software

More information can be found at https://github.com/chef/bento



Use of this system is acceptance of the OS vendor EULA and License Agreements.

\[vagrant@localhost \~]$ sudo yum -y install httpd

Rocky Linux 9 - BaseOS                                                                   14 MB/s |  44 MB     00:03

Rocky Linux 9 - AppStream                                                                16 MB/s |  30 MB     00:01

Rocky Linux 9 - Extras                                                                   34 kB/s |  17 kB     00:00

Dependencies resolved.

========================================================================================================================

&#x20;Package                          Architecture          Version                          Repository                Size

========================================================================================================================

Installing:

&#x20;httpd                            x86\_64                2.4.62-13.el9\_8.9                appstream                 47 k

Installing dependencies:

&#x20;apr                              x86\_64                1.7.0-12.el9\_3                   appstream                122 k

&#x20;apr-util                         x86\_64                1.6.1-23.el9\_8.1                 appstream                 94 k

&#x20;apr-util-bdb                     x86\_64                1.6.1-23.el9\_8.1                 appstream                 12 k

&#x20;httpd-core                       x86\_64                2.4.62-13.el9\_8.9                appstream                1.4 M

&#x20;httpd-filesystem                 noarch                2.4.62-13.el9\_8.9                appstream                 14 k

&#x20;httpd-tools                      x86\_64                2.4.62-13.el9\_8.9                appstream                 81 k

&#x20;rocky-logos-httpd                noarch                90.17-1.el9                      appstream                 24 k

Installing weak dependencies:

&#x20;apr-util-openssl                 x86\_64                1.6.1-23.el9\_8.1                 appstream                 14 k

&#x20;mod\_http2                        x86\_64                2.0.26-6.el9\_8.2                 appstream                163 k

&#x20;mod\_lua                          x86\_64                2.4.62-13.el9\_8.9                appstream                 61 k



Transaction Summary

========================================================================================================================

Install  11 Packages



Total download size: 2.0 M

Installed size: 6.1 M

Downloading Packages:

(1/11): apr-util-bdb-1.6.1-23.el9\_8.1.x86\_64.rpm                                         53 kB/s |  12 kB     00:00

(2/11): apr-util-1.6.1-23.el9\_8.1.x86\_64.rpm                                            357 kB/s |  94 kB     00:00

(3/11): apr-1.7.0-12.el9\_3.x86\_64.rpm                                                   425 kB/s | 122 kB     00:00

(4/11): apr-util-openssl-1.6.1-23.el9\_8.1.x86\_64.rpm                                    226 kB/s |  14 kB     00:00

(5/11): httpd-2.4.62-13.el9\_8.9.x86\_64.rpm                                              1.2 MB/s |  47 kB     00:00

(6/11): httpd-filesystem-2.4.62-13.el9\_8.9.noarch.rpm                                   263 kB/s |  14 kB     00:00

(7/11): httpd-tools-2.4.62-13.el9\_8.9.x86\_64.rpm                                        1.1 MB/s |  81 kB     00:00

(8/11): mod\_http2-2.0.26-6.el9\_8.2.x86\_64.rpm                                           2.4 MB/s | 163 kB     00:00

(9/11): httpd-core-2.4.62-13.el9\_8.9.x86\_64.rpm                                         9.6 MB/s | 1.4 MB     00:00

(10/11): mod\_lua-2.4.62-13.el9\_8.9.x86\_64.rpm                                           1.1 MB/s |  61 kB     00:00

(11/11): rocky-logos-httpd-90.17-1.el9.noarch.rpm                                       689 kB/s |  24 kB     00:00

\------------------------------------------------------------------------------------------------------------------------

Total                                                                                   2.8 MB/s | 2.0 MB     00:00

Running transaction check

Transaction check succeeded.

Running transaction test

Transaction test succeeded.

Running transaction

&#x20; Preparing        :                                                                                                1/1

&#x20; Installing       : apr-1.7.0-12.el9\_3.x86\_64                                                                     1/11

&#x20; Installing       : apr-util-bdb-1.6.1-23.el9\_8.1.x86\_64                                                          2/11

&#x20; Installing       : apr-util-openssl-1.6.1-23.el9\_8.1.x86\_64                                                      3/11

&#x20; Installing       : apr-util-1.6.1-23.el9\_8.1.x86\_64                                                              4/11

&#x20; Installing       : httpd-tools-2.4.62-13.el9\_8.9.x86\_64                                                          5/11

&#x20; Installing       : rocky-logos-httpd-90.17-1.el9.noarch                                                          6/11

&#x20; Running scriptlet: httpd-filesystem-2.4.62-13.el9\_8.9.noarch                                                     7/11

&#x20; Installing       : httpd-filesystem-2.4.62-13.el9\_8.9.noarch                                                     7/11

&#x20; Installing       : httpd-core-2.4.62-13.el9\_8.9.x86\_64                                                           8/11

&#x20; Installing       : mod\_lua-2.4.62-13.el9\_8.9.x86\_64                                                              9/11

&#x20; Installing       : mod\_http2-2.0.26-6.el9\_8.2.x86\_64                                                            10/11

&#x20; Installing       : httpd-2.4.62-13.el9\_8.9.x86\_64                                                               11/11

&#x20; Running scriptlet: httpd-2.4.62-13.el9\_8.9.x86\_64                                                               11/11

&#x20; Verifying        : apr-1.7.0-12.el9\_3.x86\_64                                                                     1/11

&#x20; Verifying        : apr-util-1.6.1-23.el9\_8.1.x86\_64                                                              2/11

&#x20; Verifying        : apr-util-bdb-1.6.1-23.el9\_8.1.x86\_64                                                          3/11

&#x20; Verifying        : apr-util-openssl-1.6.1-23.el9\_8.1.x86\_64                                                      4/11

&#x20; Verifying        : httpd-2.4.62-13.el9\_8.9.x86\_64                                                                5/11

&#x20; Verifying        : httpd-core-2.4.62-13.el9\_8.9.x86\_64                                                           6/11

&#x20; Verifying        : httpd-filesystem-2.4.62-13.el9\_8.9.noarch                                                     7/11

&#x20; Verifying        : httpd-tools-2.4.62-13.el9\_8.9.x86\_64                                                          8/11

&#x20; Verifying        : mod\_http2-2.0.26-6.el9\_8.2.x86\_64                                                             9/11

&#x20; Verifying        : mod\_lua-2.4.62-13.el9\_8.9.x86\_64                                                             10/11

&#x20; Verifying        : rocky-logos-httpd-90.17-1.el9.noarch                                                         11/11



Installed:

&#x20; apr-1.7.0-12.el9\_3.x86\_64                  apr-util-1.6.1-23.el9\_8.1.x86\_64      apr-util-bdb-1.6.1-23.el9\_8.1.x86\_64

&#x20; apr-util-openssl-1.6.1-23.el9\_8.1.x86\_64   httpd-2.4.62-13.el9\_8.9.x86\_64        httpd-core-2.4.62-13.el9\_8.9.x86\_64

&#x20; httpd-filesystem-2.4.62-13.el9\_8.9.noarch  httpd-tools-2.4.62-13.el9\_8.9.x86\_64  mod\_http2-2.0.26-6.el9\_8.2.x86\_64

&#x20; mod\_lua-2.4.62-13.el9\_8.9.x86\_64           rocky-logos-httpd-90.17-1.el9.noarch



Complete!

\[vagrant@localhost \~]



```



* enable and start httpd using sudo systemctl enable httpd. This configure the apache web sever to start automatically when the VM boots and sudo systemctl start 

firewalld which start the Linux firewall.









## Summary of learning

*What did you learn through these exercises*



*Today I learned how to create a virtual machine (VM), install Vagrant, and use it to deploy and manage a VM. I also installed Apache (HTTP and HTTPS web server services) on an Ubuntu Linux virtual machine and configured a firewall to improve the server's security.*

