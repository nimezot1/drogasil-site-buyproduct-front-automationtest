Dir[File.join(File.dirname(__FILE__),
              '../pages/*.rb')].sort.each { |file| require file }

# modulos para chamar as classes instanciadas
module PageObjects
  def login_page
    LoginPage.new
  end

  def home_page
    HomePage.new
  end

  def pdp_page
    PdpPage.new
  end

  def checkout_page
    CheckoutPage.new
  end

  def firecheckout_page
    FirecheckoutPage.new
  end
  
  def success_page
    SuccessPage.new
  end
end
