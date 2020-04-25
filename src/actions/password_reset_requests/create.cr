class PasswordResetRequests::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  route do
    RequestPasswordReset.new(params).submit do |operation, user|
      if user
        PasswordResetRequestEmail.new(user).deliver
        flash.success = "Vous devriez recevoir un courriel avec la procédure à suivre"
        redirect SignIns::New
      else
        html NewPage, operation: operation
      end
    end
  end
end
