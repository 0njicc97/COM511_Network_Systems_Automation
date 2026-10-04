# README

To run this in virtual machine go to the location of project in the repo
(somewhat based on https://www.liquidweb.com/blog/install-ansible-almalinux/)


```
# become an ansible user 
sudo su ansible

cd /vagrant/ansible/project-ansible2-1

# run exercise
ansible -i inventory.ini all -m ping

```



