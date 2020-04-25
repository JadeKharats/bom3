class SignIns::Delete < BrowserAction
  delete "/sign_out" do
    sign_out
    flash.info = "Merci de votre visite"
    redirect to: SignIns::New
  end
end
