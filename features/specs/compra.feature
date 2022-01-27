# language: pt

@comprar_remedio
Funcionalidade: Regressivo Desktop - Impróprios
  Eu como cliente da Drogasil
  Quero garantir realizar uma compra no site com o pagamento via boleto

  @compra_valida
  Cenário: Login e finalização de pedido via boleto
    Dado que estou logado com o usuario 'valido_qa'
    Quando a pagina home será apresentada
    E producuro pelo produto 'valido' e adiciono
    E acesso a cesta
    E finalizo a compra no checkout
    E escolho o tipo de entrega
    E finalizo a compra com o tipo de pagamento boleto
    Então tenho o numero do pedido