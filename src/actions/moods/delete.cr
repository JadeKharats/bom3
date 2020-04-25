class Moods::Delete < BrowserAction
  route do
    MoodQuery.find(mood_id).delete
    flash.success = "Humeur supprimée"
    redirect Index
  end
end
