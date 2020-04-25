class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    h1 "Inscription"
    render_sign_up_form(@operation)
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      submit "S'inscrire", flow_id: "sign-up-button"
    end
    link "Déjà un compte?", to: SignIns::New
  end

  private def sign_up_fields(op)
    mount Shared::Field.new(op.email, "Courriel"), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password, "Mot de passe"), &.password_input
    mount Shared::Field.new(op.password_confirmation, "Confirmation de mot de passe"), &.password_input
  end
end
