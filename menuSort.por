programa {

  inteiro limiteMaximo = 100 // VARIÁVEL QUE SERÁ UTILIZADA PARA DEFINIR O LIMITE DO VETOR
  
  // VETORES QUE SERÃO UTILIZADOS PARA RECEBER RESPECTIVAMENTE, O VETOR DESORDENADO E O ORDENADO
  
  caracter vetorOriginal[limiteMaximo] 
  caracter vetorParaOrdenar[limiteMaximo]

  inteiro tamanhoUsuario = 0 // VARIÁVEL QUE GUARDARÁ QUANTOS ELEMENTOS O USUÁRIO DIGITOU 

  funcao inicio() {
    // VARIÁVEIS:
    logico onOff = verdadeiro
    caracter opcao
    
    escreva("========= BEM-VINDO AO SORTING FACTORY =========\n")
    escreva("Para começar, vamos iniciar o seu vetor.\n\n")

    configurarNovoVetor()

    enquanto(onOff) {

    escreva("===      MENU      ===\n")
    escreva("1 - Bubble Sort.\n")
    escreva("2 - Quik Sort.\n")
    escreva("3 - Selection Sort.\n")
    escreva("4 - Insertion Sort.\n")
    escreva("5 - Merge Sort.\n")
    escreva("6 - Heap Sort.\n")
    escreva("7 - Sair do sistema.\n")
    escreva("=======================\n")
    escreva("Digite a opção que deseja usar: ")
    leia(opcao)

    se(opcao >= '1' e opcao <= '6') {
      limpa()
      copiarVetor()
    }

    escolha(opcao) {

      caso '1':
        bubbleSort()
        pare

      caso '2':
        quikSort()
        pare

      caso '3':
        selectionSort()
        pare

      caso '4':
        insertionSort()
        pare

      caso '5':
        mergeSort()
        pare

      caso '6':
        heapSort()
        pare

      caso '7':
        escreva("Obrigado por usar nosso sistema! Até logo...")
        onOff = falso
        pare

      caso contrario:
        escreva("Digite um valor válido.\n")

    }
    }
  }

  funcao configurarNovoVetor() {
      inteiro tamanho = 0

      enquanto(tamanho <= 0 ou tamanho > limiteMaximo) {
        escreva("Quantos elementos (letras ou números) terá o seu vetor? (MAX: ", limiteMaximo, "): ")
        leia(tamanho)

        se(tamanho <= 0 ou tamanho > limiteMaximo) {
          escreva("Tamanho inválido! Digite um valor entre 1 e ", limiteMaximo, ".\n")
        }
      }

      tamanhoUsuario = tamanho

      para(inteiro i = 0; i < tamanhoUsuario; i++) {
        escreva("Digite o caractere para a posição [", i, "]: ")
        leia(vetorOriginal[i])
      }

    limpa()
    escreva("Vetor salvo com sucesso!\n")
  }

  funcao exibirVetor(caracter vet[], inteiro tamanho) {
    escreva("[ ")
    para(inteiro i = 0; i < tamanho; i++) {
      escreva(vet[i], " ")
    }
    escreva("]\n")
  }

  funcao copiarVetor() {
    para(inteiro i = 0; i < tamanhoUsuario;i++) {
      vetorParaOrdenar[i] = vetorOriginal[i]
    }
  }

  // IMPLEMENTAÇÃO DE ALGORITMOS ABAIXO: 

  
  funcao bubbleSort() {
      escreva("===    MENU BUBBLE SORT   ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      caracter auxiliar

      para(inteiro i = 0; i < tamanhoUsuario; i++) {
        para(inteiro j = 0; j < tamanhoUsuario - i - 1; j++) {
          se(vetorParaOrdenar[j] > vetorParaOrdenar[j + 1]) {
            auxiliar = vetorParaOrdenar[j]
            vetorParaOrdenar[j] = vetorParaOrdenar[j + 1]
            vetorParaOrdenar[j + 1] = auxiliar
          }
        }
      }

      escreva("Depois: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)
      escreva("=============================\n")
    }

    funcao quikSort() {
      escreva("===     MENU QUIK SORT     ===\n")
      escreva("=============================\n")
    }

    funcao selectionSort() {
      escreva("===    MENU SELECTION SORT   ===\n")
      escreva("=============================\n")
    }
    funcao insertionSort() {
      escreva("===    MENU INSERTION SORT   ===\n")
      escreva("=============================\n")
    }

    funcao mergeSort() {
      escreva("===     MENU MERGE SORT     ===\n")
      escreva("=============================\n")
    }

    funcao heapSort() {
      escreva("===    MENU HEAP SORT   ===\n")
      escreva("=============================\n")
    }
}




 
