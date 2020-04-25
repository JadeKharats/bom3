class Moods::New < BrowserAction
  route do
    html NewPage, operation: SaveMood.new
  end
end
