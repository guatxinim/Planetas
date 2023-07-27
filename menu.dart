import 'planeta.dart';
import 'dart:io';


class Menu{

  Map<String, Planeta> mapaPlanetas = Map();

  addPlaneta(){

    print("Nome do Planeta:");
    String? nome = stdin.readLineSync()!;

    if(mapaPlanetas.containsKey('$nome')) {print("Esse planeta já está registrado!");}

    else{

      print("Tipo:");
      String? tipo = stdin.readLineSync()!;
      print("Idade [em anos terrestres]:");
      double idade = double.parse(stdin.readLineSync()!);
      print("Quantas luas?");
      int quantasLuas= int.parse(stdin.readLineSync()!);
      print("Estrela(s) que ele orbita:");
      String? estrela = stdin.readLineSync()!;
      print("Galáxia:");
      String? galaxia = stdin.readLineSync()!;
      print("Duração do dia [horas terrestres]:");
      double duracaoDia = double.parse(stdin.readLineSync()!);
      print("Duração do ano [dias terrestres]:");
      double duracaoAno = double.parse(stdin.readLineSync()!);
      print("Distância de sua estrela [Unidade Astronômica (UA)]:");
      double distanciaDaEstrela = double.parse(stdin.readLineSync()!);
      print("Distancia da Terra [UA para o Sistema Solar, Anos-luz para o restante]:");
      double distanciaDaTerra = double.parse(stdin.readLineSync()!);
      print("Tem Anéis [responda apenas s/n]?");
      String? temAneis = stdin.readLineSync()!;
      late bool aneis;

      switch(temAneis){

        case 's':{

          aneis = true;

        } break;
        case 'n':{

          aneis = false;

        } break;
        default:{
          print("Valor inválido, vamos salvar como 'não tem aneis'.");
          aneis = false;
          } break;
      
      }

      Planeta novoPlaneta = Planeta(nome, tipo, idade, quantasLuas, estrela, galaxia, duracaoDia, duracaoAno, distanciaDaEstrela, distanciaDaTerra, aneis);

      mapaPlanetas.putIfAbsent("$nome", () => novoPlaneta);

      }

  }

  visualizaPlanetas(){

    if(mapaPlanetas.length > 0) {

      mapaPlanetas.forEach((key, value) {

        print("$key");

      });
    }

    else{

      print("Nenhum planeta está registrado.");

    }

  }

  visualizaInfo(){

    if(mapaPlanetas.length > 0) {

      mapaPlanetas.forEach((key, value) {

        print('''${value.mostraInfo()}
        ''');

      });
      
    }

    else{

      print("Nenhum planeta está registrado.");

    }

  }

  remove() {

    print("Qual planeta quer remover?");
    String? remover = stdin.readLineSync()!;
    mapaPlanetas.remove('$remover');

  }

  mostraMenu(){

    LoopMenu:while(true) {

      print('''
_________________________________________________
|    Menu:                                      |
|                                               |
| 1 - Adicionar Novo Planeta                    |
| 2 - Visualizar Lista de Planetas Salvos       |
| 3 - Visualizar Informações Sobre Um Planeta   |
| 4 - Excluir Um Planeta                        |
| 5 - Fechar Programa                           |
|_______________________________________________|

Ecolha uma opção:
''');

      String opcao = stdin.readLineSync()!;

      switch(opcao) {

        case '1': {addPlaneta();} break;

        case '2': {visualizaPlanetas();} break;

        case '3': {visualizaInfo();} break;

        case '4': {remove();} break;

        case '5': break LoopMenu;

        default: {print("Informe uma opção válida!");} break;

      }
    }
  }

}