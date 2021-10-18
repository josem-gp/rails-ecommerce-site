const sortDropdown = () => {
  const dropdownBtn = document.querySelector(".sort_drop");
  const dropdownMenu = document.querySelector(".made-dropdown-menu");

  if (dropdownBtn) {
    dropdownBtn.addEventListener("click", (event) => {
      event.preventDefault();
      dropdownBtn.firstElementChild.classList.toggle("upwards");
      dropdownMenu.classList.toggle("show");
    });
  }
};

export { sortDropdown };
