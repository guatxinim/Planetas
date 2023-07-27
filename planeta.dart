class Planeta{
  
    String nome;
    String tipo;
    double idade;
    int quantasLuas;
    String estrela;
    String galaxia;
    double duracaoDia;
    double duracaoAno;
    double distanciaDaEstrela;
    double distanciaDaTerra;
    bool aneis;
    num contaDias = 0;

    Planeta(this.nome, this.tipo, this.idade, this.quantasLuas, this.estrela, this.galaxia, this.duracaoDia, this.duracaoAno, this.distanciaDaEstrela, this.distanciaDaTerra, this.aneis);

    mostraInfo(){

        print("Nome: $nome \nTipo: Planeta $tipo \nIdade: $idade anos terrestres \nQuantidade de Luas: $quantasLuas \nTem Anéis? $aneis \nEstrela: $estrela \nGaláxia: $galaxia \nDuração do Dia: $duracaoDia horas \nDuração do Ano: $duracaoAno dias terrestres \nDistância da Estrela: $distanciaDaEstrela UA \nDistância da Terra: $distanciaDaTerra (UA para o Sistema Solar, Anos-luz para o restante)\n");

    }

    translacao(){

        double anos = duracaoAno / 365;
        idade += anos;
        print("Feliz Ano Novo! \nO planeta $nome completou mais um ciclo de translação! \nDuração do ciclo: $duracaoAno dias terrestres. \nAgora o planeta $nome tem $idade anos terrestres de existência!\n");

    }

    rotacao(){

        print("Mais um dia se passou no Planeta $nome!\n");
        contaDias += (duracaoDia / 24);
      
        if ((contaDias) >= duracaoAno){

            contaDias -= duracaoAno;
            return translacao();
          
        }
      
    }

   limiteRoche(){

        if (quantasLuas != 0){

            quantasLuas -= 1;
            aneis = true;
            print("Agora $nome tem anéis! \nUma lua do Planeta $nome atingiu o Limite de Roche!");
            
            }

        else {

            print("O Planeta $nome não possui luas para atingir o Limite de Roche!");

        }

        print("Quando isso acontece, o satélite natural se aproxima tanto do planeta\nque se fragmenta, dando origem a anéis. \n");

    }

    calculaVelocidade(){

        double distanciaKm = distanciaDaEstrela * 149597828;
        double orbita = distanciaKm * 2 * 3.14;
        double velocidade = orbita / (duracaoAno * 8760);
        //Velocidade aproximada, visto que a órbita não são uma circunferência perfeita, são levemente ovaladas
        return velocidade;

    }

}

/*main(){
  
  terra.mostraInfo();
  terra.translacao();
  terra.rotacao();
  terra.limiteRoche();
  terra.calculaVelocidade();
  
  Map<String, Planeta> mapaPlanetas = Map();
  Planeta terra = Planeta("Terra", "rochoso", 4540000000, 1, "Sol", "Via-Láctea", 24, 365, 1, 0);
  mapaPlanetas.putIfAbsent("terra", () => terra);
  print(mapaPlanetas);
  mapaPlanetas[0]?.mostraInfo();
  
}*/