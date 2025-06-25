.data
   prompt1: .asciiz "Enter num of 8 inch round pizzas sold: "
    prompt2: .asciiz "Enter the num of 12 inch square pizzas sold: "
    prompt3: .asciiz "Enter your estimated total pizzas sold in square feet: "
    result1: .asciiz "\nTotal sqft of all pizzas: "
    result2: .asciiz "\nTotal sqft of round pizzas: "
    result3: .asciiz "\nTotal sqft of square pizzas: "
    woosh:   .asciiz "\nWoosh!"
    bummer:  .asciiz "\nBummer!"
   pi:      .float 3.14159265
    eight:   .float 8.0
    two:     .float 2.0
    twelve:  .float 12.0

.text
.globl main

main:
    # input: 8" pizza
     li $v0, 4
     la $a0, prompt1
      syscall
    li $v0, 5
      syscall
    move $t0, $v0 

    # input: 12" pizza
    li $v0, 4
      la $a0, prompt2
    syscall
    li $v0, 5
     syscall
     move $t1, $v0  

    # input: estimate
    li $v0, 4
     la $a0, prompt3
    syscall
     li $v0, 6
    syscall
    mov.s $f4, $f0  

    # sqft 8"
    lwc1 $f0, pi
     lwc1 $f1, eight
      lwc1 $f2, two
    mul.s $f1, $f1, $f1 
     div.s $f1, $f1, $f2  
    mul.s $f1, $f1, $f0  
      mtc1 $t0, $f2
    cvt.s.w $f2, $f2
    mul.s $f5, $f1, $f2  
    
    # lw 144.0
     li $t3, 144
    mtc1 $t3, $f3
    cvt.s.w $f3, $f3
    
     div.s $f5, $f5, $f3  # sqin->sqft

    # sqft 12"
      li $t2, 144        
    mul $t2, $t2, $t1   
     mtc1 $t2, $f2
    cvt.s.w $f2, $f2
      div.s $f2, $f2, $f3  # sqin->sqft

    # total sqft
    add.s $f6, $f5, $f2  

    # Output
    li $v0, 4
     la $a0, result1
    syscall
    li $v0, 2
      mov.s $f12, $f6
    syscall

    li $v0, 4
     la $a0, result2
    syscall
    li $v0, 2
    mov.s $f12, $f5
     syscall

    li $v0, 4
    la $a0, result3
     syscall
    li $v0, 2
     mov.s $f12, $f2
      syscall

    # Compare
     c.lt.s $f6, $f4
    bc1t bummer_label

    # >= estimate, "Woosh!"
    li $v0, 4
    la $a0, woosh
    syscall
    j exit

bummer_label:
    # < estimate, "Bummer!"
     li $v0, 4
    la $a0, bummer
    syscall

exit:
    li $v0, 10
      syscall
