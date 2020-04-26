class Me::Edit < BrowserAction
  get "/me/edit" do
    user = current_user
    html EditPage,
      operation: SaveUser.new(user),
      user: user
  end
end
