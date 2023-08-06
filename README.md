# Bash-Scripting

This repository contains all the basics needed to learn bash scripting and the major goal is to automate the entire configuration.
----------

## How to push the code to git hub ?

On your VS code open the folder (By using file option on your vs code or code folder name on your terminal )

$ git add .                // This will let Git to know to start tracking all the file //

$ git commit -m "Updated the Readme file"

$ gitpush                // This will push the code to repositary on git hub //

--------

### How to Open a folder on vs code with command

code folderName

This is a repository created to publish all the Bash Bascis and project automation

This repo is created to share all the linux basics
Along with Linux Bash Syntax
Then we will automate the infrastructure provisioning
And then Configuration Management.

### Folowing are the shell scripting topics which we will discuss as part of our project

1. SheBang Notation and Comments
2. Printing
3. Variables
    - Local Variables.
    - Environment Variables.
    - Command Substitution.
4. Inputs
    - Special Variables
    - Prompts
5. Functions
6. Redirectors & Quotes & Exit status 
7. Conditions
8. Loops
9. Basis of SED Command
10. Commands



### Expressions are categorized in to three

1. Numbers
2. Strings
3. Files

Operators on numbers:
-eq , -ne , -gt, -ge, -lt, -le

[ 1 -eq 1 ] 
[ 1 -ne 1 ]

Operators on Strings:

= , == , !=

    [ abc = abc ]

    -z , -n 

    [ -z "$var" ] -> This is true if var is not having any data
    [ -n "$var" ] _> This is true if var is having any data

    -z and -n are inverse proportional options


Operators on files:
    Lot of operators are available and you can check them using man pages of bash 

    [ -f file ] -> True of file exists and file is a regular file 

    [ -d xyz ]  -> True if file exists and it is a directory

    ### Explore the file types, There are 7 types on files in Linux.


COMMENT

ACTION=$1
 
if [ -z "$ACTION" ]; then 
    echo Argument is needed, Either start/stop
    
else 
    echo Thanks

fi  -->




# In Bash Scripting, even if the instruction x-fails, it just goes with the execution of other commands in sequence.
# That's the default behavior of BASH.
# If you don't want the script to proceeding further in case of any failure, you can use "set -e" in the beginning of the script.

