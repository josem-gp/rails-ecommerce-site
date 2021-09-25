const disableStripe = () => {
  const submitCreateShipping = document.querySelector(
    'input[value="Add shipping information"]'
  );
  const checkOutBtn = document.querySelector(".stripe-button-el");

  if (submitCreateShipping) {
    checkOutBtn.disabled = true;
  } else {
    checkOutBtn.disabled = false;
  }
};

export { disableStripe };
