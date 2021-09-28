const dropdownNav = () => {
  const navBtn = document.querySelector(".navbar-toggler");
  const dropDiv = document.querySelector(".navbar-collapse");
  const body = document.querySelector("body");
  const restBody = document.querySelectorAll("body > *:not(.navbar)");
  const navBar = document.querySelector(".navbar");

  navBtn.addEventListener("click", (event) => {
    event.preventDefault();
    navBtn.classList.toggle("btn-menu");
    navBtn.classList.toggle("btn-change");

    dropDiv.classList.toggle("dropdown-nav");
    dropDiv.classList.toggle("collapse");
    body.classList.toggle("fixed-body");
    restBody.forEach((el) => {
      el.classList.toggle("lay-down");
    });
    navBar.classList.toggle("move-right");
  });
};

export { dropdownNav };
