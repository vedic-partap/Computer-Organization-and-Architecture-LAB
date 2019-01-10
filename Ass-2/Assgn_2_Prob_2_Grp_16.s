 ########### Group 16, Ass. 2 ################
 ########### Rahul Kumar, Vedic Pratap #######
 
 ########### Data Segment ####################
 
 .data 
	msg_1:
		.asciiz "Enter first Number (Non Negative): "
	msg_2:
		.asciiz "Enter second Number (Non Negative): "
	error_msg:
		.asciiz "Invalid Number!! "
	output_msg:
		.asciiz "GCD of given two numbers is : "
	debug_msg:
		.asciiz "M here!!!!!!"

########### Code Segment #######################
	.text
	.globl main

main:
	la $a0, msg_1     
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	# Enter Second Number
	
	la $a0, msg_2     
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $s1, $v0
	
	# Sanity Check for 1st number
	add $a0, $s0, $zero
	jal check_non_negative_values
	
	# Sanity Check for 2nd number
	add $a0, $s1, $zero
	jal check_non_negative_values

	# Find GCD
	
	add $a0, $s0, $zero
	add $a1, $s1, $zero
	
	slt $s3, $s0, $s1
	beq $s3, $zero, swap_and_compute
	
	jal find_gcd

swap_and_compute:
	add $a3, $a0, $zero
	add $a0, $a1, $zero
	add $a1, $a3, $zero
	jal find_gcd
	j print_output
	
find_gcd:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	bne $a0, 0, recursion
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
recursion:                # gcd(a,b) = gcd(b%a, a), keeping
	add $t0, $a0, $zero
	rem $a0, $a1, $a0
	add $a1, $t0, $zero
	jal find_gcd
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_output:
	la $a0,output_msg 
	li $v0,4  #prints the string
	syscall
	move $a0,$a1 # Load the sum
	li $v0,1 
	syscall
	j Exit
	
check_non_negative_values:
	
	slt $s5, $a0, $zero
	beq $s5, 1, Error
	jr $ra
	
Error:

	la $a0, error_msg     
	li $v0, 4
	syscall
	j Exit

Exit:
	li $v0, 10
	syscall # exit