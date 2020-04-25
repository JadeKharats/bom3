class Moods::Update < BrowserAction
  route do
    mood = MoodQuery.find(mood_id)
    SaveMood.update(mood, params) do |operation, mood|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(mood.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, mood: mood
      end
    end
  end
end
