import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("turbo:load", () => {
  document.querySelectorAll('[data-bs-toggle="dropdown"]').forEach((el) => {

    if (!bootstrap.Dropdown.getInstance(el)) {
      new bootstrap.Dropdown(el);
    }
  });
});