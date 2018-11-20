#!/bin/bash
#
# Will allow a user with sudo permission on a mac terminal to create an admin account
# Usage : 
#   name - the username on the account [TIP: placing a period before the username will hide the account from login prompts]
#   Real Name - User's Full Name
#   uniqueid - internal ID of this account [ Recommended to pick a number > 1005]
#   password - password used to access this account

name=$1
realName=$2
uid=$3
psswd=$4

if [ -z "${name}" ]; then
    echo "USAGE : permScript [name] ['Real Name'] [uniqueid] [password]"
else
	sudo dscl . -create /Users/${name}
	sudo dscl . -create /Users/${name} UserShell /bin/bash
	sudo dscl . -create /Users/${name} RealName "${realName}"
	sudo dscl . -create /Users/${name} UniqueID ${uid}
	sudo dscl . -create /Users/${name} PrimaryGroupID 1000
	sudo dscl . -create /Users/${name} NFSHomeDirectory /Local/Users/${name}
	sudo dscl . -passwd /Users/${name} ${psswd}
	sudo dscl . -append /Groups/admin GroupMembership ${name}

	echo "Account created."
fi
