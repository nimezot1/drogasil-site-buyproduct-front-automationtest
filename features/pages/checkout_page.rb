class CheckoutPage < SitePrism::Page
    set_url '/'

    element :btnFinalizarCompra, :xpath, '//*[@data-qa="btn_finish"]'

    def finalizar_compra_checkout
      btnFinalizarCompra.visible?
      btnFinalizarCompra.click
    end
end