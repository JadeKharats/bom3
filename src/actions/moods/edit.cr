class Moods::Edit < BrowserAction
  route do
    mood = MoodQuery.find(mood_id)
    html EditPage,
      operation: SaveMood.new(mood),
      mood: mood
  end
end
