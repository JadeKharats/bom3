class SignIns::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  post "/sign_in" do
    SignInUser.new(params).submit do |operation, authenticated_user|
      if authenticated_user
        sign_in(authenticated_user)
        flash.success = "Bienvenue"
        Authentic.redirect_to_originally_requested_path(self, fallback: Home::Index)
      else
        flash.failure = "Nous n'arrivons pas à vous reconnaitre"
        html NewPage, operation: operation
      end
    end
  end
end
