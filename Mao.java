import java.util.ArrayList;
import java.util.List;

public class Mao {
    private List<Carta> cartas;

    public Mao() {
        cartas = new ArrayList<>();
    }

    public void hitCarta(Carta carta) {
        cartas.add(carta);
    }

    public List<Carta> getCartas() {
        return new ArrayList<>(cartas);
    }

    public int calcularValor() {
        var valor = 0;
        var numAses = 0;

        for (Carta carta : cartas) {
            if (carta.getValor().equals("A")) {
                numAses++; // dica do sor foi boa de fazer um contador de ases
                valor += carta.getPontos();
            } else {
                valor += carta.getPontos();
            }
        }

        while (valor > 21 && numAses > 0) { // aqui que a verificação do valor do A é feita
            valor -= 10;
            numAses--;
        }

        return valor;
    }

    public String toString(){
        return cartas.toString();
    }
}
