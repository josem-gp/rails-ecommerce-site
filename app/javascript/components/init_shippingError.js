const shippingError = () => {
  const submitChangeShipping = document.querySelector(
    'input[value="Change shipping information"]'
  );
  const submitCreateShipping = document.querySelector(
    'input[value="Add shipping information"]'
  );
  const submit = [submitChangeShipping, submitCreateShipping];
  const nameDiv = document.querySelector('input[name = "user[name]"]');
  const shippingDiv = document.querySelector(
    'input[name = "user[shipping_address]"]'
  );
  const phoneDiv = document.querySelector('input[name = "user[phone_number]"]');
  const nameWrapper = document.querySelector("#name");
  const shippingWrapper = document.querySelector("#shipping_address");
  const phoneWrapper = document.querySelector("#phone");

  if (submitChangeShipping || submitCreateShipping) {
    submit.forEach((btn) => {
      if (btn) {
        btn.addEventListener("click", (event) => {
          console.log("and here!");
          nameDiv.classList.remove("invalid-name");
          nameDiv.classList.remove("valid-name");
          shippingDiv.classList.remove("invalid-shipping");
          shippingDiv.classList.remove("valid-shipping");
          phoneDiv.classList.remove("invalid-phone");
          phoneDiv.classList.remove("valid-phone");
          nameWrapper.classList.remove("invalid-name-div");
          shippingWrapper.classList.remove("invalid-shipping-div");
          phoneWrapper.classList.remove("invalid-phone-div");

          if (nameDiv.value && shippingDiv.value && phoneDiv.value) {
          } else if (!nameDiv.value || !shippingDiv.value || !phoneDiv.value) {
            event.preventDefault();
            if (!nameDiv.value && !shippingDiv.value && !phoneDiv.value) {
              shippingDiv.classList.add("invalid-shipping");
              phoneDiv.classList.add("invalid-phone");
              nameDiv.classList.add("invalid-name");
              nameWrapper.classList.add("invalid-name-div");
              shippingWrapper.classList.add("invalid-shipping-div");
              phoneWrapper.classList.add("invalid-phone-div");
            } else if (!nameDiv.value && shippingDiv.value && phoneDiv.value) {
              shippingDiv.classList.add("valid-shipping");
              phoneDiv.classList.add("valid-phone");
              nameDiv.classList.add("invalid-name");
              nameWrapper.classList.add("invalid-name-div");
            } else if (!nameDiv.value && shippingDiv.value && !phoneDiv.value) {
              shippingDiv.classList.add("valid-shipping");
              phoneDiv.classList.add("invalid-phone");
              phoneWrapper.classList.add("invalid-phone-div");
              nameDiv.classList.add("invalid-name");
              nameWrapper.classList.add("invalid-name-div");
            } else if (!nameDiv.value && !shippingDiv.value && phoneDiv.value) {
              shippingDiv.classList.add("invalid-shipping");
              shippingWrapper.classList.add("invalid-shipping-div");
              phoneDiv.classList.add("valid-phone");
              nameDiv.classList.add("invalid-name");
              nameWrapper.classList.add("invalid-name-div");
            } else if (nameDiv.value && !shippingDiv.value && !phoneDiv.value) {
              shippingDiv.classList.add("invalid-shipping");
              shippingWrapper.classList.add("invalid-shipping-div");
              phoneDiv.classList.add("invalid-phone");
              phoneWrapper.classList.add("invalid-phone-div");
              nameDiv.classList.add("valid-name");
            } else if (nameDiv.value && shippingDiv.value && !phoneDiv.value) {
              shippingDiv.classList.add("valid-shipping");
              phoneDiv.classList.add("invalid-phone");
              phoneWrapper.classList.add("invalid-phone-div");
              nameDiv.classList.add("valid-name");
            } else if (nameDiv.value && !shippingDiv.value && phoneDiv.value) {
              shippingDiv.classList.add("invalid-shipping");
              shippingWrapper.classList.add("invalid-shipping-div");
              phoneDiv.classList.add("valid-phone");
              nameDiv.classList.add("valid-name");
            }
          }
        });
      }
    });
  }
};

export { shippingError };
