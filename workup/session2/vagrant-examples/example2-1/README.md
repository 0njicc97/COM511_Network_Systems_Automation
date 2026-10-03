# Example 2-1

These two projects show how to set up the Apache web server on ubuntu and rocky linux (RHEL) servers using vagrant provisioning scripts.

[ubuntu-24.04](./ubuntu-24.04)

In ubuntu the apache package is called Apache2.
When it is installed it is enabled and started automatically.

port 80 in the VM is mapped to port 8080 on the guest.

The default index page can be accessed at http://localhost:8080

The vagrant provisioner script copies a new web page to the VM.

This page can be accessed at http://localhost:8080/examplewebpage.html


[rockylinux-9.6](./rockylinux-9.6)

Rocky linux is a bit more complicated.

In Rocky the apache package is called httpd

We need to explicitly start and enable the httpd server

We also need to open the firewall ports to allow port 80 through.

There is also a bug  which means that port 80 cannot be forwarded on the public network.
(see https://superusercom/questions/1224258/nat-port-forwarding-of-privileged-port-fails-when-using-vagrant-with-virtualbox)

So we create a host only virtual box network  with a fixed ip address which can be accessed from the host.

By default, the httpd installation does not provide an index.html page so we need to copy an index.html page into the VM.

THis can be accessed from the host at examplewebpage.html

