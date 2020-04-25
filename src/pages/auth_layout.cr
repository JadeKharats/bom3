abstract class AuthLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "Welcome"
  end

  def service_worker
    raw " <script>
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', () => {
        navigator.serviceWorker.register('/service-worker.js')
          .then((reg) => {
            console.log('Service worker registered.', reg);
          });
      });
      }
  </script>
    "
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead.new(page_title: page_title, context: context)

      body do
        mount Shared::FlashMessages.new(context.flash)
        content
        service_worker
      end
    end
  end
end
