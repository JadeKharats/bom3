class Api::Moods::Index < ApiAction
  route do
    moods = MoodQuery.new.preload_user
    json MoodSerializer.for_collection(moods)
  end
end
