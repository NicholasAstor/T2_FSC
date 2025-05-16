

.data
# Mensagens
boas_vindas:      .string "\nBem-vindo ao Blackjack!\n"
jogar_novamente:  .string "\nDeseja jogar novamente? (1 - Sim, 2 - Nao): "
jogar:           .string "\n--- Jogando Blackjack ---\n"
cartas_iniciais: .string "\nVoce e o carteador receberam 2 cartas cada.\n"
cartas_jogador:  .string "\nVoce recebeu: "
cartas_carteador: .string "\nCarteador recebeu: "
nova_rodada:      .string "\n--- Nova Rodada ---\n"
mao_jogador:      .string "Sua mao: "
mao_carteador:    .string "Mao do carteador: "
oculta:           .string "[ ? ]"
soma:             .string " (Soma: " 
opcoes:           .string "\nO que voce deseja fazer? (1 - Hit, 2 - Parar): "
vitoria:          .string "\n*** Voce venceu! ***\n"
derrota:          .string "\n*** Carteador venceu! ***\n"
empate:           .string "\n*** Empate! ***\n"
rodada_finalizada: .string "\n--- Rodada finalizada ---\n"
obrigado:         .string "\nObrigado por jogar!\n"
erro:            .string "\nOpcao invalida! Tente novamente.\n"
erro_entrada:     .string "\nEntrada invalida! Tente novamente.\n"
vez_carteador:    .string "\n--- Vez do Carteador ---\n"
revela:           .string "Carteador revela a carta oculta: "
estourou:         .string " Estourou!"
blackjack:        .string " Blackjack!"
21:              .string " 21!"
21_carteador:     .string "Carteador tem 21!\n"
21_jogador:       .string "Voce tem 21!\n"
carteador_hit:    .string "carteador precisa pedir (< 17)...\n"
carteador_parar:  .string "Carteador para (>= 17).\n"
cartas:          .string "Cartas: "
cartas_jogador:   .string "Cartas do jogador: "
cartas_carteador: .string "Cartas do carteador: "
vez_jogador:      .string "\n--- Vez do Jogador ---\n"
recebeu:          .string "Voce recebeu: "


# Vetores das mãos
cartas_jogador:       .space 40  # até 10 cartas (1 word por carta)
cartas_carteador:        .space 40

num_cartas_jogador:   .word 0
num_cartas_carteador:    .word 0

soma_jogador:         .word 0
soma_carteador:          .word 0

ases_jogador:         .word 0
ases_carteador:          .word 0
