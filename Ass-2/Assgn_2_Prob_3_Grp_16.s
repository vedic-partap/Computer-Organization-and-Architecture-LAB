#GROUP NO. 16
#MEMBERS: Rahul Kumar (16CS10042)
#         Vedic Partap (16CS10053)

####################### Data segment ######################################
 .data
msg_input:   .asciiz "Enter 8 integers in an array: "
.align 2
array: .space 32
temp_array: .space 48
msg_sort:   .asciiz "\nThe sorted array is:. "
msg_unsort:   .asciiz "The unsorted array is: "
msg_err:   .asciiz "\nWrong Input "
newline:   .asciiz "\n"
space:    .asciiz " "
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
     main:	
     	jal form_array			#Entering elements in the array
     	
     	la $a0,msg_unsort		#Pritning the unsorted array
     	li $v0,4
     	syscall
     	jal print_array			
     	
     	add $a0, $zero, $zero		#Initial start index = 0
     	addi $a1, $zero, 28		#Initial end index = 7
     	jal merge_sort			#Merge Sort
     	
     	la $a0,msg_sort			#Printing the sorted array
     	li $v0,4
     	syscall
     	jal print_array
     	j Exit
     	
     	
     	print_array:  
     	add $t0,$zero,$zero		#Initialize counter by 0   	
     	again:
     	lw $a0,array($t0)		#Printing the elements
     	li $v0,1
     	syscall
        li  $v0, 4			#for print_str
        la  $a0, space			#preparing to print the space
        syscall				#print the space
        addi $t0,$t0,4
        beq $t0,32,not_again		#Run loop uptil end index
        j again
        not_again:
        jr $ra				#Return to the main function
         
      form_array:			#Taking inputs for array
     	add $t0,$zero,$zero		#Counter for number of elements
     	la $a0,msg_input		#Printing a string
     	li $v0,4
     	syscall
     	move $t1,$ra			#Storing return address in $t1
     	jal loop			#Looping to get the input
     	jr $t1 	   	
     loop:
     	beq $t0,32,done			#Exit Condition from the loop
     	li $v0,5			#Takin input from user
     	syscall
     	sw $v0,array($t0)		#Stpring the input in array[$t0]
     	addi $t0,$t0,4			#Update counter
     	j loop		
     done:  
     	jr $ra				#Return
         	
     merge_sort:			#Merge_Sort FUNCTION
     	addi $sp, $sp, -16		#Creating 16 byte space in stack
     	sw $ra, 12($sp)			#Storing return address
     	sw $a0, 8($sp)			#Storing start index
     	sw $a1, 4($sp)			#Storing end index
     	blt $a0, $a1, L1		#if(Start index < End index) goto L1 and perform task
     	addi $sp, $sp, 16		#else pop 4 elements from stack
     	jr $ra				#Return
     	L1:
     	lw $a0, 8($sp)			#Get the last(topmost block in stack) start index
     	lw $a1, 4($sp)			#Get the last(topmost block in stack) end index
     	srl $t3,$a0,2			##
     	srl $t4,$a1,2			###
     	add $a2,$t3,$t4			 ###Calculating the middle index
     	srl $a2,$a2,1			###
     	sll $a2,$a2,2			##
     	sw $a2, 0($sp)			#Storing the middle index
     	move $a1, $a2			#For the first half End index = Middle index
     	jal merge_sort			#Recurse Merge_Sort for the left half of the array
     	lw $a2, 0($sp)			#Get Middle index from stack
     	lw $a1, 4($sp)			#Get end index from stack
     	addi $a0, $a2, 4		#Start index = Middle index + 1
     	jal merge_sort			#Recurse Merge_Sort for the right half of the array
     	lw $a0, 8($sp)			#Load Starting index from stack
     	lw $a1, 4($sp)			#Load End index from stack
     	lw $a2, 0($sp)			#Load Middle index from stack
     	jal merge			#Call function Merge to merge the two half arrays
     	lw $ra, 12($sp)
     	addi $sp, $sp, 16		#Pop the elements, since array is merged
     	jr $ra
     	
     merge:				#Merge FUNCTION
     	move $s0, $a0			#int i = start index
     	move $s1, $a1			#int j = end index
     	move $s2, $a2			#int k = mid index
     	addi $s3, $s2, 4		#int l = mid index + 1
     	add $t7, $zero, $zero		#int a = 0
     	Loop:				#Run in while loop
     	bgt $s0, $s2, Insert_second_half#Until i <= k
     	bgt $s3, $s1, Insert_first_half#Until l <= j
     	lw $v0, array($s0)		#Load the values of the elements at index i and l
     	lw $v1, array($s3)
     	bgt $v0, $v1, Store		#if(array[i] > array[l])
     	sw $v0, temp_array($t7)		#if not, store array[i] in temp_array
     	addi $s0, $s0, 4		#i++
     	addi $t7, $t7, 4		#a++
     	j Loop
     	Store:
     	sw $v1, temp_array($t7)		#if the condition does not hold, store array[l] in temp_array
     	addi $s3, $s3, 4		#l++
     	addi $t7, $t7, 4		#a+++
     	j Loop
     	Insert_first_half:		#When all elements of second half of array is exhausted, enter remaining array elements in temp_array
     	Loop_first:			
     	bgt $s0, $s2, Common		#Loop until all elements of the half in exhausted
     	lw $v0, array($s0)
     	sw $v0, temp_array($t7)
     	addi $s0, $s0, 4
     	addi $t7, $t7, 4
     	j Loop_first
     	Insert_second_half:		#When all elements of first half of array is exhausted, enter remaining array elements in temp_array
     	Loop_second:
     	bgt $s3, $s1, Common		#Loop until all elements in the half is exhausted
     	lw $v1, array($s3)
     	sw $v1, temp_array($t7)
     	addi $s3, $s3, 4
     	addi $t7, $t7, 4
     	j Loop_second
     	Common:				#Now copy all the elements of temp_array to appropriate indices in array
     	move $s0, $a0			#Set i = start index
     	move $t7, $zero			#Set j = 0
     	Loop_common:
     	bgt $s0, $a1, Return		#if(start index > end index) return
     	lw $s7, temp_array($t7)		#array[i] = temp_array[j]
     	sw $s7, array($s0)
     	addi $t7, $t7, 4		#i++
     	addi $s0, $s0, 4		#j++
     	j Loop_common
     	Return:
     	jr $ra
     	
     Exit:
          li $v0, 10
          syscall # exit
          
####################### Text segment ######################################
