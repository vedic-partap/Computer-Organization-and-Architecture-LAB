#GROUP NO. 16
#MEMBERS: Rahul Kumar (16CS10042)
#         Vedic Partap (16CS10053)
#Assumptions: Araay indexing from 0.

####################### Data segment ######################################
 .data
msg_input:   .asciiz "Enter 8 integers (non decreasing) in an array: "
.align 2
array: .space 32
msg_arg:   .asciiz "The input is: "
msg_check:   .asciiz "Initial Check Passed. Array is sorted. "
msg_found:   .asciiz "Element found at index: "
msg_in_search:   .asciiz "Enter Element to be searched: "
msg_result:   .asciiz "The array is: "
msg_err:   .asciiz "\nInvalid Input "
newline:   .asciiz "\n"
space:    .asciiz " "

####################### Text segment ######################################
.text
.globl main
     main:	
     	jal get_array				#Taking array input
        jal check_ascending_array		#Sanity check
        li  $v0, 4				#for print_str
        la  $a0, newline 			
        syscall  				#print the newline
        la $a0,msg_check				#Printing "sanity check is done"
     	li $v0,4
     	syscall
        li  $v0, 4 
        la  $a0, newline			#Printing newline 
        syscall  
        jal bin_search 				#Calling binary search function
        j Exit
                 
     get_array:				#Taking array inputs
     	add $t0,$zero,$zero			#Initializing counter
     	la $a0,msg_input			#Printing a string
     	li $v0,4
     	syscall
     	move $t1,$ra				#Moving return address in $t1
     	jal loop
     	jr $t1 					#Returning from the function
     loop:
     	beq $t0,32,done				#Exit condition when all elements are taken as input
     	li $v0,5				#Reading integer element
     	syscall
     	sw $v0,array($t0)			#Storing the element in array[i]
     	addi $t0,$t0,4				#Counter++
     	j loop
     done:  
     	jr $ra					#Return
	
     check_ascending_array:			#Checking if array is sorted
     	add $t0,$zero,$zero			#Initializing counter
     	lw $a0,array($t0)			#Loading first array element from memory
     	Again:					
     	addi $t0,$t0,4				#Counter++
     	lw $a1,array($t0)			#Loading next array element from memory
     	bgt $a0,$a1,fail			#If prev. element > current element, Wrong input
     	move $a0, $a1				#prev. element = current element for next iteration
     	beq $t0,32,done				#Exit condition when all elements are compared
     	j Again
     	fail:
     	la $a0,msg_err				#Print error message
     	li $v0,4
     	syscall
     	j Exit
     	
     bin_search:				#binary_search label
        la $a0,msg_in_search				#Printing a string to take search element from user
     	li $v0,4
     	syscall
     	li $v0,5				#Reading search element
     	syscall
     	add $t0,$zero,$zero			#Initial Start index = 0
     	addi $t1,$zero,28			#Initial End index = 7 (since total elements is 8)
     	addi $s0,$zero,-1			#Initialize index for searched element to be -1
     	bin_loop:				#NOW RUN IN A LOOP	
     	bgt $t0,$t1,bin_fail  			#Break if start index > end index
     	srl $t3,$t0,2				##
        srl $t4,$t1,2				###
     	add $t2,$t3,$t4				 ###Get the middle index
     	srl $t2,$t2,1				###
     	sll $t2,$t2,2				##
     	lw $a1,array($t2)			#Check whether array[middle] == search element
     	beq $v0,$a1,bin_succ 			#if yes then goto success after saving index
     	blt $v0,$a1,bin_decr			#else if(search element < array[middle]), decrease end index
     	j bin_incr 				#     else increase start index
     	
     	
     bin_decr:
    	addi $t1,$t2,-4				#End index = middle index - 1
    	j bin_loop				
    		
     bin_incr:
    	addi $t0,$t2,4				#Start index = middle index + 1
    	j bin_loop				
     				
     bin_succ:
      	srl $t2,$t2,2				#Get index of the searched element, if found
      	la $a0,msg_found
        li $v0,4
        syscall	
        move $a0,$t2				#Printing the index
        li $v0,1
        syscall	
        j Exit
     	        
     bin_fail:			
     	la $a0,msg_found				#Printing element found at index -1 if not found
        li $v0,4
        syscall
        move $a0, $s0				#Storing -1 in $a0
        li $v0,1
        syscall	
     			
     Exit:
          li $v0, 10
          syscall # exit
           
