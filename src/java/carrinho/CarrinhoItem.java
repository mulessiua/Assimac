package carrinho;

import entidades.Produto;

public class CarrinhoItem {

    private Produto produto;
    private short  quantidade;

    public CarrinhoItem(Produto p){
        this.produto = p;
        this.quantidade = 1;
    }

    public Produto getProduto() {
        return this.produto;
    }

    public short getQuantidade() {
        return this.quantidade;
    }

    public void setQuantidade(short qt){
        quantidade = qt;
    }

    public void incrementaQuantidade(){
        quantidade ++;
    }
    public void decrementaQuantidade(){
    quantidade--;
    }


}
