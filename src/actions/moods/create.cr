class Moods::Create < BrowserAction
  route do
    SaveMood.create(params) do |operation, mood|
      if mood
        flash.success = "Humeur enregistrée"
        redirect Show.with(mood.id)
      else
        flash.failure = "Il semblerait que le formulaire ne soit pas correct"
        html NewPage, operation: operation
      end
    end
  end
end
