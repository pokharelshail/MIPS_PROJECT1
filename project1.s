#base 28 a-r
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
	
