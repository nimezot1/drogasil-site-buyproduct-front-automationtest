Dado('que estou logado com o usuario {string}') do |usuario|
  login_page.load
  login_page.login(usuario)
end

Quando('a pagina home será apresentada') do
  home_page.validar_pagina_home
end

Quando('producuro pelo produto {string} e adiciono') do |produto|
  home_page.validar_busca
  home_page.buscar_produto(produto)
  home_page.acessar_pdp

  pdp_page.comprar_produto_pdp
end

Quando('acesso a cesta') do
  home_page.acessar_cesta
end

Quando('finalizo a compra no checkout') do
  checkout_page.finalizar_compra_checkout
end

Quando('escolho o tipo de entrega') do
  firecheckout_page.tipo_entrega
  firecheckout_page.continuar_pedido
end

Quando('finalizo a compra com o tipo de pagamento boleto') do
  firecheckout_page.opcao_boleto
  firecheckout_page.finalizar_pedido
end

Então('tenho o numero do pedido') do
  # success_page.fechar_modal_pesquisa
  success_page.numero_pedido
end
