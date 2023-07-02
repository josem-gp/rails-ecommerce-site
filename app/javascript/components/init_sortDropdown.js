const sortDropdown = () => {
  const dropdownBtn = document.querySelector(".sort_drop");
  const dropdownMenu = document.querySelector(".made-dropdown-menu");

  if (dropdownBtn) {
    // Toggle dropdown menu visibility
    dropdownBtn.addEventListener("click", (event) => {
      event.preventDefault();
      dropdownBtn.firstElementChild.classList.toggle("upwards");
      dropdownMenu.classList.toggle("show");
    });

    // Close dropdown when clicking outside
    document.addEventListener("click", (event) => {
      const target = event.target;
      if (!dropdownBtn.contains(target) && !dropdownMenu.contains(target)) {
        dropdownBtn.firstElementChild.classList.remove("upwards");
        dropdownMenu.classList.remove("show");
      }
    });
  }
};

export { sortDropdown };
