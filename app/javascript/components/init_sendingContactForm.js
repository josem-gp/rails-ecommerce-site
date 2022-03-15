const sendingContactForm = () => {
  const contactFormBtn = document.querySelector(".send-btn");
  const contactSendIcon = document.querySelector(".replace");
  const contactHiddenIcon = document.querySelector(".hidden");

  if (contactFormBtn) {
    const contactFormName = document.querySelector("#contact_name").value;
    const contactFormEmail = document.querySelector("#contact_email").value;
    const contactFormArea = document.querySelector("#contact_message").value;

    contactFormBtn.addEventListener("click", (event) => {
      if (!contactFormName && !contactFormEmail && !contactFormArea) {
      } else {
        contactSendIcon.classList.add("flying");
        contactHiddenIcon.classList.remove("hidden");
        contactHiddenIcon.classList.add("showing");
        document.querySelector("#submit-input").value = "Sent";
        document.querySelector("#submit-input").classList.add("fading");
      }
    });
  }
};

export { sendingContactForm };
