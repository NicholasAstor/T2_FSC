.data
msgBemVindo: .string "Bem-vindo ao programa de teste de Assembly!\n"
msgMaoJogador: .string "Mão: "
msgVirgula: .string ","
msgFechaMaoJogador: .string "]"
msgAbreMaoJogador: .string "["
jogador: .space 40

.text
.globl main

main:
    li a7, 4 
    la a0, msgBemVindo
    ecall
    
    li a7, 4 
    la a0, msgMaoJogador
    ecall
    
    li a7, 4
    la a0, msgAbreMaoJogador
    ecall
    
    li a7, 42
    li a0, 0
    li a1, 13
    ecall
    
    addi a0, a0, 1
    
    li a7, 1
    ecall
    
    li a7, 4
    la a0,msgFechaMaoJogador
    ecall
    
    li a7, 4
    la a0, msgAbreMaoJogador
    ecall
    
    li a7, 42
    li a0, 0
    li a1, 13
    ecall
    
    addi a0, a0, 1
    
    li a7, 1
    ecall
    
    li a7, 4
    la a0,msgFechaMaoJogador
    ecall
fim:
    j fim