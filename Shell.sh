#!/bin/bash

#echo "setting android home path"
#export ANDROID_HOME=/home/adt-bundle-linux-x86-20130522/sdk

EXPECTED_ARGS=1
if [ $# -ne $EXPECTED_ARGS ]
then
	echo "Tag missing - Usage: `basename $0` @tag"
	exit 65
fi


date +"%m-%d-%y-%T"
NOW=$(date +"%m-%d-%Y-%I-%M-%S")
mkdir -p Reports/${NOW}

SCENARIO_NAME=$1
echo ${SCENARIO_NAME}
echo "execution login scenarion"

#set the path to the application in the simulator folder
#export APP_BUNDLE_PATH="/Users/rucsandra.raduta/Library/Application Support/iPhone Simulator/6.1/Applications/B0C73DAA-4F5D-4220-AA11-6045EF1E744E/YouWowMeTC.app"


if [ -f ~/iOS-calabash/configure.sh ]
then
	echo "Configure file exists"
	source ~/iOS-calabash/configure.sh
else
	echo "Configure file does not exist. Please see Shell.sh comments. Exiting..."
  	exit 0
fi

echo "AppBundlePath:" $APP_BUNDLE_PATH

DEVICE=iphone OS=ios5 NO_LAUNCH=0 cucumber features/login.feature --tags ${SCENARIO_NAME} 

##DEVICE=iphone OS=ios5 NO_LAUNCH=1 cucumber features/login.feature --tags $@{SCENARIO_NAME} 

sleep 5
echo "moving screen shots from root folder to Result directory"
mv *.png Results/${NOW}
