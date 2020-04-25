class Moods::Create < BrowserAction
  route do
    SaveMood.create(params, user_id: current_user.not_nil!.id, time: Time.utc) do |operation, mood|
      if mood
        flash.success = "Humeur enregistrée"
        # redirect Show.with(mood.id)
        redirect Me::Show
      else
        flash.failure = "Il semblerait que le formulaire ne soit pas correct"
        html NewPage, operation: operation
      end
    end
  end
end
