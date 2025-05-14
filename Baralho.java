import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Baralho {
    private List<Carta> cartas;

    public Baralho() {
        cartas = new ArrayList<>();
        inicializa();
        embaralha();
    }

    private void inicializa() {
        String valores[] = {"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"};
        for (int i = 0; i<4; i++){ // i<4 pra representar os 4 naipes
            for (String valor : valores){
                var pontos = 0;
                if (valor.equals("A")) { // a lógica para o Ás valer 1 vai ser feita em outra classe
                    pontos = 11;
                } else if (valor.equals("J") || valor.equals("Q") || valor.equals("K")) {
                    pontos = 10;
                } else {
                    pontos = Integer.parseInt(valor);
                }
                cartas.add(new Carta(valor, pontos));
            }
        }
    }

    private void embaralha() {
        Collections.shuffle(cartas);
    }

    public Carta hit() { // hit é o termo que o sor usou, poderia ser comprarCarta aqui também pra facilitar o entendimento mas tanto faz...
        if (cartas.isEmpty()){
            inicializa();
            embaralha();
        }
        return cartas.remove(cartas.size() - 1);
    }
}
