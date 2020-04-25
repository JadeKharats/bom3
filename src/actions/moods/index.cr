class Moods::Index < BrowserAction
  route do
    html IndexPage, moods: MoodQuery.new
  end
end
