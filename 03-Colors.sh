#!/bin/bash

# Each and every color you see on terminal will have a color code and we need to use that code baesd on our need.

# Colors       Foreground          Background
# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46

# Syntax To Print Color Text Is :
# Ex : 
# echo -e "\e[COLORCODEm  Your Msg To Be Printed In Color \e[0m"

echo -e "\e[35Em I am printing Magneta Colour \e[0m"
echo -e "\e[31Em I am printing Red Colour \e[0m"
echo -e "\e[33Em I am printing Yellow Colour \e[0m"