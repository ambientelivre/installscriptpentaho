#!/bin/bash


VERSION='0.01'

echo
echo opensourcebi-installer
echo
echo Open Source Business Intelligence Installer version $VERSION
echo 
echo "Author: Marcio Junior Vieira (Ambiente Livre)"
echo "Copyright Ambiente Livre - 2012"
echo "http://www.ambientelivre.com.br" 
echo
echo 

use (){
	echo 
	echo "Use: biopensource-installer.sh -p PathtoInstall [-v version]"
	echo
	echo "-p    Path to Install Suite Complete (eg: /opt/pentaho )"
	echo "-v    version open source bi (eg: 3.10-stable, 3.9-stable, 3.10RC1 ) default is last version stable"
	echo "-h    show this help"
	echo
	exit 1
}


# Pentaho Data Integration 
downloadPDI(){
	rm -rf .tmp/pdi
	mkdir -p .tmp/pdi
	URL='http://sourceforge.net/projects/pentaho/files/Data%20Integration/4.2.1-stable/pdi-ce-4.2.1-stable.zip/download' 
	echo -n "Downloading Pentaho Data Integration... please wait..."
	wget --no-check-certificate $URL -P .tmp/pdi/ 	
	unzip .tmp/pdi/download.zip -d .tmp > /dev/null	
	echo "Done"
}


# Pentaho Business Intelligence Server 
downloadBIServer(){
	rm -rf .tmp/puc
	mkdir -p .tmp/puc
	URL='http://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/3.10.0-stable/biserver-ce-3.10.0-stable.tar.gz/download' 
	echo -n "Downloading Pentaho BI Server... please wait..."
	wget --no-check-certificate $URL -P .tmp/puc/ 	
	#unzip .tmp/puc/download.zip -d .tmp > /dev/null	
	echo "Done"
}



[ $# -gt 1 ] || use

while [ $# -gt 0 ]
do
    case "$1" in
	--)	shift; break;;
	-p)	PATH_DIR="$2"; shift;;
	-v)     VERSIONBI="$2"; shift;;
	--)	break;;
	-*|-h)	usage ;;
    esac
    shift
done


downloadPDI
downloadBIServer




