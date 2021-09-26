const dropdownNav = () => {
  const navBtn = document.querySelector(".navbar-toggler");
  const dropDiv = document.querySelector(".navbar-collapse");
  const body = document.querySelector("body");

  navBtn.addEventListener("click", (event) => {
    event.preventDefault();
    navBtn.classList.toggle("btn-menu");
    navBtn.classList.toggle("btn-change");

    dropDiv.classList.toggle("dropdown-nav");
    body.classList.toggle("fixed-body");
  });
};

export { dropdownNav };
