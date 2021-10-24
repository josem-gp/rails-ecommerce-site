const cartSteps = () => {
  const changeShipping = document.querySelector(".change-shipping-btn");
  const editShippingDiv = document.querySelector(".change-shipping-info");
  const changeBilling = document.querySelector(".change-billing-btn");
  const editBillingDiv = document.querySelector(".change-billing-info");
  const goStepOneBtn = document.querySelector(".go-step-one");
  const goStepOneBtnA = document.querySelector(".a-link");
  const goStepTwoBtn = document.querySelector(".go-step-two");
  const goStepThreeBtn = document.querySelector(".go-step-three");
  const formDivs = document.querySelectorAll(".form-step");
  const highlightTitle = document.querySelectorAll(".step");
  const stepBtnArray = [
    goStepOneBtn,
    goStepTwoBtn,
    goStepThreeBtn,
    goStepOneBtnA,
  ];

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
  if (!document.querySelector(".not-filled-shipping")) {
    formDivs.forEach((form) => {
      if (form.dataset.step === "three") {
        form.classList.contains("form-hidden")
          ? form.classList.remove("form-hidden")
          : "";
      } else {
        form.classList.contains("form-hidden")
          ? ""
          : form.classList.add("form-hidden");
      }
      highlightTitle.forEach((title) => {
        if (title.dataset.highlight === "three") {
          title.classList.contains("active-step")
            ? ""
            : title.classList.add("active-step");
        } else {
          title.classList.contains("active-step")
            ? title.classList.remove("active-step")
            : "";
        }
      });
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
        highlightTitle.forEach((title) => {
          if (ev.target.dataset.key === title.dataset.highlight) {
            title.classList.contains("active-step")
              ? ""
              : title.classList.add("active-step");
          } else {
            title.classList.contains("active-step")
              ? title.classList.remove("active-step")
              : "";
          }
        });
      });
    });
  }
};

export { cartSteps };
