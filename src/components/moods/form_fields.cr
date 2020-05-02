class Moods::FormFields < BaseComponent
  needs operation : SaveMood

  def render
    # mount Shared::Field.new(operation.level), &.text_input(autofocus: "true")
    render_select_level(operation)
    mount Shared::Field.new(operation.comment)
  end

  private def render_select_level(op)
    label_for(op.level, "Votre humeur", class: "label is-medium has-text-light")
    raw "<select name=\"mood:level\" class=\"input\">
          <option value=\"1\">Journée HO-RI-BLEUH</option>
          <option value=\"2\">Pas terrible</option>
          <option value=\"3\" selected=\"true\">Normale</option>
          <option value=\"4\">Plutot bonne journée</option>
          <option value=\"5\">Béni par Titania et Oberon</option>
        </select>"
  end
end
