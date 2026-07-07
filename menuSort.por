programa {
  
  inclua biblioteca Util --> u

  // DECLARAÇÃO DO VETOR FIXO DESORDENADO USANDO CHAVES
  // Você pode adicionar quantos elementos quiser aqui dentro das chaves separados por vírgula!
  inteiro vetorOriginal[] = {719, 234, 856, 412, 93, 674, 18, 502, 881, 345}
  
  // O sistema descobre o tamanho automaticamente contando quantos elementos você colocou nas chaves acima
  inteiro tamanhoUsuario = u.numero_elementos(vetorOriginal)

  // VETOR AUXILIAR QUE SERÁ ORDENADO (Para manter o original sempre intacto para os outros testes)
  inteiro vetorParaOrdenar[1000] 

  // VARIÁVEIS QUE RECEBEM O TEMPO DECORRIDO DE CADA ALGORITMO: 
        inteiro t1Bubble, t2Bubble
        inteiro t1Quick, t2Quick
        inteiro t1Selection, t2Selection
        inteiro t1Insertion, t2Insertion
        inteiro t1Merge, t2Merge
        inteiro t1Heap, t2Heap

  funcao inicio() {
    logico onOff = verdadeiro
    caracter opcao
    
    escreva("========= BEM-VINDO AO SORTING FACTORY =========\n")
    escreva("Vetor fixo carregado com sucesso! Tamanho: ", tamanhoUsuario, " elementos.\n\n")

    enquanto(onOff) {

      escreva("===      MENU      ===\n")
      escreva("1 - Bubble Sort.\n")
      escreva("2 - Quick Sort.\n")
      escreva("3 - Selection Sort.\n")
      escreva("4 - Insertion Sort.\n")
      escreva("5 - Merge Sort.\n")
      escreva("6 - Heap Sort.\n")
      escreva("7 - Sair\n")
      escreva("=======================\n")
      escreva("Digite a opção que deseja usar: ")
      leia(opcao)

      se(opcao >= '1' e opcao <= '6') {
        limpa()
        copiarVetor()
      }

      escolha(opcao) {
        caso '1': bubbleSort() pare
        caso '2': quickSort() pare
        caso '3': selectionSort() pare
        caso '4': insertionSort() pare
        caso '5': mergeSort() pare
        caso '6': heapSort() pare
        caso '7':
          escreva("Obrigado por usar nosso sistema! Até logo...")
          onOff = falso
          pare
        caso contrario:
          escreva("Digite um valor válido.\n")
      }
    }
  }

  funcao exibirVetor(inteiro vet[], inteiro tamanho) {
    escreva("[ ")
    para(inteiro i = 0; i < tamanho; i++) {
      escreva(vet[i], " ")
    }
    escreva("]\n")
  }

  funcao copiarVetor() {
    para(inteiro i = 0; i < tamanhoUsuario; i++) {
      vetorParaOrdenar[i] = vetorOriginal[i]
    }
  }

  // ===================================================
  // ALGORITMOS DE ORDENAÇÃO
  // ===================================================

  funcao bubbleSort() {
    escreva("===    MENU BUBBLE SORT   ===\n")
    escreva("Antes: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)

    inteiro auxiliar
    t1Bubble = u.tempo_decorrido()

    para(inteiro i = 0; i < tamanhoUsuario; i++) {
      para(inteiro j = 0; j < tamanhoUsuario - i - 1; j++) {
        se(vetorParaOrdenar[j] > vetorParaOrdenar[j + 1]) {
          auxiliar = vetorParaOrdenar[j]
          vetorParaOrdenar[j] = vetorParaOrdenar[j + 1]
          vetorParaOrdenar[j + 1] = auxiliar
        }
      }
    }

    t2Bubble = u.tempo_decorrido()

    escreva("Depois: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)
    escreva("Tempo Decorrido: ", t2Bubble - t1Bubble, "ms\n")
    escreva("=============================\n")
  }

  funcao quickSort() {
    escreva("===     MENU QUICK SORT     ===\n")
    escreva("Antes: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)

    t1Quick = u.tempo_decorrido()
    executarQuickSort(0, tamanhoUsuario - 1)
    t2Quick = u.tempo_decorrido()

    escreva("Depois: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)
    escreva("Tempo Decorrido: ", t2Quick - t1Quick, "ms\n")
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
    inteiro pivo = vetorParaOrdenar[fim]
    inteiro i = (inicio - 1)
    inteiro auxiliar

    para(inteiro j = inicio; j < fim; j++) {
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

  funcao selectionSort() {
    escreva("===    MENU SELECTION SORT   ===\n")
    escreva("Antes: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)

    inteiro indiceMenor
    inteiro auxiliar
    t1Selection = u.tempo_decorrido()

    para(inteiro i = 0; i < tamanhoUsuario - 1; i++) {
      indiceMenor = i
      para(inteiro j = i + 1; j < tamanhoUsuario; j++) {
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
    t2Selection = u.tempo_decorrido()

    escreva("Depois: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)
    escreva("Tempo Decorrido: ", t2Selection - t1Selection, "ms\n")
    escreva("=============================\n")
  }

  funcao insertionSort() {
    escreva("===    MENU INSERTION SORT   ===\n")
    escreva("Antes: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)

    inteiro chave
    inteiro j
    t1Insertion = u.tempo_decorrido()

    para(inteiro i = 1; i < tamanhoUsuario; i++) {
      chave = vetorParaOrdenar[i]
      j = i - 1
      enquanto(j >= 0 e vetorParaOrdenar[j] > chave) {
        vetorParaOrdenar[j + 1] = vetorParaOrdenar[j]
        j = j - 1
      }
      vetorParaOrdenar[j + 1] = chave
    }
    t2Insertion = u.tempo_decorrido()

    escreva("Depois: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)
    escreva("Tempo Decorrido: ", t2Insertion - t1Insertion, "ms\n")
    escreva("=============================\n")
  }

  funcao mergeSort() {
    escreva("===      MENU MERGE SORT     ===\n")
    escreva("Antes: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)

    t1Merge = u.tempo_decorrido()
    executarMergeSort(0, tamanhoUsuario - 1) 
    t2Merge = u.tempo_decorrido()

    escreva("Depois: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario) 
    escreva("Tempo Decorrido: ", t2Merge - t1Merge, "ms\n")
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
    inteiro vetorAuxiliar[1000] // Aumentado para suportar testes maiores

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

  funcao heapSort() {
    escreva("===    MENU HEAP SORT   ===\n")
    escreva("Antes: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)

    t1Heap = u.tempo_decorrido()

    para(inteiro i = tamanhoUsuario / 2 - 1; i >= 0; i--) {
      aplicarHeapify(tamanhoUsuario, i)
    }

    inteiro auxiliar
    para (inteiro i = tamanhoUsuario - 1; i > 0; i--) {
      auxiliar = vetorParaOrdenar[0]
      vetorParaOrdenar[0] = vetorParaOrdenar[i]
      vetorParaOrdenar[i] = auxiliar
      aplicarHeapify(i, 0)
    }

    t2Heap = u.tempo_decorrido()

    escreva("Depois: ")
    exibirVetor(vetorParaOrdenar, tamanhoUsuario)
    escreva("Tempo Decorrido: ", t2Heap - t1Heap, "ms\n")
    escreva("=============================\n")
  }

  funcao aplicarHeapify(inteiro tamanho, inteiro i) {
    inteiro maior = i
    inteiro esquerda = 2 * i + 1 
    inteiro direita = 2 * i + 2
    inteiro auxiliar

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
}
