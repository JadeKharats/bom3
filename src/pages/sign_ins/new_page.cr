class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def content
    tag("section", class: "hero is-primary is-fullheight-with-navbar") do
      div(class: "hero-body") do
        div(class: "container has-text-centered") do
          title
          render_sign_in_form(@operation)
        end
      end
      div(class: "hero-foot") do
        render_footer
      end
    end
  end

  private def title
    h1(class: "title") do
      text "Connexion"
    end
  end

  private def render_sign_in_form(op)
    form_for SignIns::Create do
      sign_in_fields(op)
      submit "Se connecter", flow_id: "sign-in-button", class: "button is-primary is-inverted is-medium"
    end
  end

  private def sign_in_fields(op)
    mount Shared::Field.new(op.email, "Courriel"), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password, "Mot de passe"), &.password_input
  end

  private def render_footer
    tag("nav", class: "tabs is-boxed is-fullwidth") do
      div(class: "container") do
        ul do
          li do
            link "Mot de passe perdu?", to: PasswordResetRequests::New
          end
          li do
            link "S'inscrire", to: SignUps::New
          end
        end
      end
    end
  end
end
