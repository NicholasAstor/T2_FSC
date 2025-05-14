public class Dealer extends Jogador { 
    public Carta getCartaVisivel() { // bgl da carta invisível no começo lá, é a única coisa de diferente do jogador
        return getMao().getCartas().get(0);
    }
}
