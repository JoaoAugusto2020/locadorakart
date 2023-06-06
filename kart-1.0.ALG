Algoritmo "mariokartx86"
// Disciplina   : Conceitos de Algoritmos
// Professor   : Gilberto Viana de Oliveira

Var

   pausar: caractere
   decisao, i: inteiro

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
         kartsNum[kartIndice] <- kartIndice //Define o número do Kart
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

   retorne ""
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
      //se existe um kart cadastrado e está disponível
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
   limpatela

   retorne ""
fimfuncao

funcao listarLocados: caractere
var
   valor: inteiro
inicio
   para i de 1 ate 15 faca
      se(kartsCadastrado[i] = 1) e (estadoLocacao[i] = 1) entao
         escreval("Número do Kart: ", kartsNum[i])
         escreval("Modelo: ", modelos[i])
         escreval("Preço: ", precos[i])
         escreval("")

      senao
         valor<-valor+1
      fimse
   fimpara
   se(valor=15)entao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("Nenhum Kart foi locado!")
         escreval("")
      fimse
   fimse
   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela

   retorne ""

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
         //vezesLocado[kartIndice] <- vezesLocado[kartIndice] + 1 ////Conta vezes locado
      fimse

   ate (decisao=10)

Fimalgoritmo
