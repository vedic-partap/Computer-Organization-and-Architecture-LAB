# Vedic Partap 16CS10053
# Rahul Kumar 16CS10042
# ASUMPTION : F[0]=0, F[1]=1
############# Data ############
 .data
prompt:
	.asciiz "Enter the value of n (Non negative) : " 
newline:
	.asciiz "\n"
mess:
	.asciiz "The nth Fibonacci is : "
error:
	.asciiz "Invalid Number :( "
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
	
	# Check less than zero
	move $s1,$zero
	slt $s1, $t0, $zero 
	beq $s1,1, error_print
	
	#Store two number for the previous two values 
	li $s0,0
	li $s6, 1
	li $s4,1       #counter
	
	#Condition for the 0 and 1
	beq $t0,0,correct
	#beq $t0,1,correct
	beq $s1,$zero, Valid

# Instructions to be followed if the number is negative
error_print:
	la $a0,error  #load the error message
	li $v0,4  
	syscall
	beq $s1,$zero, Exit

# Instructions to be followed if the number is positive
Valid:
	beq $t0, $zero, correct #Condition to break the loop
	add $s5, $s6,$zero      # store s6 in temp variable
	add $s6,$s6,$s0         # add the previous two values
	move $s0,$s5            # restore s6 in s5
	sub $t0, $t0,$s4
	j Valid #LOOP
	
# Instructions to be followed for printing the result
correct:
	la $a0,mess #loads $a0 with the address 
	li $v0,4  #prints the string
	syscall
	move $a0,$s0
	li $v0,1 
	syscall
	j Exit
	
# Exit Intructions	
Exit:
	li $v0, 10
	syscall # exit
	