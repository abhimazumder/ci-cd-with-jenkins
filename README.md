## Project Overview

### Tools Used

  1. GIT
  2. GitHub
  3. AWS
  4. Docker
  5. Jenkins

### Purpose
  
The purpose of this project is to checkout code from GitHub repository, clone it on a EC2 instance, build, test, make a Docker image, push it to Docker Hub and make a Docker container by pulling the same image. I have used a simple Python code <code>mathlib.py</code> with three functions (additon, subtraction and multiplication) and a test file <code>test_mathlib.py</code> to test the code. For this test project, we just run the python code to mock the build stage. After the build and test stages, we use the <code>Dockerfile</code> to create a Docker image, which we then push to our Docker Hub repository. The same image is then pulled to create a Docker container.

Docker Hub Repository - https://hub.docker.com/r/abhishekmazumder/myapp

To run the test file, I am using pytest to run the test file which in requires pip to be installed as a dependency. The following are the dependencies to be installed before build and test stage.

```
sudo apt-get -y install python3.8 python3-pip
python3 -m pip install --user --upgrade pip
pip install pytest
```

After installing dependencies, run the python file.

```
python3 mathlib.py
```

Run tests using pytest

```
python3 -m pytest -v test_mathlib.py
```

After being done with build and test, build a Docker image of the application <code>myapp</code> and push it to Docker Hub.

```
sudo docker build -t myapp .
sudo docker tag myapp abhishekmazumder/myapp:latest
sudo docker push abhishekmazumder/myapp:latest
```

Lastly, pull the Docker image and create a container.

```
sudo docker pull abhishekmazumder/myapp:latest
sudo docker run -d -it abhishekmazumder/myapp:latest
```

All of these stages would be performed using Jenkins by making a pipeline using the <code>Jenkinsfile</code>. 
  
### Steps
  
  1. Create a Ubuntu 20.22 EC2 instance on AWS.
  2. Log into the EC2 instance using PuTTY and .ppk (created while configuring EC2).
  3. Install GIT, Docker, JAVA 11 (openjdk-11) and Jenkins.
  4. Add <code>jenkins ALL=(ALL) NOPASSWD: ALL</code> to sudoers file to stop OS from asking password from jenkins user to run sudo commands.
  5. Modify Security Group in AWS EC2 instance, allowed access on port 8080 (to access Jenkins dashboard).
  6. Connect to Jenkins on port 8080 of EC2 Public IP and configure Jenkins initial setup.
  7. Make a GitHub repository and upload code.
  9. Create a scripted declarative pipeline and use it to build the code.

### References

1. https://www.softwaretestinghelp.com/pytest-tutorial/
2. https://sgoyal.net/2016/11/18/run-a-shell-from-jenkins-using-sudo-ubuntu/
