class LoginPage < SitePrism::Page
  set_url '/customer/account/login'

  element :username, :xpath, '//*[@id="emailCpf"]'
  element :password, :xpath, '//*[@id="password"]'
  element :btnLogin, :xpath, '//*[@data-qa="btn_signin"]'

  def login(usuario)
    cred = CREDS[:login][:"#{usuario}"]
    username.set cred[:username]
    password.set cred[:password]
    btnLogin.click
  end
end
