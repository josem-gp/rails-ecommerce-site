const openMenuNav = () => {
  const navBtn = document.querySelector(".navbar-toggler");
  const dropDiv = document.querySelector(".navbar-collapse");
  const restBody = document.querySelectorAll("body > *:not(.navbar)");
  const navBar = document.querySelector(".navbar");

  navBtn.addEventListener("click", (event) => {
    event.preventDefault();
    navBtn.classList.toggle("btn-menu");
    navBtn.classList.toggle("btn-change");

    dropDiv.classList.toggle("closing-menu");
    dropDiv.classList.toggle("opening-menu");
    navBar.classList.toggle("move-right");
    document.querySelector("body").classList.toggle("fixed-body");
    restBody.forEach((el) => {
      el.classList.toggle("lay-down");
    });
  });
};

export { openMenuNav };
