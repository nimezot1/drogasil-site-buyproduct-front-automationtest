class FirecheckoutPage < SitePrism::Page
    set_url '/'

    # element :escolherEntrega, :xpath, '/html/body/div[4]/main/div/div/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/label'
    # element :escolherEntrega2, :xpath, '//*[@data-qa="check_delivery_method"]'
    element :btnContinuar, :xpath, '//*[@data-qa="button-finish-delivery"]'
    # element :opcaoBoleto, :xpath, '/html/body/div[4]/main/div/div/div/div[3]/div[1]/div/div[1]/div/div[1]/div/div/div'
    element :btnFinalizar, :xpath, '//*[@data-qa="btn_finish"]'

    def tipo_entrega
      # ESPERA PARA CARREGAR OS TIPOS DE ETREGA
      sleep 5
      # escolherEntrega2.visible?
      # escolherEntrega2.click.first
      first(:xpath, '//*[@data-qa="check_delivery_method"]').click
    end

    def continuar_pedido
      btnContinuar.visible?
      btnContinuar.click
    end

    def opcao_boleto
      # opcaoBoleto.visible?
      # opcaoBoleto.click
      first(:xpath, '//*[@data-qa="billet"]').click
    end

    def finalizar_pedido
      btnFinalizar.visible?
      btnFinalizar.click
    end
end