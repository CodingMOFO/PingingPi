#!/bin/bash
echo "Creating config file..."

#TODO: validate input, sanitaize input if not already sanitized
echo "Enter the Dweet ID: "
read dweet_id

printf "dweet_id=${dweet_id}" > config.cfg

echo "Enter time intervals between pings in minutes (1-60): "
read png_inr

# Change directory to place where script was executed and then return path (&& is used that pwd runs after cd dirname
dir="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

command="bash ${dir}/pingingpi.sh"

if [ "$png_inr" -eq 0 ] 
then
	#TODO: disable pinging instead of pinging at reboot
	#job="@reboot $command"
	#Tmp case
	job="* * * * * $command"
	
elif [ "$png_inr" -gt 1 ] && [ "$png_inr" -lt 60 ] 
then
	job="*/${png_inr} * * * * $command"
elif [ "$png_inr" -eq 60 ] 
then
	job="0 * * * * $command"
else 
	job="* * * * * $command"
fi

echo "Adding to cron: ${job}"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -

echo -e "Done.\n"
echo "Don't worry if you made a mistake. Running this script again will override previous setup."
echo "You can set custom cronjob interval by running \"crontab -e\" command. Just find and edit following line: "
echo "$job"