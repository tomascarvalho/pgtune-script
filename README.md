# pgtune auto install/run/restart DB script               Version 1.0   18/08/2015


GENERAL INFORMATION
-------------------

This is a bash script for Debian/Ubuntu that I made with the objective of automatically installing and running pgtune, in order to update your PostgreSQL database with the pgtune recommended settings. In the end this script will restart your PostgreSQL database.

WHAT DOES IT DO AND HOW DOES IT WORK
------------------------------------

To use the script just run the script as sudo and wait. That's it.
This is how it works:

- It starts by adding, in case they dont exist, the needed repositories to your /etc/apt/source.list file
- It then updates your apt-get 
- Download and installs pgtune (apt-get install pgtune)
- Gets your postgresql.conf file path
- Does a backup of said file
- Runs pgtune, outputing your new postgresql.conf
- Restarts your PostgreSQL database

HOW TO RUN THE SCRIPT
---------------------

- If you want to run this from a usb pendrive, remember to first mount your pen. You can do this by entering this line in the terminal, as super user:  mount -t auto /dev/sdb1 /mnt && ls /mnt   
and then    cd /mnt
- Run this script as super user: sh pgtunescript


THINGS YOU SHOULD KNOW
----------------------

- pgtune was created by Greg Smith. You can find a git repository about it at https://github.com/gregs1104/pgtune and a readme file at https://github.com/gregs1104/pgtune/blob/master/README.rst

- Anyone can use this script as they see fit. However, I only recommend you this script if you are new to databases or just in need for a fast database tune. 

- I haven't done enough testing to guarantee you that this script will work in every Ubuntu and Debian distro or in every PGSQL database. I tested the script in PGSQL 9.1, 9.3 and 9.4. This script will only work if you install PGSQL in the default /etc/postgresql/ path. 

CONTACT
-------

If you want to contact me send me a mail to tmdcc(at)student.dei.uc.pt in English or Portuguese.
