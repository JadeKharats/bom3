class Home::IndexPage < AuthLayout
  def content
    tag("section", class: "main") do
      background
      title
      button
    end
  end

  private def background
    div(class: "background-image")
  end

  private def title
    h1 "Bienvenue Sur BOM3"
    h3 "Comment vous sentez-vous?"
  end

  private def button
    link "Se connecter", to: SignIns::New, class: "btn"
  end
end
