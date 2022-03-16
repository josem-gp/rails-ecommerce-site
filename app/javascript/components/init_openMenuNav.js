const openMenuNav = () => {
  const navBtn = document.querySelector(".navbar-toggler");
  const dropDiv = document.querySelector(".navbar-collapse");
  const restBody = document.querySelectorAll("body > *:not(.navbar)");
  const navBar = document.querySelector(".navbar");
  const navBarBrand = document.querySelector(".navbar-brand");
  const navLinks = document.querySelectorAll(".nav-link");

  navBtn.addEventListener("click", (event) => {
    event.preventDefault();
    navBtn.classList.toggle("btn-menu");
    navBtn.classList.toggle("btn-change");

    dropDiv.classList.toggle("closing-menu");
    dropDiv.classList.toggle("opening-menu");
    navBar.classList.toggle("move-right");
    navBarBrand.style.textAlign === "left"
      ? (navBarBrand.style.textAlign = "center")
      : (navBarBrand.style.textAlign = "left");
    document.querySelector("body").classList.toggle("fixed-body");
    document.querySelector("html").classList.toggle("fixed-body");
    restBody.forEach((el) => {
      el.classList.toggle("lay-down");
    });
  });

  navLinks.forEach((el) => {
    el.addEventListener("click", (event) => {
      document.querySelector("body").classList.toggle("fixed-body");
      document.querySelector("html").classList.toggle("fixed-body");
      console.log("click");
    });
  });
};

export { openMenuNav };
