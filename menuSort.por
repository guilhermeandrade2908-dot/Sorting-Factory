programa {
  
  const inteiro limiteMaximo = 1000 // VARIÁVEL QUE SERÁ UTILIZADA PARA DEFINIR O LIMITE DO VETOR
  
  
  // VETORES QUE SERÃO UTILIZADOS PARA RECEBER RESPECTIVAMENTE, O VETOR DESORDENADO E O ORDENADO
  cadeia vetorOriginal[limiteMaximo] 
  cadeia vetorParaOrdenar[limiteMaximo]

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
    escreva("2 - Quick Sort.\n")
    escreva("3 - Selection Sort.\n")
    escreva("4 - Insertion Sort.\n")
    escreva("5 - Merge Sort.\n")
    escreva("6 - Heap Sort.\n")
    escreva("7 - Configurar Novo Vetor\n")
    escreva("8 - Sair\n")
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
        quickSort()
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
        configurarNovoVetor()
        pare
      
      caso '8':
        escreva("Obrigado por usar nosso sistema! Até logo...")
        onOff = falso
        pare
      
      caso contrario:
        escreva("Digite um valor válido.\n")
      
      }
    }
  }

  // FUNÇÃO INICIAL QUE PERMITE O USUÁRIO CRIAR O VETOR

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

  funcao exibirVetor(cadeia vet[], inteiro tamanho) {
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

  // ###################################################

  // IMPLEMENTAÇÃO DE ALGORITMOS ABAIXO: 

  // BUBBLE SORT: 
  
    funcao bubbleSort() {
      escreva("===    MENU BUBBLE SORT   ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      cadeia auxiliar

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

    // ###################################################

    // QUICK SORT: 

    funcao quickSort() {
      escreva("===     MENU QUICK SORT     ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      executarQuickSort(0, tamanhoUsuario - 1)

      escreva("Depois: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)
      escreva("=============================\n")
    }

    funcao executarQuickSort(inteiro inicio, inteiro fim) {
      se (inicio < fim) {
        inteiro indicePivo = particionar(inicio, fim)
        executarQuickSort(inicio, indicePivo - 1)

        executarQuickSort(indicePivo + 1, fim)
      }
    }

    funcao inteiro particionar(inteiro inicio, inteiro fim) {
      cadeia pivo = vetorParaOrdenar[fim]
      inteiro i = (inicio - 1)
      cadeia auxiliar

      para(inteiro j=inicio; j < fim; j++) {
        se(vetorParaOrdenar[j] <= pivo) {
          i++
          auxiliar = vetorParaOrdenar[i]
          vetorParaOrdenar[i] = vetorParaOrdenar[j]
          vetorParaOrdenar[j] = auxiliar
        }
      }
      auxiliar = vetorParaOrdenar[i + 1]
      vetorParaOrdenar[i + 1] = vetorParaOrdenar[fim]
      vetorParaOrdenar[fim] = auxiliar

      retorne (i + 1)
    }

    // ##############################################################

    // SELECTION SORT:

    funcao selectionSort() {
      escreva("===    MENU SELECTION SORT   ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      inteiro indiceMenor
      cadeia auxiliar

      para(inteiro i = 0; i < tamanhoUsuario - 1; i++) {
        indiceMenor = i

        para(inteiro j= i + 1; j < tamanhoUsuario; j++) {
          se(vetorParaOrdenar[j] < vetorParaOrdenar[indiceMenor]) {
            indiceMenor = j
          }
        }
        se(indiceMenor != i) {
          auxiliar = vetorParaOrdenar[i]
          vetorParaOrdenar[i] = vetorParaOrdenar[indiceMenor]
          vetorParaOrdenar[indiceMenor] = auxiliar
        }
    }
      escreva("Depois: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)
      escreva("=============================\n")
    }

    // ###################################################

    
    // INSERTION SORT: 

    funcao insertionSort() {
      escreva("===    MENU INSERTION SORT   ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      cadeia chave
      inteiro j

      para(inteiro i=1; i < tamanhoUsuario; i++) {
        chave = vetorParaOrdenar[i]
        j = i - 1

        enquanto(j >= 0 e vetorParaOrdenar[j] > chave) {
          vetorParaOrdenar[j + 1] = vetorParaOrdenar[j]
          j = j - 1
        }
        vetorParaOrdenar[j + 1] = chave
      }
      escreva("Depois: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)
      escreva("=============================\n")
    }

    // ################################################

    // MERGE SORT:

    funcao mergeSort() {
      escreva("===     MENU MERGE SORT     ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      executarMergeSort(0, tamanhoUsuario - 1) 

      escreva("Depois: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario) 
      escreva("=============================\n")
    }

    funcao executarMergeSort(inteiro esquerda, inteiro direita) {
      se(esquerda < direita) {
        inteiro meio = esquerda + (direita - esquerda) / 2

        executarMergeSort(esquerda, meio)
        executarMergeSort(meio + 1, direita)

        fazerMergeSort(esquerda, meio, direita)
      }
    }

    funcao fazerMergeSort(inteiro esquerda, inteiro meio, inteiro direita) {
      
      cadeia vetorAuxiliar[100]

      para (inteiro i = esquerda; i <= direita; i++) {
        vetorAuxiliar[i] = vetorParaOrdenar[i]
      }

      inteiro i = esquerda
      inteiro j = meio + 1
      inteiro k = esquerda

      enquanto (i <= meio e j <= direita) {
        se(vetorAuxiliar[i] <= vetorAuxiliar[j]) {
          vetorParaOrdenar[k] = vetorAuxiliar[i]
          i++
        } senao {
          vetorParaOrdenar[k] = vetorAuxiliar[j]
          j++
        }
        k++
      }

      enquanto (i <= meio) {
        vetorParaOrdenar[k] = vetorAuxiliar[i]
        i++
        k++
      }
    }


    // ################################################

    // HEAP SORT: 

    funcao heapSort() {
      escreva("===    MENU HEAP SORT   ===\n")
      escreva("Antes: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)

      para(inteiro i = tamanhoUsuario / 2 - 1; i >= 0; i--) {

        aplicarHeapify(tamanhoUsuario, i)
      }

      cadeia auxiliar

      para (inteiro i = tamanhoUsuario - 1; i > 0; i--) {

        auxiliar = vetorParaOrdenar[0]
        vetorParaOrdenar[0] = vetorParaOrdenar[i]
        vetorParaOrdenar[i] = auxiliar

        aplicarHeapify(i, 0)
      }

      escreva("Depois: ")
      exibirVetor(vetorParaOrdenar, tamanhoUsuario)
      escreva("=============================\n")
    }

    funcao aplicarHeapify(inteiro tamanho, inteiro i) {
      inteiro maior = i
      inteiro esquerda = 2 * 1 + 1
      inteiro direita = 2 * i + 2
      cadeia auxiliar

      se (esquerda < tamanho e vetorParaOrdenar[esquerda] > vetorParaOrdenar[maior]) {
        maior = esquerda
      }

      se (direita < tamanho e vetorParaOrdenar[direita] > vetorParaOrdenar[maior]) {
        maior = direita
      }
      se (maior != i) {
      auxiliar = vetorParaOrdenar[i]
            vetorParaOrdenar[i] = vetorParaOrdenar[maior]
            vetorParaOrdenar[maior] = auxiliar

          
            aplicarHeapify(tamanho, maior)
      }
    }

    // #################################################
}
