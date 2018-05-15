#!/bin/sh
export LD_LIBRARY_PATH=./ 

if [ -e *.yuv ] 
then
    rm *.yuv	
fi

yuvDir=/opt/lanfujun/testSeq_2mins/YUVs
bin_postfix=bin
dataFile=HW265_test_result.csv
featureFile=AvgFeatures.csv

outDir=${yuvDir}/out
if [ ! -d ${outDir} ] 
then
    mkdir -p ${outDir} 	
fi

logDir=${yuvDir}/log
if [ ! -d ${logDir} ] 
then
    mkdir -p ${logDir} 	
fi

dataDir=${yuvDir}/data
if [ ! -d ${dataDir} ] 
then
    mkdir -p ${dataDir} 	
fi

#270P
resDir=270P
width=480
height=270
 
org_path=${yuvDir}/${resDir}

if [ ! -d ${outDir}/${resDir} ] 
then
    mkdir -p ${outDir}/${resDir} 	
fi
bin_path=${outDir}/${resDir}

if [ ! -d ${logDir}/${resDir} ] 
then
    mkdir -p ${logDir}/${resDir} 	
fi
log_path=${logDir}/${resDir}

pass=0
rcmode=3
for quality in 3
do
	for filename in $(ls ${org_path}) 
	do
		sequence=${filename%.*}
		echo ${sequence}
		IPeriod=125
		framerate=25000
		framenum=9999
		for crf in `seq 10 42`
		do
		./H265EncoderD -c encoder.cfg -quality_level $quality -rc $rcmode -crf $crf -pass $pass -fr $framerate -frames $framenum -w $width -h $height -keyInt $IPeriod -b ${bin_path}/${sequence}_HW_Q${quality}_CRF${crf}.${bin_postfix} -i ${org_path}/${sequence}.yuv 1>${log_path}/encod_${sequence}_HW_Q${quality}_CRF${crf}.txt		
		done
	done
done

if [ -e ${dataFile} ] 
then	
    mv ${dataFile} ${dataDir}/${dataFile%.*}_${width}x${height}.csv	
else
	echo "data file not found!!!"
fi

if [ -e ${featureFile} ] 
then	
    mv ${featureFile} ${dataDir}/${featureFile%.*}_${width}x${height}.csv	
else
	echo "feature file not found!!!"
fi

# 480P
resDir=480P
width=854
height=480

org_path=${yuvDir}/${resDir}

if [ ! -d ${outDir}/${resDir} ] 
then
    mkdir -p ${outDir}/${resDir} 	
fi
bin_path=${outDir}/${resDir}

if [ ! -d ${logDir}/${resDir} ] 
then
    mkdir -p ${logDir}/${resDir} 	
fi
log_path=${logDir}/${resDir}

pass=0
rcmode=3
for quality in 3
do
	for filename in $(ls ${org_path}) 
	do
		sequence=${filename%.*}
		echo ${sequence}
		IPeriod=125
		framerate=25000
		framenum=9999
		for crf in `seq 10 42`
		do
		./H265EncoderD -c encoder.cfg -quality_level $quality -rc $rcmode -crf $crf -pass $pass -fr $framerate -frames $framenum -w $width -h $height -keyInt $IPeriod -b ${bin_path}/${sequence}_HW_Q${quality}_CRF${crf}.${bin_postfix} -i ${org_path}/${sequence}.yuv 1>${log_path}/encod_${sequence}_HW_Q${quality}_CRF${crf}.txt		
		done
	done
done

if [ -e ${dataFile} ] 
then	
    mv ${dataFile} ${dataDir}/${dataFile%.*}_${width}x${height}.csv	
else
	echo "data file not found!!!"
fi

if [ -e ${featureFile} ] 
then	
    mv ${featureFile} ${dataDir}/${featureFile%.*}_${width}x${height}.csv	
else
	echo "feature file not found!!!"
fi


# 720P
resDir=720P
width=1280
height=720

org_path=${yuvDir}/${resDir}

if [ ! -d ${outDir}/${resDir} ] 
then
    mkdir -p ${outDir}/${resDir} 	
fi
bin_path=${outDir}/${resDir}

if [ ! -d ${logDir}/${resDir} ] 
then
    mkdir -p ${logDir}/${resDir} 	
fi
log_path=${logDir}/${resDir}

pass=0
rcmode=3
for quality in 3
do
	for filename in $(ls ${org_path})  
	do
		sequence=${filename%.*}
		echo ${sequence}
		IPeriod=125
		framerate=25000
		framenum=9999
		for crf in `seq 10 42`
		do
		./H265EncoderD -c encoder.cfg -quality_level $quality -rc $rcmode -crf $crf -pass $pass -fr $framerate -frames $framenum -w $width -h $height -keyInt $IPeriod -b ${bin_path}/${sequence}_HW_Q${quality}_CRF${crf}.${bin_postfix} -i ${org_path}/${sequence}.yuv 1>${log_path}/encod_${sequence}_HW_Q${quality}_CRF${crf}.txt		
		done
	done
done

if [ -e ${dataFile} ] 
then	
    mv ${dataFile} ${dataDir}/${dataFile%.*}_${width}x${height}.csv	
else
	echo "data file not found!!!"
fi

if [ -e ${featureFile} ] 
then	
    mv ${featureFile} ${dataDir}/${featureFile%.*}_${width}x${height}.csv	
else
	echo "feature file not found!!!"
fi


# 1080P
resDir=1080P
width=1920
height=1080

org_path=${yuvDir}/${resDir}

if [ ! -d ${outDir}/${resDir} ] 
then
    mkdir -p ${outDir}/${resDir} 	
fi
bin_path=${outDir}/${resDir}

if [ ! -d ${logDir}/${resDir} ] 
then
    mkdir -p ${logDir}/${resDir} 	
fi
log_path=${logDir}/${resDir}

pass=0
rcmode=3
for quality in 3
do
	for filename in $(ls ${org_path}) 
	do
		sequence=${filename%.*}
		echo ${sequence}
		IPeriod=125
		framerate=25000
		framenum=9999
		for crf in `seq 10 42`
		do
		./H265EncoderD -c encoder.cfg -quality_level $quality -rc $rcmode -crf $crf -pass $pass -fr $framerate -frames $framenum -w $width -h $height -keyInt $IPeriod -b ${bin_path}/${sequence}_HW_Q${quality}_CRF${crf}.${bin_postfix} -i ${org_path}/${sequence}.yuv 1>${log_path}/encod_${sequence}_HW_Q${quality}_CRF${crf}.txt		
		done
	done
done

if [ -e ${dataFile} ] 
then	
    mv ${dataFile} ${dataDir}/${dataFile%.*}_${width}x${height}.csv	
else
	echo "data file not found!!!"
fi

if [ -e ${featureFile} ] 
then	
    mv ${featureFile} ${dataDir}/${featureFile%.*}_${width}x${height}.csv	
else
	echo "feature file not found!!!"
fi


 LD_LIBRARY_PATH=
