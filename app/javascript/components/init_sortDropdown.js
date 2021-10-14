const sortDropdown = () => {
  const dropdownBtn = document.querySelector(".sort_drop");
  const dropdownMenu = document.querySelector(".made-dropdown-menu");

  dropdownBtn.addEventListener("click", (event) => {
    event.preventDefault();
    dropdownMenu.classList.toggle("show");
  });
};

export { sortDropdown };
