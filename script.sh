#!/bin/bash
directory=$1
type=$2
last=$3
if [ -z $directory ]
then
    echo "this command needs arguments"
    exit
elif [ ! -d $directory ]
then
    echo "directory not found"
    exit
else 
    if [ -z $type ]
    then
        echo "Missing argument 2"
        exit
    elif [ -z $last ]
        then
        echo "Missing argument 3"
        exit
    fi
    if [ $type == "ana" ]
    then
        find $directory -exec grep -i "$last" {} + | wc -l
        echo "Analysis is Successful"
    elif [ $type == "del" ]
    then
        find $directory -type f -size "+$last"k -delete
        echo "deletion is Successful"
    elif [ $type == "arr" ]
    then
    	file_name="NewDir"
        if [ ! -d $file_name ]
        then
            mkdir $file_name
        fi
        find $directory -type f -name "*.$last" -exec mv {} $file_name \;
        echo "Arrange is Successful"
    else
        echo "Operation is Wrong"

    fi
fi

