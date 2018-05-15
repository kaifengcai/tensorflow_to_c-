#!/bin/sh
	#export LD_LIBRARY_PATH=/media/mcc262/WD*Black/jin/video5second/mv
org_path=/media/mcc262/WD*Black/jin/video2min
des_path=/media/mcc262/WD*Black/jin/video5second
cutlong=125
minFrames=2250
bin_postfix=bin
foldername='mv'

desFolder=${des_path}/${foldername}
#parameter for encode
IPeriod=125
framerate=25000
framenum=9999
pass=0
rcmode=3
bin_postfix=bin
dataFile=HW265_test_result.csv
featureFile=AvgFeatures.csv
width=1920
height=1080
cd /media/mcc262/WD*Black/jin/video5second/mv
for quality in 3
do
	filename1='Chillin_Like_a_Villain_(From_Descendants_2)_000_250_375.yuv'
	sequence1=${filename1%.*}
	echo ${sequence1}
	for crf in `seq 10 42`
	do
		./H265EncoderD -c encoder.cfg -quality_level $quality -rc $rcmode -crf $crf -pass $pass -fr $framerate -frames $framenum -w $width -h $height -keyInt $IPeriod -b ./${sequence1}_1920x1080_HW_Q${quality}_CRF${crf}.${bin_postfix} -i ./${sequence1}.yuv 1>./encod_${sequence1}__1920x1080_HW_Q${quality}_CRF${crf}.txt		
	done	
done				
let ss+=$cutlong
echo ${starttime} ${endtime}




