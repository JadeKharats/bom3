module Auth::PasswordResets::TokenFromSession
  private def token : String
    session.get?(:password_reset_token) || raise "Ce token est absent"
  end
end
