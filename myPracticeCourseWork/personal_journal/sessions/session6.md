[Personal Learning Record](../../personal_journal/personal_journal.md) | [Session Notes](../sessions/README.md) 

# Session 6

## Topics covered
*What topics were covered in this session*
- I created an image using the command ` docker compose build` and install a software (apache web server) inside the image 
- I used the command ` docker compose up -d` to start the services within the container.


## Personal Notes and research following this session
*Which class sessions and personal research refers to technology in this proposal. Link to examples.*



## Exercises and results
*What exercises did you complete. What results. Screen shots and notes*

- I configure manage multiple container environment using docker compose. 

```

PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1> docker compose build
[+] Building 49.0s (8/8) FINISHED
 => [internal] load local bake definitions                             0.0s
 => => reading from stdin 730B                                         0.0s
 => [internal] load build definition from Dockerfile                   0.1s
 => => transferring dockerfile: 344B                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04        2.1s
 => [internal] load .dockerignore                                      0.1s
 => => transferring context: 2B                                        0.0s
 => [1/2] FROM docker.io/library/ubuntu:22.04@sha256:076e7bf82319619f  5.9s
 => => resolve docker.io/library/ubuntu:22.04@sha256:076e7bf82319619f  0.1s
 => => sha256:076e7bf82319619f28dd0aa9c02ab34b055ad37 6.69kB / 6.69kB  0.0s
 => => sha256:8a2321a92b438238f93b4346fff61bc4259c99fdd4d 424B / 424B  0.0s
 => => sha256:a7b0f6af325461862a99c677cf3229ca5241d9f 2.05kB / 2.05kB  0.0s
 => => sha256:0626d3cc316c9fea3d4891e2ec19b8f371fe2 29.75MB / 29.75MB  3.1s
 => => extracting sha256:0626d3cc316c9fea3d4891e2ec19b8f371fe22ffb915  2.4s
 => [2/2] RUN apt-get update && apt-get install -y apache2            36.9s
 => exporting to image                                                 2.7s
 => => exporting layers                                                2.6s
 => => writing image sha256:add5d05237aa6eca1661037e3a39115a792fe3cc9  0.0s
 => => naming to docker.io/library/my-apache2                          0.0s
 => resolving provenance for metadata file                             0.0s
[+] build 1/1
 ✔ Image my-apache2 Built                                              49.4s
PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1> docker compose ps
NAME      IMAGE     COMMAND   SERVICE   CREATED   STATUS    PORTS
PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1> docker compose up -d
[+] up 3/3
 ✔ Network example6-1_default Created                                   0.2s
 ✔ Container apache-2         Started                                   1.1s
 ✔ Container apache-1         Started                                   1.6s
PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1> docker compose ps
NAME       IMAGE        COMMAND                  SERVICE    CREATED          STATUS          PORTS
apache-1   my-apache2   "apachectl -D FOREGR…"   apache-1   19 seconds ago   Up 18 seconds   0.0.0.0:8081->80/tcp, [::]:8081->80/tcp
apache-2   my-apache2   "apachectl -D FOREGR…"   apache-2   19 seconds ago   Up 18 seconds   0.0.0.0:8082->80/tcp, [::]:8082->80/tcp
PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1> docker compose logs -f apache-1
apache-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.3. Set the 'ServerName' directive globally to suppress this message

PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1> docker compose down
[+] down 3/3
 ✔ Container apache-2         Removed                                   3.8s
 ✔ Container apache-1         Removed                                   3.6s
 ✔ Network example6-1_default Removed                                   0.3s
PS C:\devel\COM511_Network_Systems_Automation\myPracticeCourseWork\session6\docker-compose-examples\example6-1>

```


## Summary of learning
*What did you learn through these exercises*
