const loginError = () => {
  const emailDiv = document.querySelector('input[name="user[email]"');
  const passwordDiv = document.querySelector('input[name="user[password]"');
  const checkboxDiv = document.querySelector("#user_remember_me");
  if (emailDiv && passwordDiv && checkboxDiv) {
    if (
      emailDiv.classList.contains("is-valid") ||
      passwordDiv.classList.contains("is-valid")
    ) {
      emailDiv.classList.remove("is-valid");
      emailDiv.classList.add("invalid-neutral");
      passwordDiv.classList.remove("is-valid");
      passwordDiv.classList.add("invalid-neutral");
      checkboxDiv.classList.remove("is-valid");
    }
  }
};

export { loginError };
