const cartSteps = () => {
  const changeShipping = document.querySelector(".change-shipping-btn");
  const editShippingDiv = document.querySelector(".change-shipping-info");
  const changeBilling = document.querySelector(".change-billing-btn");
  const editBillingDiv = document.querySelector(".change-billing-info");
  const goStepOneBtn = document.querySelector(".go-step-one");
  const goStepTwoBtn = document.querySelector(".go-step-two");
  const goStepThreeBtn = document.querySelector(".go-step-three");
  const formDivs = document.querySelectorAll(".form-step");
  const stepBtnArray = [goStepOneBtn, goStepTwoBtn, goStepThreeBtn];

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
  if (goStepOneBtn || goStepTwoBtn || goStepThreeBtn) {
    stepBtnArray.forEach((btn) => {
      btn.addEventListener("click", (ev) => {
        console.log(ev.target);
        formDivs.forEach((form) => {
          if (ev.target.dataset.key === form.dataset.step) {
            form.classList.contains("form-hidden")
              ? form.classList.remove("form-hidden")
              : "";
          } else {
            form.classList.contains("form-hidden")
              ? ""
              : form.classList.add("form-hidden");
          }
        });
      });
    });
  }
};

export { cartSteps };
