.data
formula: .asciiz "5.4xy - 12.3y + 18.23x - 8.23\n"
enter_x: .asciiz "Enter x: "
enter_y: .asciiz "Enter y: "

first: .float 5.4
second: .float 12.3
third: .float 18.23
fourth: .float 8.23

.text

li $v0, 4
la $a0, formula
syscall


li $v0, 4
la $a0, enter_x
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 4
la $a0, enter_y
syscall

li $v0, 6
syscall
mov.s $f2, $f0


l.s $f5, first
l.s $f6, second
l.s $f7, third
l.s $f8, fourth

mul.s $f3, $f5, $f1
mul.s $f3, $f3, $f2

mul.s $f4, $f6, $f2

sub.s $f3, $f3, $f4

mul.s $f4, $f7, $f1

add.s $f3, $f3, $f4

sub.s $f3, $f3, $f8

li $v0, 2
mov.s $f12, $f3
syscall


li $v0, 10
syscall
