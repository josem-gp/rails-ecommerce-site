const openEditForm = () => {
  const editForm = document.querySelector(".flex-edit-form");
  const hybridForm = document.querySelectorAll(".hybrid-edit-form-flex div");

  if (window.innerWidth > 991) {
    hybridForm.forEach((el) => {
      el.style.width === ""
        ? (el.style.width = "300px")
        : (el.style.width = "");
    });
  } else {
    editForm.style.height === ""
      ? (editForm.style.height = "300px")
      : (editForm.style.height = "");
  }
};

export { openEditForm };
