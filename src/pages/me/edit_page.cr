
class Me::EditPage < MainLayout
  needs operation : SaveUser
  needs user : User
  quick_def page_title, "Edit User with id: #{@user.id}"

  def content
    h1(class: "title") do
      text "Edition du profil"
    end
    render_user_form(@operation)
  end

  def render_user_form(op)
    form_for Me::Update.with(@user.id) do
      # Edit fields in src/components/moods/form_fields.cr
      mount Users::FormFields.new(op)

      submit "Mettre à jour", data_disable_with: "Updating...", class: "button is-primary is-inverted is-medium"
    end
  end
end
