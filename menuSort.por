programa {
  funcao inicio() {
    // VARIÁVEIS:
    logico onOff = verdadeiro
    caracter opcao
    
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
 
  funcao bubbleSort() {
      escreva("===    MENU BUBBLE SORT   ===\n")
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
