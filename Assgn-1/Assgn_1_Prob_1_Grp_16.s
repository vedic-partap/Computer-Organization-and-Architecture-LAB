 # Vedic Partap 16CS10053
 # Rahul Kumar 16CS10042
 ############# Data ############
 .data
prompt:
	.asciiz "Enter a Number (Non Negative) : "
newline:
	.asciiz "\n"
mess:
	.asciiz "The Sum of its digits is : "
error:
	.asciiz "Invalid Number!! "
############# Code ############	
	.text
	.globl main
main:
	la $a0,prompt #loads $a0 with the address 
	li $v0,4  #prints the string
	syscall

	li $v0,5  #reads first integer
	syscall
	move $t0, $v0 #result returned in $v0
	#Check if the number is less than zero or not 
	move $s1,$zero #initialize with zero
	slt $s1, $t0, $zero 
	beq $s1,1, error_print # print error mess for negative number 
	
	li $t2,0               # to store sum of digits
	li $a2, 10             
	beq $s1,$zero, Valid

# Instructions to be followed if the number is negative
error_print:
	la $a0,error # Load the error message
	li $v0,4  
	syscall
	j Exit

# Instructions to be followed if the number is positive
Valid:
	beq $t0, $zero, correct # Condition to break the loop
	rem $a3, $t0,$a2 # find the remainder 
	add $t2,$t2,$a3  # add the digit 
	div $t0, $t0,$a2 #find the Q.
	j Valid			 #Loop

# Instructions to be followed for printing the result	
correct:
	la $a0,mess 
	li $v0,4  #prints the string
	syscall
	move $a0,$t2 # Load the sum
	li $v0,1 
	syscall
	j Exit
	
# Exit Instructions	
Exit:
	li $v0, 10
	syscall # exit
	