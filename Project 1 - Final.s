.data
buffer:
.space 160
.text
start:
li    $t1, 1
li    $t2, 4
sw    $t1, buffer($0)   # buffer[0] = 1
sw    $t1, buffer($t2)  # buffer[1] = 1
li    $t0, 8            # i = 2
loop: # do {
addi  $t3, $t0, -8
addi  $t4, $t0, -4
lw    $t1, buffer($t3)  # t1 = buffer[i-2]
lw    $t2, buffer($t4)  # t2 = buffer[i-1]
add   $t5, $t1, $t2
sw    $t5, buffer($t0)  # buffer[i] = buffer[i-1] + buffer[i-2]
addi  $t0, $t0, 4       # i++
blt   $t0, 160, loop    # } while (i < 40)
li    $v0, 1
move  $a0, $t0
syscall
jr    $ra
