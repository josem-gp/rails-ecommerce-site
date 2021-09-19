const loginError = () => {
  const emailDiv = document.querySelector('input[name="user[email]"');
  const passwordDiv = document.querySelector('input[name="user[password]"');
  const checkboxDiv = document.querySelector("#user_remember_me");
  const errorTag = document.querySelector(".alert-warning");

  if (errorTag) {
    console.log("yes!");
    if (emailDiv && passwordDiv && checkboxDiv) {
      console.log("we here!");
      emailDiv.classList.remove("is-valid");
      emailDiv.classList.add("invalid-neutral");
      passwordDiv.classList.add("invalid-neutral");
      checkboxDiv.classList.remove("is-valid");
    }
  }
};

export { loginError };
