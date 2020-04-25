class Me::Show < BrowserAction
  get "/me" do
    my_moods = MoodQuery.new.user_id(current_user.id).time.desc_order.limit(5)
    html ShowPage, my_moods: my_moods
  end
end
