#!/bin/bash
# Display my public IP address accoding to icanhazip.com

wget -qO - http://icanhazip.com
# q means "quiet" in this command, so you don't see all the junk

#curl icanhazip.com
#"curl" is a quick command for showing your public ip address as per the website