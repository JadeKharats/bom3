class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    tag("section", class: "hero is-primary is-fullheight-with-navbar") do
      div(class: "hero-body") do
        div(class: "container has-text-centered") do
          title
          render_sign_up_form(@operation)
        end
      end
      div(class: "hero-foot") do
        render_footer
      end
    end
  end

  private def title
    h1(class: "title") do
      text "Inscription"
    end
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      submit "S'inscrire", flow_id: "sign-up-button", class: "button is-primary is-inverted is-medium"
    end
  end

  private def sign_up_fields(op)
    mount Shared::Field.new(op.email, "Courriel"), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.pseudo, "Pseudonyme")
    mount Shared::Field.new(op.password, "Mot de passe"), &.password_input
    mount Shared::Field.new(op.password_confirmation, "Confirmation de mot de passe"), &.password_input
  end

  private def render_footer
    tag("nav", class: "tabs is-boxed is-fullwidth") do
      div(class: "container") do
        ul do
          li do
            link "Mot de passe perdu?", to: PasswordResetRequests::New
          end
          li do
            link "Déjà un compte?", to: SignIns::New
          end
        end
      end
    end
  end
end
