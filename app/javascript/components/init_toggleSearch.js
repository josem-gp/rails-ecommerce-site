const toggleSearch = () => {
  const searchBtn = document.querySelector(".search-btn");
  const searchForm = document.querySelector("#query");

  if (searchBtn) {
    searchBtn.addEventListener("click", (event) => {
      if (
        !searchForm.classList.contains("close-search") &&
        searchForm.value !== ""
      ) {
      } else if (
        searchForm.classList.contains("close-search") ||
        searchForm.value === ""
      ) {
        console.log("hi");
        event.preventDefault();
        searchForm.classList.toggle("close-search");
        searchForm.classList.toggle("open-search");
      }
    });
  }
};

export { toggleSearch };
