.data
enter_n: .asciiz "Enter N: "

.text
li $v0, 4
la $a0, enter_n
syscall

li $v0, 5
syscall

move $t0, $v0
add $t0, $t0, 1
li $t1, 1

li $t2, 0

loop:
bge  $t1, $t0, exit
move $a0, $t1
jal compute2i
add $t1, $t1, 1
add $t2, $t2, $a0
j loop


exit:
li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall

compute2i:
li $t7, 1
li $t8, 0
another_loop:
beq $t8, $a0, end
mul $t7, $t7, 2
add $t8, $t8, 1
j another_loop

end:
move $a0, $t7
jr $ra

