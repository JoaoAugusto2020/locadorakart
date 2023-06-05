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
inicio
   se (qtdKarts < 15) entao
      escreval("indice = ",kartIndice)
      escreval("Informe o modelo do Kart: ")
      leia(modelos[kartIndice])
      escreval("Digite o valor de locação do Kart: ")
      leia(precos[kartIndice])

      lucroKart[kartIndice] <- (30/100) * precos[kartIndice] //calcula lucro do Kart
      estadoLocacao[kartIndice] <- 1 //Passa estado para "locado" (1)
      vezesLocado[kartIndice] <- vezesLocado[kartIndice] + 1 //Conta vezes locado
      kartsNum[kartIndice] <- kartIndice //Define o número do Kart
      kartsCadastrado[kartIndice] <- 1 //Marcar que existe um Kart no vetor
      qtdKarts <- qtdKarts + 1 //Contabilizar Karts
   senao
      escreval("Não é possível cadastrar mais Karts.")

      escreval("")
      escreval("Aperte ENTER para continuar")
      leia(pausar)
      limpatela
   fimse

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


Inicio
   para i de 1 ate 15 faca
      kartsCadastrado[i] <- 0
   fimpara
   
   repita
      decisao <- menu

      se (decisao = 1) entao
         escreval(cadastrar)
         escreval("")
      fimse


      se (decisao = 2) entao
         //
      fimse

   ate (decisao=10)

Fimalgoritmo