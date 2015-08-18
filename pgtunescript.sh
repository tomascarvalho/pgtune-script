#!/bin/bash							
clear								# Debian: su then sh ./script
								# Ubuntu: sudo ./script

echo "Starting!"						# the objective of this script
echo								# automatically install and run
								# pgtune to tune your postgresql db		
								
echo "This Script will install and run PGTune"			# pgtune was created by Greg Smith
echo "in order to tune your PostgreSQL DataBase"		# this script was put together by
echo "When all is done, PostgreSQL will be restarted"		# Tomás Carvalho

sleep 6
clear

echo "Adding needed repositories to /etc/apt/sources.list file"	# repositories needed to install pgtune
sleep 2

FILENAME="deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free"

if grep -Fx "$FILENAME" /etc/apt/sources.list			# if your system is failling to install pgtune
								# because apt-get install pgtune isn't working
								# put the functions outside the if/fi condition
then
	echo "deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free" >> /etc/apt/sources.list
	echo "deb-src http://ftp.us.debian.org/debian/ wheezy main contrib non-free" >> /etc/apt/sources.list
	echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list#
	echo "deb-src http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources-.list
	echo "deb http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list
	echo "deb http://ftp.us.debian.org/debian/ wheezy-proposed-updates contrib non-free main" >> /etc/apt/sources.list
	echo "deb http://ftp.debian.org/debian/ wheezy-backports main" >> /etc/apt/sources.list
	echo "deb-src http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list
	echo "deb http://ftp.us.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
else
    	echo "Repositories already exist"
	sleep 4
fi


echo
echo "Running apt-get update do make sure everything needed is up to date"
sleep 5
apt-get update							# make sure everything is updated

echo
echo "-----Installing pgtune-----"				
sleep 5
apt-get install pgtune						# download and installs pgtune
sleep 4
clear

echo "-----Running pgtune------"
echo
sleep 3

echo "Getting location of postgresql"
echo
sleep 3

INPUTFILE=$(find /etc/postgresql -name "postgresql.conf")	# gets the correct path to the
INPUTFILE="$INPUTFILE"                        			# postgresql.conf file
PGTUNE=".pgtune"
BACKUP=".backup"
OUTPUTFILE=$INPUTFILE$PGTUNE					# makes the paths to the new files
BACKUPFILE=$INPUTFILE$BACKUP					# that the script will create

echo "Paths: "
echo "$INPUTFILE"
echo "$OUTPUTFILE"
echo "$BACKUPFILE"
echo

pgtune -i "$INPUTFILE" -o "$OUTPUTFILE"				# takes as input the postgresql.conf
								# file and outputs 
								# postgresql.conf.pgtune
echo
mv "$INPUTFILE" "$BACKUPFILE"					# creates a backup file from the
								# original settings file saving it
								# as postgresql.conf.backup and
								# deletes the original file

mv $OUTPUTFILE $INPUTFILE					# creates the new postgresql.conf
								# file using postgresql.conf.pgtune
								# settings and deletes this file

								echo
echo "Postgresql is now going to restart"			# restarts postgresql to apply
service postgresql restart					# the changes
echo
echo
echo

