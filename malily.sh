#!/bin/bash

RED='\033[0;31m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
GREY='\033[1;30m'
NC='\033[0m' # No Color


echo -e "${CYAN}What's your first name:${NC} "
read name

echo -e "${CYAN}Where did you grow up:${NC} "
read hometown

echo -e "${CYAN}How many siblings do you have:${NC} "
read siblings

echo -e "${CYAN}How old are you:${NC} "
read age

echo -e "${CYAN}What's your favorite movie:${NC} "
read movie

#generate random strings
generator=$(cat /dev/random | tr -dc "[:alpha:]" | head -c 8)
echo -e "Randomly generated string: ${RED}$generator${NC}"

datestamp=$(TZ=":US/Eastern" date +%m_%d_%Y)

echo -e "Today's date: ${RED}$datestamp${NC} "

echo "$name,$hometown,$siblings,$age,$movie,$generator,$datestamp" >> final.csv

###### Bonus: M ######
pretty_print() {
IFS=","
    while read name hometown siblings age movie generator datestamp
        do
            echo -e "${GREEN}\n\033[1m$name \e[0m${NC}\
            \n*************\
            \n${GREY}Hometown: ${GREEN}$hometown${NC}\
            \n${GREY}Number of Siblings: ${GREEN}$siblings${NC}\
            \n${GREY}Age: ${GREEN}$age${NC}\
            \n${GREY}Favorite Movie: ${GREEN}$movie${NC}\
            \n${GREY}Identifier: ${GREEN}$generator${NC}\
            \n${GREY}Date: ${GREEN}$datestamp${NC}\n"
        done < final.csv
}

echo -e "Would you like to print this CSV to the screen? ${RED}Y/N${NC}"
read print2screen

if [ $print2screen == "Y" ]; then
pretty_print
else
echo -e ${GREEN}"Okay, bye.${NC}"
fi
###### ######