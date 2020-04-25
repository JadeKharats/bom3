class Me::ShowPage < MainLayout
  def content
    h1 "Compte :  #{@current_user.email}"
    today_mood
  end

  private def today_mood
    h3 "Humeur du jour"
  end
end
