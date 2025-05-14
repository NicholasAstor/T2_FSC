import java.util.*;

public class Blackjack { //não vou comentar esse código aqui pq com os prints da pra entender tudo
    private Scanner scanner;
    private Baralho baralho;
    private Jogador jogador;
    private Dealer dealer;

    public Blackjack() {
        scanner = new Scanner(System.in);
        baralho = new Baralho();
        jogador = new Jogador();
        dealer = new Dealer();
    }

    public void inicia() {
        System.out.println("Blackjack!");

        while (true) {
            iniciaRodada();

            System.out.print("Deseja jogar novamente? (s/n): ");
            String resposta = scanner.nextLine().trim().toLowerCase();
            if (!resposta.equals("s")) {
                System.out.println("Obrigado por jogar!");
                break;
            }
        }
        scanner.close();
    }

    private void iniciaRodada() {
        System.out.println("\n-----NOVA RODADA-----");

        jogador.limparMao();
        dealer.limparMao();

        jogador.receberCarta(baralho.hit());
        dealer.receberCarta(baralho.hit());
        jogador.receberCarta(baralho.hit());
        dealer.receberCarta(baralho.hit());

        System.out.println("\nMão: " + jogador.getMao() + " (Valor: " + jogador.getMao().calcularValor() + ")");
        System.out.println("Carta do dealer: " + dealer.getCartaVisivel() + " (Valor visível: " + dealer.getCartaVisivel().getPontos() + ")");

        boolean jogadorEstourou = turnoJogador();

        if (jogadorEstourou) {
            return;
        }

        boolean dealerEstourou = turnoDealer();

        System.out.println("Mão final do dealer: " + dealer.getMao() + " (Valor: " + dealer.getMao().calcularValor() + ")");

        if (dealerEstourou) {
            System.out.println("Dealer estourou! GG!");
        } else {
            int valorJogador = jogador.getMao().calcularValor();
            int valorDealer = dealer.getMao().calcularValor();

            if (valorJogador > valorDealer) {
                System.out.println("Venceu!");
            } else if (valorDealer > valorJogador) {
                System.out.println("Perdeu!");
            } else {
                System.out.println("Empate!");
            }
        }
    }

    private boolean turnoJogador() {
        boolean continuar = true;

        while (continuar) {
            System.out.print("\n(1) Comprar ou (2) Ficar? ");
            System.out.println("\n========================================================");
            String escolha = scanner.nextLine().trim();

            if (escolha.equals("1")) {
                Carta novaCarta = baralho.hit();
                jogador.receberCarta(novaCarta);

                System.out.println("Você comprou: " + novaCarta);
                System.out.println("Mão: " + jogador.getMao() + " (Valor: " + jogador.getMao().calcularValor() + ")");
                System.out.println("\n========================================================");

                if (jogador.getMao().calcularValor() > 21) {
                    System.out.println("Você estourou!");
                    return true;
                }
            } else if (escolha.equals("2")) {
                continuar = false;
            } else {
                System.out.println("Escolha inválida.");
            }
        }

        return false;
    }

    private boolean turnoDealer() {
        System.out.println("\nVez do dealer");
        System.out.println("Mão do dealer: " + dealer.getMao() + " (Valor: " + dealer.getMao().calcularValor() + ")");
        System.out.println("\n========================================================");

        while (dealer.getMao().calcularValor() < 17) {
            Carta novaCarta = baralho.hit();
            dealer.receberCarta(novaCarta);

            System.out.println("Dealer comprou: " + novaCarta);
            System.out.println("Mão do dealer: " + dealer.getMao() + " (Valor: " + dealer.getMao().calcularValor() + ")");
            System.out.println("\n========================================================");
        }

        return dealer.getMao().calcularValor() > 21;
    }

    public static void main(String[] args) {
        Blackjack jogo = new Blackjack();
        jogo.inicia();
    }
}