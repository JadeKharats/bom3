class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def content
    tag("section", class: "hero is-primary is-fullheight") do
      title
      render_sign_in_form(@operation)
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
      submit "Se connecter", flow_id: "sign-in-button", class: "btn"
    end
    link "Mot de passe perdu?", to: PasswordResetRequests::New
    link "S'inscire", to: SignUps::New
  end

  private def sign_in_fields(op)
    mount Shared::Field.new(op.email, "Courriel"), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password, "Mot de passe"), &.password_input
  end
end
