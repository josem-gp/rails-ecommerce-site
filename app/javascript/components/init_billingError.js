const billingError = () => {
  const submitBilling = document.querySelector(
    'input[value="Change billing information"]'
  );
  const billingDiv = document.querySelector(
    'input[name = "order[billing_address]"]'
  );
  const billingWrapper = document.querySelector("#billing");

  if (submitBilling) {
    submitBilling.addEventListener("click", (event) => {
      billingDiv.classList.remove("invalid-billing");
      billingWrapper.classList.remove("invalid-billing-div");

      if (billingDiv.value) {
      } else if (!billingDiv.value) {
        event.preventDefault();
        billingDiv.classList.add("invalid-billing");
        billingWrapper.classList.add("invalid-billing-div");
      }
    });
  }
};

export { billingError };
