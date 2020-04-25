class SignUps::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  post "/sign_up" do
    SignUpUser.create(params) do |operation, user|
      if user
        flash.info = "Merci pour votre inscription"
        sign_in(user)
        redirect to: Home::Index
      else
        flash.info = "Nous n'arrivons pas à vous inscrire"
        html NewPage, operation: operation
      end
    end
  end
end
