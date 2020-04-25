class Home::IndexPage < AuthLayout
  def content
    h1 "Bienvenue Sur BOM3"
    link "Se connecter", to: SignIns::New
  end
end
