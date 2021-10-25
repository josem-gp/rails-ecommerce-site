const prefillingStripe = () => {
  const fullName = document.querySelector("#fullname");
  const stripeName = document.querySelector(".addressNameInput");

  if (stripeName) {
    stripeName.firstElementChild.value = fullName.innerText;
  }
};

export { prefillingStripe };
