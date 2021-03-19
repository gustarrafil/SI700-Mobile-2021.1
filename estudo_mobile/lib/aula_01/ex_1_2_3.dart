/*atividade 01
Autores:
Gustavo Tarrafil Sousa Pereira RA: 159740
g159740@dac.unicamp.br
Arthur Briganti Gini RA: 213253
a213253@dac.unicamp.br
*/
main() {
  // 1 - leastDifference(a,b,c): receberá três argumentos numéricos e computará a menor diferença em módulo entre quaisquer pares desses argumentos.

  int leastDifference(int a, int b, int c) {
    List respostas = [
      (a - b > 0 ? a - b : -(a - b)),
      (a - c > 0 ? a - c : -(a - c)),
      (b - c > 0 ? b - c : -(b - c))
    ];

    int menor = respostas.reduce((atual, prox) => atual < prox ? atual : prox);
    return menor;
  }

  // print(leastDifference(1, 5, 9)); // 4
  // print(leastDifference(-1, 15, 3)); // 4
  // print(leastDifference(-101, 15, 99)); // 84
  // print(leastDifference(21, 35, 19)); // 2

  /////////////////////////////////////////////////////

  // 2 - destruirPetecas(numPetecas, numAmigos): receberá o número de petecas que um grupo de amigos possuem em conjunto e o número de amigos. Nesse caso, você deverá retornar quantas petecas deverão ser destruídas para que não haja brigas entre os amigos e todos eles recebam o mesmo número de petecas. Em outras palavras, se temos 4 amigos e 23 petecas, podemos dar cinco petecas para cada amigo, o que totaliza 20 petecas distribuídas. As outras 3 petecas devem ser destruídas para que não haja briga.

  int destruirPetecas(int numPetecas, int numAmigos) {
    return numPetecas % numAmigos;
  }

  // print(destruirPetecas(23, 4)); // 3
  // print(destruirPetecas(35, 6)); // 5
  // print(destruirPetecas(95, 19)); // 0

  /////////////////////////////////////////////////////

  // 3 - marteloThor(thor, martelo): receberá duas listas com dois elementos, representando a posição de thor e a posição do seu martelo em um plano bidimensional. Ao final, deverá imprimir uma lista de coordenadas que o thor deverá visitar até chegar no seu martelo. O thor só pode se mover para norte, sul, leste ou oeste.

  void chegaPerto(List<int> thor, int eixo, int novo) {
    thor.removeAt(eixo);
    thor.insert(eixo, novo);
    print(thor);
  }

  void marteloThor(List<int> thor, List<int> martelo) {
    int thorX = thor[0];
    int thorY = thor[1];
    int marteloX = martelo[0];
    int marteloY = martelo[1];

    while (thorX < marteloX) {
      thorX += 1;
      chegaPerto(thor, 0, thorX);
    }
    while (thorX > marteloX) {
      thorX -= 1;
      chegaPerto(thor, 0, thorX);
    }
    while (thorY < marteloY) {
      thorY += 1;
      chegaPerto(thor, 1, thorY);
    }
    while (thorY > marteloY) {
      thorY -= 1;
      chegaPerto(thor, 1, thorY);
    }
  }

  // marteloThor([5, 2], [4, 7]);

  // marteloThor([9, 7], [11, 3]);

  // marteloThor([5, 7], [-5, -3]);
}
