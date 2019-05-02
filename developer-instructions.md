## Clone the repository
```
git clone https://github.com/computationalmystic/augur-group7.git
```
## Edit augur.config.json file to include these things:
```
    "GHTorrent": {

        "host": "classes.augurlabs.io",

        "name": "ghtorrent_minimal_16",

        "pass": "chucknorris!",

        "port": "3306",

        "user": "drew"

    },
```

## Decide how you want to run Augur:
* Vagrant VM (Mac)
* Amazon EC2 Instance (Mac or PC)

## Vagrant Setup:
* go to the vagrant website: https://www.vagrantup.com/
* download vagrant and install it on your computer
* go to the virtualbox website: https://www.virtualbox.org/
* download virtualbox and install it on your computer
* navigate to where you cloned your Augur repo
* Navigate to the augur directory:```cd augur```
* Start the Vagrant VM: ```make vagrant```
* Once vagrant has been provisioned, SSH into vagrant using: ```vagrant ssh```
* Once inside of vagrant use the command ```sudo su -``` to log in as root and then navigate to the augur directory in Vagrant using: ```cd /vagrant/augur```
* Install python packages: ```$AUGUR_PIP install --upgrade .```
* Make sure edit your code in augur.config.json ```vim augur.config.json```
* Start the frontend and backend server: ```make dev```
* In your url, go to ```http://localhost:3333```

## EC2 Instance Setup:
* Before you start, the version of Ubuntu that we used should be 16.04
* Connect to your EC2 instance: 
```chmod 400 <pemkey.pem>```
* ``` ssh -i <pemkey.pem> ec2-user@amazonhostname.com ```
* check python version by ```python --version```
* if not Install it by ```sudo apt-get install python3```
* ```sudo apt-get install python3-pip```
* Installing virtual environment ```sudo apt install virtualenv```
* ```virtualenv augur```
* ```virtualenv -p /usr/bin/python3 augur```
* Activate virtual env: ```source augur/bin/activate```
* Install NodeSource by: ```curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -```
* Install NodeJS by : ```sudo apt-get install -y nodejs```
* Install MariaDB by : ```sudo apt-get install -y mariadb-server```
* Clone our repository by: ```git clone https://github.com/computationalmystic/augur-group7.git```
* ```cd augur-group7```
* ```make install-dev```


* run the augur ```augur``` --update from here


* Edit augur.config.json ```vim augur.config.json```
* Start the frontend and backend server: ```make dev```
* In your url, go to ```http://localhost:3333```
