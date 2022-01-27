class PdpPage < SitePrism::Page
    # set_url '/'

    element :btnComprar, :xpath, '//*[@data-qa="PDP_btn_buy"]'
    
    def comprar_produto_pdp
      btnComprar.visible?
      btnComprar.click
    end
end