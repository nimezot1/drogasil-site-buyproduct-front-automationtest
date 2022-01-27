class SuccessPage < SitePrism::Page
    set_url '/'

    element :numPedido, :xpath, '//*[@data-qa="nr_pedido"]'
    element :btnFecharModal, :xpath, '/html/body/div[12]/div/div/div[2]/button/i'
    
    def numero_pedido
      # AGUARDAR O CARREGAMENTO DA PAGINA (demora da porra)
      sleep 10
      numPedido.visible?
      p numPedido.text
    end

    def fechar_modal_pesquisa
      btnFecharModal.visible?
      btnFecharModal.click
    end
end