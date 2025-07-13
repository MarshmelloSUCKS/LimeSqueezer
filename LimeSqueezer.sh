#!/bin/bash

#  __    _           _____
# |  |  |_|_____ ___|   __|___ _ _ ___ ___ ___ ___ ___
# |  |__| |     | -_|__   | . | | | -_| -_|- _| -_|  _|
# |_____|_|_|_|_|___|_____|_  |___|___|___|___|___|_|
#                           |_|
#                                    by msx.gay
#
#    LimeSqueezer - a script to turn your perfect lossless
# CD collection into a hodgepodge pirated mess. Uses FFmpeg
# to compress your files based on randomly chosen profiles.
# Uses 64kbps-128kbps MP3 and 64kbps-128kbps WMA.
#
#   This script needs FFmpeg, basic GNU tools, and a bash
# shell to work. If needed, install ffmpeg using your
# distro's package manager.
#
#   To use, download LimeSqueezer.sh, place it in a folder
# with the music you intend to convert, mark the script as
# executable by running "chmod +x LimeSqueezer.sh", and
# execute using "./LimeSqueezer.sh".
#
# queer-coded in 2025 by msx.gay - http://msx.gay

#Print some kick-ass ASCII art
echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
echo " __    _           _____                             "
echo "|  |  |_|_____ ___|   __|___ _ _ ___ ___ ___ ___ ___ "
echo "|  |__| |     | -_|__   | . | | | -_| -_|- _| -_|  _|"
echo "|_____|_|_|_|_|___|_____|_  |___|___|___|___|___|_|  "
echo "                          |_|                        "
echo "                                   by msx.gay        "
echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "

#Start by asking the extension of the input files
read -p "Extension of the input files: ." in

#more kick-ass ASCII art
echo " - - - - - - - - - - - - - - - - - - - - - - - - - - -  "
echo " _____              _____                     _         "
echo "|   | |___ _ _ _   |   __|___ _ _ ___ ___ ___|_|___ ___ "
echo "| | | | . | | | |  |__   | . | | | -_| -_|- _| |   | . |"
echo "|_|___|___|_____|  |_____|_  |___|___|___|___|_|_|_|_  |"
echo "                           |_|                     |___|"
echo " - - - - - - - - - - - - - - - - - - - - - - - - - - -  "
sleep 0.5

#Make the directory for everything
mkdir Compressed

#Encoding profiles for ffmpeg to use
arr[0]="-ab 64k -ar 32000 -cutoff 14000 -compression_level 9"
arr[1]="-ab 64k -ar 32000 -cutoff 16000 -compression_level 9"
arr[2]="-ab 80k -ar 44100 -cutoff 15000 -compression_level 9"
arr[3]="-ab 80k -ar 44100 -cutoff 17000 -compression_level 9"
arr[4]="-ab 96k -ar 44100 -cutoff 18000 -compression_level 9"
arr[5]="-ab 96k -ar 44100 -cutoff 20000 -compression_level 9"
arr[6]="-ab 112k -ar 44100 -cutoff 18000 -compression_level 9"
arr[7]="-ab 112k -ar 44100 -cutoff 20000 -compression_level 9"
arr[8]="-ab 128k -ar 44100 -cutoff 20000 -compression_level 9"
arr[9]="-ab 128k -ar 48000 -cutoff 20000 -compression_level 9"
arr[10]="-ab 64k -ar 32000"
arr[11]="-ab 80k -ar 44100"
arr[12]="-ab 80k -ar 48000"
arr[13]="-ab 96k -ar 44100"
arr[14]="-ab 96k -ar 48000"
arr[15]="-ab 112k -ar 44100"
arr[16]="-ab 112k -ar 48000"
arr[17]="-ab 128k -ar 44100"
arr[18]="-ab 128k -ar 48000"

#The Cane's Sauce
for i in *.$in
do
    #Pick a profile
    rand=$[ $RANDOM % 15 ]

    #If the profile is greater than 9, use WMA. Else, use MP3
    ext=mp3
    if [ "$rand" -gt "9" ]; then
        ext=wma
    fi

    #Actually encode
    echo " - - - - - - - - - - - - - - - - - - - - - - - - "
    echo "Now squeezing: $i using ${arr[$rand]} as .$ext"
    echo " - - - - - - - - - - - - - - - - - - - - - - - - "
    ffmpeg -hide_banner -i "$i" -map 0:a ${arr[$rand]} "Compressed/${i%.*}.$ext"
done

#Give a parting message
echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  "
echo " _____                     _            _____               _     _       "
echo "|   __|___ _ _ ___ ___ ___|_|___ ___   |     |___ _____ ___| |___| |_ ___ "
echo "|__   | . | | | -_| -_|- _| |   | . |  |   --| . |     | . | | -_|  _| -_|"
echo "|_____|_  |___|___|___|___|_|_|_|_  |  |_____|___|_|_|_|  _|_|___|_| |___|"
echo "        |_|                     |___|                  |_|                "
echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  "
echo "Your files will be in Compressed/"
echo "thank you for using!!! ^.^"
