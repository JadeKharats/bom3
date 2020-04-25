class Home::IndexPage < AuthLayout
  def content
    tag("section", class: "hero is-primary is-fullheight") do
      div(class: "hero-body") do
        div(class: "container has-text-centered") do
          title
          button
        end
      end
    end
  end

  private def background
    div(class: "background-image")
  end

  private def title
    h1(class: "title") do
      text "Bienvenue Sur BOM3"
    end
    h2(class: "subtitle") do
      text "Comment vous sentez-vous?"
    end
  end

  private def button
    link "Se connecter", to: SignIns::New, class: "button is-primary is-inverted"
  end
end
