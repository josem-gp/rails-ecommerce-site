const fixSortDropdown = () => {
  const dropdownBtn = document.querySelector(".sort_drop");
  const dropdownMenu = document.querySelector(".dropdown-menu");

  dropdownBtn.addEventListener("click", (event) => {
    event.preventDefault();
    dropdownMenu.classList.contains("show")
      ? dropdownMenu.classList.remove("show")
      : dropdownMenu.classList.add("show");
  });
};

export { fixSortDropdown };
