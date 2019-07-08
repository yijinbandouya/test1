#!/bin/bash
options=(
    "push"
    "pull"
    "version_control"
    "compress&archive"
    "uncompress"
)
 
echo "Please select your option :"
select var in ${options[@]}
do
    if [ $var = "push" ]; then
        git add .
	git commit -m "update"
	git push
	break
    elif [ $var = "version_control" ]; then
        git log --pretty=oneline	
        echo -e "Please input the version number\n(note that you don't have to input the whole number, just a part of the sequence)"
        read vm
        git reset -hard $vm
        git push -f -u orgin master
	break
    elif [ $var = "pull" ]; then
        git pull
	break
    elif [ $var = "compress&archive" ]; then
	echo -n "please input the direct you want to compress"
	read div
	tar -jcvf $div.tar.bz2 $div
	rm -fr $div
	mv $div.tar.bz2 ./Archives
       break	
    elif [ $var = "uncompress" ]; then
	echo -n "please input the direct you want to uncompress"
	read div
	tar -jxvf $div.tar.bz2 
       break	    
    else
        echo "Try again!"
    fi
done
