#base 28 
.data

inputText:.asciiz "Input: "
base28num:.space 11
space:.asciiz "\n"
outputText: .asciiz

.text
main:	
	#print input prompt Input: 
	li $s0, 0 
	li $v0, 4
	la $a0, inputText
	syscall
	
	li $v0, 8						
	la $a0, base28num
	li $a1, 11
	syscall

	la $s1, base28num
	addi $s4, $s1, 10 

Start:

	lb $a0, 0($s1)
	j GetValue

Increment:	
	beq $s4, $s1, End 
	addi $s1,$s1 1 #increment to next input character
	j Start

GetValue:	
	
	li $t1, 48 #numeric lower bound
	li $t2, 57 #numeric upper bound
	li $t3, 64 #base 28 lower bound letter A
	li $t4, 82 #base 28 upper bound letter R
	li $t5, 97 #base 28 lower bound letter a
	li $t6, 114 #base 28 upper bound letter r
	
	blt $a0, $t1, Novalue
	bgt $a0,$t6, Novalue
	ble $a0, $t6, more

more:

Novalue:
	add $s0, $s0, $zero
	j Increment

	
