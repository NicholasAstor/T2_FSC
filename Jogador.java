public class Jogador { // depois o dealer vai herdar isso aq
    private Mao mao;

    public Jogador() {
        this.mao = new Mao();
    }

    public Mao getMao() {
        return mao;
    }

    public void receberCarta(Carta carta) {
        mao.hitCarta(carta);
    }

    public void limparMao() {
        mao = new Mao();
    }
}
