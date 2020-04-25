abstract class MainLayout
  include Lucky::HTMLPage

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User

  abstract def content
  abstract def page_title

  # MainLayout defines a default 'page_title'.
  #
  # Add a 'page_title' method to your indivual pages to customize each page's
  # title.
  #
  # Or, if you want to require every page to set a title, change the
  # 'page_title' method in this layout to:
  #
  #    abstract def page_title : String
  #
  # This will force pages to define their own 'page_title' method.
  def page_title
    "Bienvenue"
  end

  def render
    html_doctype

    html lang: "fr" do
      mount Shared::LayoutHead.new(page_title: page_title, context: context)

      body do
        mount Shared::FlashMessages.new(context.flash)
        tag("section", class: "hero is-primary is-fullheight-with-navbar") do
          div(class: "hero-body") do
            div(class: "container has-text-centered") do
              content
            end
          end
          div(class: "hero-foot") do
            render_footer
          end
        end
      end
    end
  end

  private def render_footer
    tag("nav", class: "tabs is-boxed is-fullwidth") do
      div(class: "container") do
        ul do
          li do
            link "Profile", to: Me::Show
          end
          li do
            link "Quitter", to: SignIns::Delete, flow_id: "sign-out-button"
          end
        end
      end
    end
  end
end
