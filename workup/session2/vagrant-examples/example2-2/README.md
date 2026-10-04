# Example 2-2 Managing using ansible

create users with passwords and ssh keys

show how ssh keys work in ansible user

add ansible 

create controller, rocky ubuntu machines

```
vagrant status
Current machine states:

ansible_controller        running (virtualbox)
ubuntu_1                  running (virtualbox)
rocky_1                   running (virtualbox)
```

```
vagrant ssh ansible_controller # or ubuntu_1 or rocky_1

try 

ssh ansible@192.168.56.20    #ubuntu_1

ssh ansiblle@192.168.56.30    #rocky_1

in both cases asked for password  minad1234

now try SSH using keys

sudo su ansible

ssh 192.168.56.20    #ubuntu_1

ssh 192.168.56.30    #rocky_1
```

ansible examples 
1. ping machines
1. using passwords
2. using ssh keys
3. provision single machine with apache
4. provision 2 machines using choice of operating system

introduce inventory

introduce roles

introduce variables

