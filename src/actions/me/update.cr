class Me::Update < BrowserAction
  post "/me/update/:id" do
    user = UserQuery.find(current_user.id)
    SaveUser.update(user, params) do |operation, user|
      if operation.saved?
        flash.success = "Pseudo mis à jour"
        redirect Me::Show
      else
        flash.failure = "Il semblerait que le formulaire ne soit pas correct"
        html EditPage,
          operation: operation,
          user: user
      end
    end
  end
end
