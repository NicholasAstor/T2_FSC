.data
msgInicial: .string "----BLACKJACK----\n\n"
msgMaoJogador: .string "Mão: "
msgVirgula: .string ","
msgFechaMaoJogador: .string "]"
msgAbreMaoJogador: .string "["
msgSomaMaoJogador: .string " (Soma: "
msgFechaSoma: .string ")"
msgValorVisivel: .string " (Valor visível: "
msgCartaDealer: .string "\nCarta do Dealer: "
msgCompraFica: .string "\n(1) Comprar ou (2) Ficar?"
msgLimiteUltrapassado: .string "\nInforme alguma das opções disponíveis"
msgTemp: .string "Boa"
jogador: .space 40

.text
.globl main
# a2 -> primeira carta jogador
# a3 -> segunda carta jogador
# a4 -> primeira carta dealer
main:
    li a7, 4 # Printa mensagem inicial
    la a0, msgInicial
    ecall
    
    li a7, 4 # Printa mensaggem Mao jogador
    la a0, msgMaoJogador
    ecall
    
    li a7, 4 # Printa mensagem de abre mao jogador
    la a0, msgAbreMaoJogador
    ecall
    
    li a7, 42 # Gera um número inteiro aleatório dentro de um intervalo
    li a0, 0 # Index 
    li a1, 13 # Limite = [0, 12]

    ecall
    
    addi a0, a0, 1 # Limite agora = [1, 13]
    addi a2, a0, 0 # Armazena o valor da primeira carta do jogador no registrador 'a2'
    
    li a7, 1 # Printar o número inteiro que está em a0
    ecall
    
    li a7, 4 # Printa o outro ']' só pra ficar visualmente mais apresentável
    la a0,msgFechaMaoJogador
    ecall
    
    # Aqui só repito o mesmo processo para a outra carta do jogador
    li a7, 4 
    la a0, msgAbreMaoJogador
    ecall
    
    li a7, 42
    li a0, 0
    li a1, 13
    ecall
    
    addi a0, a0, 1
    addi a3, a0, 0 # Armazena o valor da segunda carta do jogador no registrador 'a3'
    
    li a7, 1
    ecall
    
    li a7, 4
    la a0,msgFechaMaoJogador
    ecall
    
    li a7, 4 # Printa a mensagem de soma das cartas do Jogador
    la a0, msgSomaMaoJogador
    ecall
    
    xor a0, a0, a0 # Zera o registrador a0
    add a0, a0, a2 # Armazena o valor de 'a2' em 'a0'
    add a0, a0, a3 # Soma com o valor de 'a3'
    
    
    li a7, 1 # Printa a soma de fato das cartas do jogador
    ecall
    
    li a7, 4 # Novamente outro print só para deixar o CLI mais agradável
    la a0, msgFechaSoma
    ecall
    
    li a7, 4 # Printa mensagem da carta do Dealer
    la a0, msgCartaDealer
    ecall 
    
    li a7, 4 # Vou reutilizar os prints do jogador
    la a0, msgAbreMaoJogador
    ecall
    
    li a7, 42 # Gera um número inteiro aleatório dentro de um intervalo
    li a0, 0 # Index 
    li a1, 13 # Limite = [0, 12]

    ecall
    
    addi a0, a0, 1 # Limite agora = [1, 13]
    addi a4, a0, 0 # Armazena o valor da primeira carta do dealer no registrador 'a4'
    
    li a7, 1 # Printar o número inteiro que está em a0
    ecall
    
    li a7, 4 # Printa o outro ']' só pra ficar visualmente mais apresentável
    la a0,msgFechaMaoJogador
    ecall
    
    li a7, 4 # Printa mensagem de valor visível do dealer
    la a0,msgValorVisivel
    ecall
    
    xor a0, a0, a0 # Zera o valor de a0
    add a0, a0, a4 # Armazena o valor de a4 em a0 (a4->a0)
    
    li a7, 1
    ecall
    
    li a7, 4 # Print pra bonito
    la a0,msgFechaSoma
    ecall
    
inicioLogica:     
  
    li a7, 4 # Print opções para o Usuário
    la a0, msgCompraFica
    ecall
     
    li a7, 5 # Espera uma resposta de inteiros
    ecall
    
    xor t1, t1, t1 # Tenho que zerar o t1 e o t2 pq se o usuário informar errado e voltar pra cá eles são podem somar a mais
    xor t2, t2, t2
    
    # if a0 > 2 tem que dar erro do mesmo jeito que if a0 < 1 também tem que dar 
    addi t1, t1, 1
    addi t2, t2, 2
    
    blt, t2, a0, limiteNumeroUltrapassado
    blt a0, t1, limiteNumeroUltrapassado
    
    j continuaLogica
    
limiteNumeroUltrapassado:
    li a7, 4
    la a0, msgLimiteUltrapassado
    ecall
    
    j inicioLogica
        
    # TODO: Acabar a lógica do player antes de ir pro Dealer
    
continuaLogica:
    li a7, 4
    la a0, msgTemp
    ecall
    
fim:
    j fim
