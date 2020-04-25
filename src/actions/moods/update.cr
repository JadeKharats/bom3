class Moods::Update < BrowserAction
  route do
    mood = MoodQuery.find(mood_id)
    SaveMood.update(mood, params) do |operation, mood|
      if operation.saved?
        flash.success = "Enregistrement mis à jour"
        redirect Show.with(mood.id)
      else
        flash.failure = "Il semblerait que le formulaire ne soit pas correct"
        html EditPage, operation: operation, mood: mood
      end
    end
  end
end
