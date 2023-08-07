#!/bin/bash

<< comment
If condition is ideally available in 3 formats :
  
    1) simple if
    2) If else  
    3) Else If   

1) Simple if :

 If [ expression ]; then
    
    commands

fi 
commands are going to be executed only if the commands are true

* what will happen if the expression are false ? simpme commands won't be executed


2) If-Else :

if [ expression ]; then 

  command 1

else 

   command 3

fi

* If expresssion is true, then command-1 will be executed. If the expression is not true, the command-2 will not be executed.

3) Else-If 

    if [ expression1 ] ; then
        
        command 1 

    elif [ expression2 ] ; then 

        command 2 
    
    elif [ expression3 ] ; then 

        command 3 
    
    else 
        
        command 4

    fi 

comment

# What is an expression ???  Whenever you're using Operators to perform something, that's referred as an expression.