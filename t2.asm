.data
    msgBlackJack:    .string "\n=== BLACKJACK ===\n\n"
    msgJogadorRecebe:     .string "Player: "
    msgDealerRevela:      .string "Dealer: "
    msgCartaOculta:      .string " e uma carta oculta\n"
    msgMao:      .string "Sua mão: "
    simboloMais:        .string " + "
    simboloIgual:       .string " = "
    quebraLinha:      .string "\n"
    msgOpcoesJogo:     .string "\n(1 - Pedir Carta, 2 - Parar): "
    msgDealerRevelaMao:  .string "\nMão Dealer: "
    msgDealerPedeCarta: .string "\nDealer continua pedindo cartas...\n"
    msgDealerRecebe: .string "Dealer recebe: "
    msgCartasDealer:  .string "Dealer possui: "
    msgEstourou:      .string "\nVocê estourou! Dealer vence!! :(\n"
    msgDealerEstourou:      .string "\nDealer estourou! Você vence!! :)\n"
    msgVenceuCom: .string "\nVocê venceu com "
    msgDealerVenceuCom: .string "\nO dealer venceu com "
    msgConta:      .string " contra "
    simboloExclamacao:  .string "!\n"
    msgEmpate:      .string "\nEmpate! :|\n"
    msgJogarNovamente: .string "\nJogar novamente? (1 - Sim, 2 - Não): "
    msgValete:     .string "Valete"
    msgDama:       .string "Dama"
    msgRei:        .string "Rei"
    msgAs:         .string "As"

.text
.globl main
main:
    la a0, msgBlackJack
    li a7, 4
    ecall

    # Inicializa o estado do jogo
    li s0, 0       # Total do jogador
    li s1, 0       # Total do dealer
    li s6, 2       # Contador de cartas do jogador
    li s7, 0       # Zera contador de Ases do jogador
    li s8, 0       # Zera contador de Ases do dealer

inicio_jogo:
    # Primeira carta do jogador
    jal ra, hit
    mv s2, a0      # Salva primeira carta
    jal ra, calculo_total_jogador

    # Segunda carta do jogador
    jal ra, hit
    mv s3, a0      # Salva segunda carta
    jal ra, calculo_total_jogador

    # Mostra cartas do jogador
    la a0, msgJogadorRecebe
    li a7, 4
    ecall

    mv a0, s2
    jal ra, print_cartas

    la a0, simboloMais
    li a7, 4
    ecall

    mv a0, s3
    jal ra, print_cartas

    la a0, simboloIgual
    li a7, 4
    ecall

    mv a0, s0
    li a7, 1
    ecall

    la a0, quebraLinha
    li a7, 4
    ecall

    # Primeira carta do dealer
    jal ra, hit
    mv s4, a0      # Salva primeira carta do dealer
    jal ra, caluculo_total_dealer

    # Segunda carta do dealer (oculta)
    jal ra, hit
    mv s5, a0      # Salva segunda carta
    jal ra, caluculo_total_dealer

    # Mostra apenas primeira carta do dealer
    la a0, msgDealerRevela
    li a7, 4
    ecall

    mv a0, s4
    jal ra, print_cartas

    la a0, msgCartaOculta
    li a7, 4
    ecall

player_turno:
    la a0, msgOpcoesJogo
    li a7, 4
    ecall

    li a7, 5
    ecall

    li t0, 1
    beq a0, t0, jogador
    j dealer_turno

jogador:
    # Nova carta
    jal ra, hit
    mv t1, a0      # Salva carta recebida
    jal ra, calculo_total_jogador

    # Mostra carta recebida
    la a0, msgJogadorRecebe
    li a7, 4
    ecall

    mv a0, t1
    jal ra, print_cartas

    la a0, quebraLinha
    li a7, 4
    ecall

    # Mostra mão completa
    la a0, msgMao
    li a7, 4
    ecall

    # Mostra primeira carta
    mv a0, s2
    jal ra, print_cartas

    # Mostra segunda carta
    la a0, simboloMais
    li a7, 4
    ecall

    mv a0, s3
    jal ra, print_cartas

    la a0, simboloMais
    li a7, 4
    ecall

    mv a0, t1
    jal ra, print_cartas

    la a0, simboloIgual
    li a7, 4
    ecall

    mv a0, s0
    li a7, 1
    ecall

    la a0, quebraLinha
    li a7, 4
    ecall

    # Verifica se estourou
    li t0, 21
    bgt s0, t0, jogador_perdeu

    addi s6, s6, 1  # Incrementa contador de cartas
    j player_turno

jogador_perdeu:
    la a0, msgEstourou
    li a7, 4
    ecall
    j jogo_termina

dealer_turno:
    # Revela mão completa do dealer
    la a0, msgDealerRevelaMao
    li a7, 4
    ecall

    mv a0, s1
    li a7, 1
    ecall

    la a0, quebraLinha
    li a7, 4
    ecall

dealer:
    li t0, 17
    bge s1, t0, verifica_vencedor

    # Dealer pede carta
    la a0, msgDealerPedeCarta
    li a7, 4
    ecall

    jal ra, hit
    jal ra, caluculo_total_dealer

    la a0, msgCartasDealer
    li a7, 4
    ecall

    mv a0, s1
    li a7, 1
    ecall

    la a0, quebraLinha
    li a7, 4
    ecall

    # Verifica se dealer estourou
    li t0, 21
    bgt s1, t0, dealer_perdeu

    j dealer

dealer_perdeu:
    la a0, msgDealerEstourou
    li a7, 4
    ecall
    j jogo_termina

verifica_vencedor:
    bgt s0, s1, jogador_vence
    bgt s1, s0, dealer_vence
    j empate

jogador_vence:
    la a0, msgVenceuCom
    li a7, 4
    ecall

    mv a0, s0
    li a7, 1
    ecall

    la a0, msgConta
    li a7, 4
    ecall

    mv a0, s1
    li a7, 1
    ecall

    la a0, simboloExclamacao
    li a7, 4
    ecall
    j jogo_termina

dealer_vence:
    la a0, msgDealerVenceuCom
    li a7, 4
    ecall

    mv a0, s1
    li a7, 1
    ecall

    la a0, msgConta
    li a7, 4
    ecall

    mv a0, s0
    li a7, 1
    ecall
    
    la a0, simboloExclamacao
    li a7, 4
    ecall
    j jogo_termina

empate:
    la a0, msgEmpate
    li a7, 4
    ecall
    j jogo_termina

jogo_termina:
    la a0, msgJogarNovamente
    li a7, 4
    ecall

    li a7, 5
    ecall

    li t0, 1
    beq a0, t0, main
    li a7, 10
    ecall

# Função para dar carta (1-13)
hit:
    li a7, 42       # Número aleatório
    li a1, 13       # Limite superior
    ecall
    addi a0, a0, 1  # Intervalo 1-13

    # Converte valor para pontuação
    mv t6, a0       # Salva valor original

    # Verifica se é um Ás
    li t0, 1
    beq t6, t0, e_as

    # Verifica se é uma carta de figura (11, 12, 13)
    li t0, 10
    bgt t6, t0, realez

    # Se não é Ás nem figura, mantém o valor original
    mv a0, t6
    j fim_jogada

e_as:
    li a0, 11       # Ás começa valendo 11
    j fim_jogada

realez:
    li a0, 10       # Valete (11), Dama (12) e Rei (13) valem 10

fim_jogada:
    ret

# Função para ajustar o total do jogador
calculo_total_jogador:
    # Se for um Ás
    li t0, 11
    bne a0, t0, n_as_jogador
    addi s7, s7, 1      # Incrementa contador de Ases

n_as_jogador:
    add s0, s0, a0      # Adiciona valor ao total

    # Verifica se precisa ajustar Ases
    li t0, 21
as_jogador:
    ble s0, t0, termina_calculo_jogador  # Se total <= 21, não precisa ajustar
    beqz s7, termina_calculo_jogador     # Se não tem Ases, não pode ajustar
    addi s0, s0, -10    # Converte um Ás de 11 para 1 (reduz 10 pontos)
    addi s7, s7, -1     # Decrementa contador de Ases
    j as_jogador           # Continua ajustando se necessário

termina_calculo_jogador:
    ret

# Função para ajustar o total do dealer
caluculo_total_dealer:
    # Se for um Ás
    li t0, 11
    bne a0, t0, n_as_dealer
    addi s8, s8, 1      # Incrementa contador de Ases

n_as_dealer:
    add s1, s1, a0      # Adiciona valor ao total

    # Verifica se precisa ajustar Ases
    li t0, 21
as_dealer:
    ble s1, t0, termina_calculo_dealer   # Se total <= 21, não precisa ajustar
    beqz s8, termina_calculo_dealer      # Se não tem Ases, não pode ajustar
    addi s1, s1, -10    # Converte um Ás de 11 para 1 (reduz 10 pontos)
    addi s8, s8, -1     # Decrementa contador de Ases
    j as_dealer            # Continua ajustando se necessário

termina_calculo_dealer:
    ret

# Função para mostrar o nome da carta
print_cartas:
    mv t6, a0       # Salva o valor da carta

    # Se for Ás (11)
    li t0, 11
    beq t6, t0, as

    # Se for Valete (11)
    li t0, 11
    beq a0, t0, valete

    # Se for Dama (12)
    li t0, 12
    beq a0, t0, dama

    # Se for Rei (13)
    li t0, 13
    beq a0, t0, rei

    # Se for carta normal, mostra o número
    mv a0, t6
    li a7, 1
    ecall
    j fim_print_cartas

as:
    la a0, msgAs
    li a7, 4
    ecall
    j fim_print_cartas

valete:
    la a0, msgValete
    li a7, 4
    ecall
    j fim_print_cartas

dama:
    la a0, msgDama
    li a7, 4
    ecall
    j fim_print_cartas

rei:
    la a0, msgRei
    li a7, 4
    ecall

fim_print_cartas:
    ret
