class HomePage < SitePrism::Page
    set_url '/'
  
    element :nomeUsuario, :xpath, '//*[@data-qa="user_logged"]'
    element :buscar, :xpath, '//*[@data-qa="search"]'
    element :teste, :xpath, '//*[@data-qa="header_btn_submit_search"]'
    element :btnPesquisar, :xpath, '//*[@data-qa="header_btn_submit_search"]'
    element :btnComprar, :xpath, '//*[@data-qa="caroussel_item_btn_b"]'
    element :btnCesta, :xpath, '//*[@data-qa="floating-cart"]'
    element :produtoCarrossel, :xpath, '/html/body/div[1]/main/div/div[3]/div/div[2]/div[2]/div/div/a/div/img'
  
    def validar_pagina_home
        sleep 2
        nomeUsuario.visible?
    end

    def validar_busca
        buscar.visible?
    end

    def buscar_produto(produto_sku)
        buscar.visible?
        btnPesquisar.visible?

        produto = PRODUTOS[:"#{produto_sku}"]
        buscar.set produto[:cod_produto]
        btnPesquisar.click
    end

    def acessar_cesta
        btnCesta.visible?
        btnCesta.click
    end

    def acessar_pdp
        # produtoCarrossel.visible?
        # produtoCarrossel.click
        url_produto = PRODUTOS[:valido][:full_url]
        visit url_produto
    end
end