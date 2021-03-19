/*atividade 01

A entrega será um vídeo da sua tela com o seguinte roteiro:
- Apresente integrante 1.
- Apresente integrante 2.
- Mostre todos os códigos brevemente, avisando se você conseguiu resolver o problema facilmente ou se teve dificuldade. Os códigos são provavelmente curtos.
- Mostre para cada problema uma das saídas que eu coloquei de exemplo acima.

Tente falar rápido para dar um vídeo de dois minutos.*/

main() {
  // 1 - leastDifference(a,b,c): receberá três argumentos numéricos e computará a menor diferença em módulo entre quaisquer pares desses argumentos.

  int leastDifference(int a, int b, int c) {

    List respostas = [
      (a - b > 0 ? a - b : -(a - b)),
      (a - c > 0 ? a - c : -(a - c)),
      (b - c > 0 ? b - c : -(b - c)),
    ];

    int menor = respostas.reduce((atual, prox) => atual < prox ? atual : prox);
    return menor;
  }

  // print(leastDifference(1,5,9)); // 4
  // print(leastDifference(-1,15,3)); // 4
  // print(leastDifference(-101,15,99)); // 84
  // print(leastDifference(21,35,19)); // 2

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

  void marteloThor(List<int> thor, List<int> martelo) {

    int pX = thor[0];
    int pY = thor[1];
    int dX = martelo[0];
    int dY = martelo[1];

    while (pX < dX) {
      pX += 1;
      thor.removeAt(0);
      thor.insert(0, pX);
      print(thor);
    }
    while (pX > dX) {
      pX -= 1;
      thor.removeAt(0);
      thor.insert(0, pX);
      print(thor);
    }
    while (pY < dY) {
      pY += 1;
      thor.removeAt(1);
      thor.insert(1, pY);
      print(thor);
    }
    while (pY > dY) {
      pY -= 1;
      thor.removeAt(1);
      thor.insert(1, pY);
      print(thor);
    }
  }

  // marteloThor([5, 2], [4, 7]);
  // [4, 2]
  // [4, 3]
  // [4, 4]
  // [4, 5]
  // [4, 6]
  // [4, 7]

  // marteloThor([9,7], [11,3]);
  // [10, 7]
  // [10, 6]
  // [11, 6]
  // [11, 5]
  // [11, 4]
  // [11, 3]

  // marteloThor([5,7], [-5,-3]);
  // [4, 7]
  // [4, 6]
  // [3, 6]
  // [3, 5]
  // [2, 5]
  // [2, 4]
  // [1, 4]
  // [1, 3]
  // [0, 3]
  // [0, 2]
  // [-1, 2]
  // [-1, 1]
  // [-2, 1]
  // [-2, 0]
  // [-3, 0]
  // [-3, -1]
  // [-4, -1]
  // [-4, -2]
  // [-5, -2]
  // [-5, -3]
}
