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



## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*
log in into the ansible controller using putty
use the vagrant up to get 3 machines running, that is the ansible_controller, the rock_1,and the ubuntu_1 machine
Because I had 3 main machines running in the same project, I specify which machine I was connected to using the vagrant ssh ansible_controller.
 As shown below, the 3 machines are up and running and I used the ansible controller to ssh into the ubuntu_1 and the rocky_1 machine


ansible_controller        running (virtualbox)
ubuntu_1                  running (virtualbox)
rocky_1                   running (virtualbox)
 



## Summary of learning
*What did you learn through these exercises*

I Learn how to ssh on different machines with the ansible_controller using the ssh ansible@192.168.56.20   to acces the  #ubuntu_1

ssh ansible@192.168.56.30   to acces the  #rocky_1

 
