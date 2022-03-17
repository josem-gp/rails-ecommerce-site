const sendingContactForm = () => {
  const contactFormBtn = document.querySelector(".send-btn");
  const contactSendIcon = document.querySelector(".replace");
  const contactHiddenIcon = document.querySelector(".hidden");

  if (contactFormBtn) {
    const contactFormName = document.querySelector("#contact_name");
    const contactFormEmail = document.querySelector("#contact_email");
    const contactFormArea = document.querySelector("#contact_message");
    const elements = [contactFormArea, contactFormName, contactFormEmail];

    contactFormBtn.addEventListener("click", (event) => {
      if (
        !contactFormName.value &&
        !contactFormEmail.value &&
        !contactFormArea.value
      ) {
      } else {
        event.preventDefault();
        contactSendIcon.classList.add("flying");
        contactHiddenIcon.classList.remove("hidden");
        contactHiddenIcon.classList.add("showing");
        document.querySelector("#submit-input").value = "Sent";
        document.querySelector("#submit-input").classList.add("fading");
        setTimeout(function () {
          document.querySelector("#new_contact").submit();
        }, 2000);
      }
    });
  }
};

export { sendingContactForm };
