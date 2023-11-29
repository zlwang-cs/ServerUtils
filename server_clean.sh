#!/bin/bash

## Thanks to Chengyu Dong!

## define clean scope
dir='/data3/chengyu/checkpoints/'  # the target dir to clean, only dirs under this dir will be cleaned
pattern=".*adam.*_ad_.*"  # only dirs that match this regex pattern will be cleaned
files=(
	'model.*.pt'
	'best_model.pt'
        'checkpoint.pth.tar'
)  # only these files in the above dirs will be cleaned

cur=$(pwd)


## list all dirs under $dir
dirlist=$(find $dir -mindepth 1 -maxdepth 1 -type d)


## Search valid files
rmlist=()
for path in $dirlist; do
    if [[ ! "$path" =~ $pattern ]]; then
	continue
    fi
    echo "> "$path
    if [ ! -d "$path" ]; then
        echo 'not exists!'
        exit -1
    fi
    cd $path
    for ((j=0; j<${#files[@]}; j++));do
	for file in $(ls -l); do
	    if [[ $file =~ ${files[$j]} ]]; then
		echo '    '$file' '$(ls -lh $file | awk '{print$5}')
		rmlist+=($path"/"$file)
	    fi
	done
    done
    echo '    . '$(du -hd1 $path | tail -1 | awk '{print$1}')
    cd $cur
done


## Confirm
echo
if [ "${#rmlist[@]}" -ne 0 ]; then
    echo '> List of files to be removed:'
    du -ch ${rmlist[@]}
    total=$(du -ch ${rmlist[@]} | tail -1 | cut -f 1)
else
    echo '> No matched file found. Exited.'
    exit -1
fi


## Remove
echo
read -p "> Proceed to remove these files[y] or terminate[*]? " ans
case $ans in
    y )
	for file in ${rmlist[@]}; do
	    echo 'rm '$file
	    rm $file
	done
	echo "A total of $total files removed."
	;;
    * ) exit;;
esac