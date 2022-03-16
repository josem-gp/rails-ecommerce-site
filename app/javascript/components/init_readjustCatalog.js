const readjustCatalog = () => {
  var filterDivs = document.querySelectorAll(".accordion"); //Using var instead of const to prevent error: Identifier has already been declared

  filterDivs.forEach((el) => {
    el.addEventListener("click", (event) => {
      el.classList.toggle("accordion-active");
      el.nextElementSibling.classList.toggle("hidden-filter-div");
      el.nextElementSibling.classList.toggle("open-filter-div");
    });
  });
};

export { readjustCatalog };
