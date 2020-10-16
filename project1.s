#base 28
#SHREESHAIL POKHAREL COMP ORG I
.data

inputText:.asciiz "Input: "
base28num:.space 11
newline:.asciiz "\n"
outputText: .asciiz "Output: "

.text

main:	
	#print input prompt Input: 
	li $s0, 0 
	li $v0, 4
	la $a0, inputText
	syscall
	#Get User input
	li $v0, 8						
	la $a0, base28num
	li $a1, 11
	syscall
    #load input to #s1
	la $s1, base28num
	addi $s4, $s1, 10 

Start:

	lb $a0, 0($s1) #get first character load the byte of first character
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
	
	bge $a0, $t5, Lowercase
	bgt $a0, $t4, Novalue
	bgt $a0, $t3, Uppercase
	bgt $a0, $t2, Novalue
	bge $a0, $t1, Numeric


Novalue:
	add $s0, $s0, $zero
	j Increment

Numeric:
	li $s2, -48	
	add $s3, $a0, $s2
	add $s0, $s0, $s3	
	j Increment

Uppercase:
	li $s2, -55	
	add $s3, $a0, $s2
	add $s0, $s0, $s3
	j Increment

Lowercase:
	li $s2, -87	
	add $s3, $a0, $s2
	add $s0, $s0, $s3
	j Increment

End:
	
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, outputText
	syscall

	li $v0, 1
	add $a0, $s0, $zero
	syscall
	
	li $v0, 10
	syscall
	
