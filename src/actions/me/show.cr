class Me::Show < BrowserAction
  get "/me" do
    my_moods = MoodQuery.new.user_id(current_user.id)
    html ShowPage, my_moods: my_moods
  end
end
