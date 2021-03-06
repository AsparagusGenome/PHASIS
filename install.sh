#!/bin/bash

## Updated: version-v1.03 03/05/17 

printf "\nIn case of any issue at any point in PHASIS analyses, contact authors at:\n"
# printf "Atul Kakrana: kakrana@udel.edu\n"
printf "https://github.com/atulkakrana/phasis/issues\n\n"

#### Compile phasdetect #########

if [ -d ./__pycache__ ]; then
  rm -r __pycache__/ 
fi

if [ ! -f ./phasdetect.py ]
then
  printf "phasdetect source not found in current directory\n"
  printf "Please check that you downloaded complete archive\n"
  printf "Download complete package and rerun script\n\n"
  exit 1
else
  python3 -m py_compile phasdetect.py
  cd __pycache__ && mv phasdetect.*.pyc phasdetect 
  chmod u+x phasdetect && cp phasdetect ../
  printf "Done:      phasdetect\n"
  cd ..
  rm ./phasdetect.py
fi


#### Compile phasmerge #########

if [ -d ./__pycache__ ]; then
  rm -r __pycache__/ 
  # printf "Found\n"
  # exit 1
fi

if [ ! -f ./phasmerge.py ]
then
  printf "phasmerge source not found in current directory\n"
  printf "Please check that you downloaded complete archive\n"
  printf "Download complete package and rerun script\n\n"
  exit 1
else
  python3 -m py_compile phasmerge.py
  cd __pycache__ && mv phasmerge.*.pyc phasmerge 
  chmod u+x phasmerge && cp phasmerge ../
  printf "Done:      phasmerge\n"
  cd ..
  rm ./phasmerge.py
fi

#### Compile phastrigs #########

if [ -d ./__pycache__ ]; then
  rm -r __pycache__/ 
fi

if [ ! -f ./phastrigs.py ]
then
  printf "phastrigs source not found in current directory\n"
  printf "Please check that you downloaded complete archive\n"
  printf "Download complete package and rerun script\n\n"
  exit 1
else
  python3 -m py_compile phastrigs.py
  cd __pycache__ && mv phastrigs.*.pyc phastrigs 
  chmod u+x phastrigs && cp phastrigs ../
  printf "Done:      phastrigs\n"
  cd ..
  rm ./phastrigs.py
fi

#### Place core scripts ######

if [ -d ~/phasis ]
then
  rm -rf ~/phasis
  mkdir ~/phasis 
  # printf "file deleted\n"
else
  mkdir ~/phasis
fi

if [ ! -f ./phasclust.genome.v2.pl ]
then
  printf "phasis-core source not found in current directory\n"
  printf "Please check that you downloaded complete archive\n\n"
  printf "Download complete package and rerun script\n"
  exit 1
else
  cp phasclust.genome.v2.pl ~/phasis
  rm phasclust.genome.v2.pl
fi

if [ ! -f ./phasclust.MUL.v2.pl ]
then
  printf "phasis-core source not found in current directory\n"
  printf "Please check that you downloaded complete archive\n"
  printf "Download complete package and rerun script\n\n"
  exit 1
else
  cp phasclust.MUL.v2.pl ~/phasis
  rm phasclust.MUL.v2.pl
fi

if [ ! -f ./sPARTA.py ]
then
  printf "sPARTA source not found in current directory\n"
  printf "Please check that you downloaded complete archive\n"
  printf "Download complete package and rerun script\n\n"
  exit 1
else
  cp sPARTA.py ~/phasis
  rm sPARTA.py
fi

## Remove old folder
if [ -d ~/.phasis ]
then
  rm -r ~/.phasis 
  # printf "file deleted\n"
fi

mv ~/phasis ~/.phasis
printf "Done:      core scripts\n"

#### Clean up
if [ -d ./__pycache__ ]; then
  rm -r __pycache__/ 
fi
printf "Deleted:   source files\n"
#############################
printf "\nNote:'install.sh' cannot be re-used after a successful installation\n"
printf "Note: If installation fails, then recopy all files and try again\n"
printf "\nphasis suite is ready be used\n"
printf "See readme here: https://github.com/atulkakrana/phasis\n\n"

exit 1


### Change Log 
## V1.0 -> v1.01
## Edited names of phasis-core scripts
## v1.01 -> v1.02
## Added sPARTA script