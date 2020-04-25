class Moods::Delete < BrowserAction
  route do
    MoodQuery.find(mood_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
