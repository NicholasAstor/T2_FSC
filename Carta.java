public class Carta {
    private String valor;
    private int pontos;
    
    public Carta(String valor, int pontos) {
        this.valor = valor; // 1, 2, 3 ... J, Q, K, A
        this.pontos = pontos; // de fato quanto elas vão representar
    }

    public String getValor() {
        return valor;
    }

    public int getPontos() {
        return pontos;
    }

    public String toString() {
        return valor;
    }
}
