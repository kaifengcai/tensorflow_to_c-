#!/bin/sh
org_path=/media/mcc262/WD*Black/jin/video2min
des_path=/media/mcc262/WD*Black/jin/video5second

width=1920
height=1080

cutlong=125
minFrames=2250

for foldername in $(ls ${org_path})
do
	desFolder=${des_path}/${foldername}
	if [ ! -d ${desFolder} ] 
	then
		cd ${des_path}
		mkdir -p ${foldername} 		
	fi	
	cd ${org_path}/${foldername}
	for filename in $(ls ${org_path}/${foldername}) 
	do		
		sequence=`echo $filename | cut -d . -f 1`
		fileInfo=`../ffprobe -show_streams ${org_path}/${foldername}/${filename}`
		flag=0
		for line in $fileInfo
		do
		  key=`echo $line | cut -d = -f 1`
		  value=`echo $line | cut -d = -f 2`
		  if [ $key = 'codec_type' -a $value = 'video' ]
		  then
			flag=1
			continue
		  fi
		  if [ $flag = 1 -a $key = 'duration' ]
		  then
			frames=${value%.*}
			rate=25
			let frames=$rate*$frames
			echo frames=
			echo $frames		  
			break
		  fi
		done
		echo ${frames}
		if [ $frames -ge $minFrames ]
		then
			ss=0
			starttime=0
			endtime=0
			cd ${desFolder}
			../ffmpeg -y -i ${org_path}/${foldername}/${sequence}.ts ${des_path}/${foldername}/${sequence}.yuv 
			while [ $(($ss+$cutlong)) -le $frames ]
			do
				let starttime=$ss
				let endtime=$ss+$cutlong		
				../ffmpeg -y -r 1 -s 1920x1080 -i ${des_path}/${foldername}/${sequence}.yuv -ss $starttime -t $cutlong ${des_path}/${foldername}/${sequence}_${starttime}_${endtime}.yuv
				../ffmpeg -s 1920x1080 -pix_fmt yuv420p -i ${des_path}/${foldername}/${sequence}_${starttime}_${endtime}.yuv -f rawvideo -s 1280x720 ${des_path}/${foldername}/1280x720/${sequence}_${starttime}_${endtime}_1280x720.yuv
				../ffmpeg -s 1920x1080 -pix_fmt yuv420p -i ${des_path}/${foldername}/${sequence}_${starttime}_${endtime}.yuv -f rawvideo -s 854x480 ${des_path}/${foldername}/854x480/${sequence}_${starttime}_${endtime}_854x480.yuv
				../ffmpeg -s 1920x1080 -pix_fmt yuv420p -i ${des_path}/${foldername}/${sequence}_${starttime}_${endtime}.yuv -f rawvideo -s 480x270 ${des_path}/${foldername}/480x270/${sequence}_${starttime}_${endtime}_480x270.yuv
				let ss+=$cutlong
				echo ${starttime} ${endtime} 
			done
			rm ${des_path}/${foldername}/${sequence}.yuv 
		fi
	done
	cd ..
done

