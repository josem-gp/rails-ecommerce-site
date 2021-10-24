const cartSteps = () => {
  const changeShipping = document.querySelector(".change-shipping-btn");
  const editShippingDiv = document.querySelector(".change-shipping-info");
  const changeBilling = document.querySelector(".change-billing-btn");
  const editBillingDiv = document.querySelector(".change-billing-info");

  if (changeShipping) {
    changeShipping.addEventListener("click", (event) => {
      editShippingDiv.classList.toggle("form-height-adjusted");
    });
  }
  if (changeBilling) {
    changeBilling.addEventListener("click", (event) => {
      editBillingDiv.classList.toggle("form-height-adjusted");
    });
  }
};

export { cartSteps };
