class Moods::Show < BrowserAction
  route do
    html ShowPage, mood: MoodQuery.find(mood_id)
  end
end
