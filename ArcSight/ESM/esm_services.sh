#!/usr/bin/env bash

# Description = ArcSight ESM Services Manager
# Author = Anton Salim
# Date Created = 14 March 2021

name="ArcSight ESM Services Manager"
product="Product : ArcSight ESM"

echo "$name"
echo "$product"
echo -e "\n"
echo "1. Start all services"
echo "2. Stop all Services"
echo "3. Restart all services"
echo "4. Show services status"
echo "5. Restart a services"
echo "6. Exit"
echo -e "\n"
echo -n "Choose : "
read menu

while [[ -z $menu ]]; do
	echo "Please choose the options!"
	echo -e "\n"
	echo -n "Choose : "
	read menu
done

function start_services() {
	/etc/init.d/arcsight_services start all
	echo -e "\n"
}

function stop_services() {
	/etc/init.d/arcsight_services stop all
	echo -e "\n"
}

function restart_services() {
	/etc/init.d/arcsight_services restart all
	echo -e "\n"
}

function show_services() {
	/etc/init.d/arcsight_services status
	echo -e "\n"
}

function restart_service() {
	/etc/init.d/arcsight_services status
	echo "What service you want to restart?"
	echo -n "Please enter the service name :"
	read service
	/etc/init.d/arcsight_services restart $service
}

case $menu in
	1)
		echo -e "\n"
		start_services;;
	2)
		echo -e "\n"
		stop_services;;
	3)
		echo -e "\n"
		restart_services;;
	4)
		echo -e "\n"
		show_services;;
	5)
		echo -e "\n"
		restart_service;;
	6)
		exit;;
esac