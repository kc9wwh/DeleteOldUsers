#!/bin/sh

# Find Users Home Directories That Have Not Been Modifed in 90 Days
oldUsers=`find /Users -type d -mtime +90 -maxdepth 1 | cut -d"/" -f3`

# Lets not apply this to the local admin or Shared folder
for i in $oldUsers; do
if [[ $i = "admin" ]]; then next
elif [[ $i = "Shared" ]]; then next
else 

# Delete account
jamf deleteAccount -username $i -deleteHomeDirectory

# Delete Users Home Folder
rm -Rf /Users/$i

fi

done
exit 0
