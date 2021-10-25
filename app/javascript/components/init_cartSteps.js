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
  const notFilledForm = document.querySelector(".not-filled-shipping");
  const hiddenForms = document.querySelectorAll(".hidden_form");

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
  if (!notFilledForm) {
    hiddenForms.forEach((hidden) => {
      if (hidden.classList.contains("two")) {
        if (hidden.classList.contains("checked")) {
          formDivs.forEach((form) => {
            if (form.dataset.step === "two") {
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
            if (title.dataset.highlight === "two") {
              title.classList.contains("active-step")
                ? ""
                : title.classList.add("active-step");
            } else {
              title.classList.contains("active-step")
                ? title.classList.remove("active-step")
                : "";
            }
          });
        } else {
          formDivs.forEach((form) => {
            if (form.dataset.step === "one") {
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
            if (title.dataset.highlight === "one") {
              title.classList.contains("active-step")
                ? ""
                : title.classList.add("active-step");
            } else {
              title.classList.contains("active-step")
                ? title.classList.remove("active-step")
                : "";
            }
          });
        }
      } else if (hidden.classList.contains("three")) {
        if (hidden.classList.contains("checked")) {
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
          });
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
        }
      }
    });
  }
  if (goStepOneBtn || goStepTwoBtn || goStepThreeBtn || goStepOneBtnA) {
    stepBtnArray.forEach((btn) => {
      btn.addEventListener("click", (ev) => {
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
        console.log(ev.target);
        if (ev.target.classList.contains("pass-data")) {
          hiddenForms.forEach((form) => {
            form.classList.contains(ev.target.dataset.key) &&
            form.classList.contains("not-checked")
              ? form.click()
              : "";
            form.classList.contains(ev.target.dataset.key) &&
            form.classList.contains("not-checked")
              ? form.nextElementSibling.click()
              : "";
          });
        }
      });
    });
  }
};

export { cartSteps };
