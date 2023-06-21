Algoritmo "kart-1.0"
// Disciplina   : Conceitos de Algoritmos
// Professor   : Gilberto Viana de Oliveira

Var

   pausar, circuitos: caractere
   decisao, i, aux: inteiro
   cadastro, alocar: real
   deletar, devolucao : real

   //KART
   qtdKarts: inteiro
   kartsCadastrado: vetor[1..15] de inteiro
   kartsNum: vetor[1..15] de inteiro
   modelos: vetor[1..15] de caractere
   precos: vetor[1..15] de real
   vezesLocado: vetor[1..15] de inteiro
   estadoLocacao: vetor[1..15] de inteiro
   lucroKart: vetor[1..15] de real
   lucroTotalKart: vetor[1..15] de real
   // circuitos
   nomeCircuito, novoNome: caractere
   valorCircuito, novoValor, receitaCircuito: real
   modificarCircuito, estadoCircuito, devolverCircuito: inteiro

funcao menu: inteiro
var
inicio
   escreval("1. Cadastrar Kart")
   escreval("2. Listar Karts disponíveis")
   escreval("3. Listar Karts locados")
   escreval("4. Alugar um Kart")
   escreval("5. Devolver um Kart")
   escreval("6. Kart que mais gerou lucro")
   escreval("7. Receita e lucro do dia")
   escreval("8. Locação de circuito")
   escreval("9. Atualizar dia")
   escreval("10. Sair do programa")
   leia(decisao)
   limpatela

   retorne decisao
fimfuncao





funcao cadastrar: caractere
var
   valor: inteiro
inicio

   escreval("Quantos Karts você quer cadastrar?:")
   leia(valor)
   escreval("")

   para i de 1 ate valor faca
      se (qtdKarts < 15) entao
         escreval("Kart de número: ", kartIndice)
         escreva("Informe o modelo do Kart: ")
         leia(modelos[kartIndice])
         escreva("Digite o valor de locação do Kart: ")
         leia(precos[kartIndice])
         escreval("")

         lucroKart[kartIndice] <- (30/100) * precos[kartIndice] //calcula lucro do Kart
         kartsNum[kartIndice] <- kartIndice //Define o numero do Kart
         kartsCadastrado[kartIndice] <- 1 //Marcar que existe um Kart no vetor
         qtdKarts <- qtdKarts + 1 //Contabilizar Karts
      senao
         escreval("Não é possível cadastrar mais Karts.")
         escreval("")
         interrompa
      fimse
   fimpara

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela
fimfuncao
funcao kartIndice: inteiro
var
inicio
   para i de 1 ate 15 faca
      //pega o primeiro Indice vazio
      se (kartsCadastrado[i] = 0) entao
         retorne i
         interrompa
      fimse
   fimpara
fimfuncao





funcao listarDisponiveis: caractere
var
   valor: inteiro
inicio
   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta disponivel
      se ((kartsCadastrado[i] = 1) e (estadoLocacao[i] = 0)) entao
         escreval("Número do Kart: ", kartsNum[i])
         escreval("Modelo: ", modelos[i])
         escreval("Preço: ", precos[i])
         escreval("Vezes em que foi locado: ", vezesLocado[i])
         escreval("")
      senao
         valor<-valor+1
      fimse
   fimpara

   se (valor=15) entao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("Não há nenhum Kart disponível!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   se (aux = 0) entao
      limpatela
   fimse
fimfuncao





funcao listarLocados: caractere
var
   valor: inteiro
inicio
   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta locado
      se(kartsCadastrado[i] = 1) e (estadoLocacao[i] = 1) entao
         escreval("Número do Kart: ", kartsNum[i])
         escreval("Modelo: ", modelos[i])
         escreval("Preço: ", precos[i])
         escreval("Vezes em que foi locado: ", vezesLocado[i])
         escreval("")
      senao
         valor<-valor+1
      fimse
   fimpara

   se (valor=15) entao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("Não há nenhum Kart locado!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   se (aux = 0) entao
      limpatela
   fimse
fimfuncao





funcao alocarKart: caractere
var valor: inteiro
inicio

   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta disponível
      se ((kartsCadastrado[i] = 1) e (estadoLocacao[i] = 0)) entao

      senao
         valor<-valor+1
      fimse
   fimpara

   se (valor <> 15) entao
      escreval("Aperte ENTER para mostrar os Karts disponíveis para locação")
      leia(valor)

      aux <- 1 //Isso é para não limpar a tela depois de listar
      escreval(listarDisponiveis)
      aux <- 0 //e isso volta para o valor padrão depois de mostrar

      escreval("Digite o número do Kart que você deseja alocar:")
      leia(valor)

      para i de 1 ate 15 faca
         se ((kartsNum[i] = valor) e (estadoLocacao[i] = 0) e (kartsCadastrado[i] = 1)) entao
            escreval("")
            escreval("Você alocou o seguinte Kart:")

            escreval("")
            escreval("Número do Kart: ", kartsNum[i])
            escreval("Modelo: ", modelos[i])
            escreval("Preço: ", precos[i])
            escreval("Vezes em que foi locado: ", vezesLocado[i])
            escreval("")

            estadoLocacao[i] <- 1 //Marca como locado
            vezesLocado[i] <- vezesLocado[i] + 1 //Conta vezes locado
         fimse
      fimpara

   senao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("Não há nenhum Kart disponível!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela
fimfuncao





funcao devolverKart: caractere
var valor: inteiro
inicio
   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta locado
      se ((kartsCadastrado[i] = 1) e (estadoLocacao[i] = 1)) entao

      senao
         valor<-valor+1
      fimse
   fimpara
   se (valor <> 15) entao
      escreval("Aperte ENTER para mostrar os Karts locados para devolução")
      leia(valor)

      aux <- 1 //Isso é para não limpar a tela depois de listar
      escreval(listarLocados)
      aux <- 0 //e isso volta para o valor padrão depois de mostrar

      escreval("Digite o número do Kart que você deseja devolver:")
      leia(valor)

      para i de 1 ate 15 faca
         se ((kartsNum[i] = valor) e (estadoLocacao[i] = 1) e (kartsCadastrado[i] = 1)) entao
            escreval("")
            escreval("Você devolveu o seguinte Kart:")

            escreval("")
            escreval("Número do Kart: ", kartsNum[i])
            escreval("Modelo: ", modelos[i])
            escreval("Preço: ", precos[i])
            escreval("Vezes em que foi locado: ", vezesLocado[i])
            escreval("")

            estadoLocacao[i] <- 0 //Marca como disponível
         fimse
      fimpara

   senao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("Não há nenhum Kart locado!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela

fimfuncao


funcao melhorKart: caractere
var
   maisLocado, numMaisLocado: inteiro
inicio
   para i de 1 ate 15 faca
      se (vezesLocado[i] > maisLocado) entao
         maisLocado <- vezesLocado[i]
         numMaisLocado <- i
      fimse
   fimpara

   se (maisLocado = 0) entao
      escreval("Nenhum Kart foi alugado ainda.")
   senao
      para i de 1 ate 15 faca
         se (vezesLocado[i] = numMaisLocado) entao
            escreval("Número do Kart: ", kartsNum[i])
            escreval("Modelo: ", modelos[i])
            escreval("Preço: ", precos[i])
            escreval("Vezes em que foi locado: ", vezesLocado[i])
            escreval("Lucro total do kart: R$", lucroKart[i] * vezesLocado[i])
            escreval("")
         fimse
      fimpara
   fimse
   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela
fimfuncao





funcao locarCircuito: caractere
var
   acao, valor, locar: inteiro

inicio
   repita
      escreval("O que você deseja fazer?")
      escreval("1. Cadastrar um circuito.")
      escreval("2. Alocar um circuito.")
      escreval("3. Devolver um circuito.")
      escreval("4. Sair do menu circuitos.")
      leia(acao)

      se (acao = 1) entao
         se (nomeCircuito = "") entao
            escreval("")
            escreval("Qual o nome do circuito que você deseja cadastrar?")
            leia(nomeCircuito)
            escreval("")
            escreval("Qual o valor do circuito ", nomeCircuito ,"?")
            leia(valorCircuito)
         senao
            escreval("Você deseja modificar o nome ou o valor do seu circuito?")
            escreval("")
            escreval(nomeCircuito, "", valorCircuito)
            escreval("")
            escreval("1. Nome.")
            escreval("2. Valor.")
            escreval("3. Não desejo modificar.")
            leia(modificarCircuito)
            se (modificarCircuito = 1) entao
               escreval ("Insira um novo nome para o seu circuito.")
               leia(novoNome)
               nomeCircuito <- novoNome
            fimse
            se (modificarCircuito = 2) entao
               escreval ("Insira o novo valor do seu circuito.")
               leia (novoValor)
               valorCircuito <- novoValor
            fimse
            se (modificarCircuito = 3) entao
               escreval("Aperte ENTER para continuar.")
               leia(pausar)
            fimse
         fimse
         limpatela
      fimse

      se (acao = 2) entao
         se (nomeCircuito = "") entao
            escreval("")
            escreval("Por favor, cadastre um circuito primeiro.")
            escreval("")
         senao
            escreval("")
            escreval("Você deseja locar o circuito ", nomeCircuito, " ?")
            escreval("")
            escreval(nomeCircuito, " R$", valorCircuito)
            escreval("")
            escreval("1. Sim")
            escreval("2. Não")
            leia(locar)

            se (locar = 1) entao
               escreval("")
               escreval("O circuito ", nomeCircuito, " foi locado.")
               estadoCircuito <- 1
               receitaCircuito <- valorCircuito * (70/100)
               escreval("Aperte ENTER para continuar.")
               leia(pausar)
            senao
               se (locar = 2) entao
                  escreval("Aperte ENTER para continuar.")
                  leia(pausar)
                  escreval("")
               fimse
            fimse
         fimse
         limpatela
      fimse

      se (acao = 3) entao
         se (nomeCircuito = "") entao
            escreval("")
            escreval("Por favor, cadastre um circuito primeiro.")

            escreval("Aperte ENTER para continuar")
            leia(pausar)
            limpatela
         senao
            se (estadoCircuito = 0) entao
               escreval("")
               escreval("Nenhum circuito está alocado.")
               escreval("Aperte ENTER para continuar.")
               leia(pausar)
            senao
               escreval("Você deseja devolver o circuito ", nomeCircuito, "?")
               escreval("1. Sim")
               escreval("2. Não")
               leia (devolverCircuito)

               se (devolverCircuito = 1) entao
                  escreval("O circuito ", nomeCircuito," foi devolvido.")
                  estadoCircuito <- 0
                  escreval("Aperte ENTER para continuar.")
                  leia(pausar)
               senao
                  se (devolverCircuito = 2) entao
                     escreval("")
                     escreval("Aperte ENTER para continuar.")
                     leia(pausar)
                  fimse
               fimse
            fimse
         fimse
         limpatela
      fimse
   ate (acao = 4)

   limpatela
fimfuncao



//ATUALIZAR DIA

funcao atualizarDia: inteiro
var
   valor, opcao: inteiro

inicio


   escreval ("Você deseja atualizar o dia?")
   escreval ("1. SIM.")
   escreval ("2. NÃO.")

   leia (opcao)

   se (opcao=1) entao

      estadoCircuito <- 0
      limpatela
      escreval("O circuito foi atualizado")
      escreval("")
      escreval("Clique ENTER para continuar.")
      leia(pausar)
      limpatela
      escreval("Quais dos seguintes karts deseja renovar?")
      escreval("")
      escreval("")
      escreval("Clique ENTER para continuar.")

      para i de 1 ate 15 faca
         se (estadoLocacao[i] = 1) entao
            //perguntar se quer manter

            escreval(listarLocados)

            escreval("Digite o número do Kart que você deseja re:")
            leia(valor)
         fimse
      fimpara

      para i de 1 ate 15 faca
         se ((kartsNum[i] = valor) e (estadoLocacao[i] = 1) e (kartsCadastrado[i] = 1)) entao
            escreval("")
            escreval("Você devolveu o seguinte Kart:")

            escreval("")
            escreval("Número do Kart: ", kartsNum[i])
            escreval("Modelo: ", modelos[i])
            escreval("Preço: ", precos[i])
            escreval("Vezes em que foi locado: ", vezesLocado[i])
            escreval("")

            estadoLocacao[i] <- 0 //Marca como disponível
         fimse
      fimpara

      se (estadoLocacao[i] = 0) entao
         escreval ("Não há karts locados")
      fimse
      leia(pausar)


   senao
      se (opcao=2) entao
         escreval("Clique ENTER para continuar.")
         leia(pausar)
      fimse
      limpatela
   fimse
   limpatela






fimfuncao




Inicio
   para i de 1 ate 15 faca
      kartsCadastrado[i] <- 0
   fimpara

   repita
      decisao <- menu

      //Cadastrar Kart
      se (decisao = 1) entao
         escreval(cadastrar)
         escreval("")
      fimse

      //Listar Karts disponíveis
      se (decisao = 2) entao
         escreval(listarDisponiveis)
         escreval("")
      fimse

      //Listar Karts locados
      se (decisao = 3) entao
         escreval(listarLocados)
         escreval("")
      fimse

      //Alugar um Kart
      se (decisao = 4) entao
         escreval(alocarKart)
         escreval("")
      fimse

      //Devolver um kart
      se (decisao = 5) entao
         escreval(devolverKart)
         escreval("")
      fimse

      //Kart que mais gerou lucro
      se (decisao = 6) entao
         escreval(melhorKart)
         escreval("")
      fimse

      //Locação de Circuito
      se (decisao = 8) entao
         escreval(locarCircuito)
         escreval("")
      fimse

      //AtualizarDia
      se (decisao = 9) entao
         escreval(atualizarDia)
         escreval("")
      fimse

   ate (decisao=10)

Fimalgoritmo
