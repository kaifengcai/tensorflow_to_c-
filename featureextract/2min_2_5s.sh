#!/bin/sh
org_path=/media/mcc262/WD*Black/jin/game\_sports
des_path=/media/mcc262/WD*Black/jin/video5second

width=1920
height=1080 

cutlong=5
minFrames=90

for foldername in $(ls ${org_path})
do
	desFolder=${des_path}/${foldername}
	if [ ! -d ${desFolder} ] 
	then
		mkdir -p ${desFolder} 	
	fi	
	cd ${org_path}/${foldername}
	for filename in $(ls ${org_path}/${foldername}) 
	do		
		sequence=`echo $filename | cut -d . -f 1`
		fileInfo=`/media/mcc262/WD\ Black/jin/ffprobe -show_streams ${org_path}/${foldername}/${filename}`
		flag=0
		for line in $fileInfo
		do
		  key=`echo $line | cut -d = -f 1`
		  value=`echo $line | cut -d = -f 2`
		  if [ $key == 'codec_type' -a $value == 'video' ]
		  then
			flag=1
			continue
		  fi
		  if [ $flag == 1 -a $key == 'duration' ]
		  then
			frames=${value%.*}		  
			break
		  fi
		done
		echo ${frames}
		if [ $frames > $minFrames ]
		then
			ss=0
			starttime=0
			endtime=0
			/media/mcc262/WD\ Black/jin/ffmpeg -y -i ${org_path}/${foldername}/${sequence}.ts ${des_path}/${foldername}/${sequence}.yuv 
			while [ $(($ss+$cutlong)) -le $frames ]
			do
				let starttime=$ss
				let endtime=$ss+$cutlong		
				/media/mcc262/WD\ Black/jin/ffmpeg -y -r 1 -s 1920x1080 -i ${des_path}/${foldername}/${sequence}.yuv -ss $starttime -t $cutlong ${des_path}/${foldername}/${sequence}_${starttime}_${endtime}.yuv 
				let ss+=$cutlong
				echo ${starttime} ${endtime} 
			done
			rm ${des_path}/${foldername}/${sequence}.yuv 
		fi
	done
	cd ..
done

