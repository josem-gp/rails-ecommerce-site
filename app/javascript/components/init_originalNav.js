function handleTableChange(e) {
  const navBtn = document.querySelector(".navbar-toggler");
  const dropDiv = document.querySelector(".navbar-collapse");
  const body = document.querySelector("body");
  const restBody = document.querySelectorAll("body > *:not(.navbar)");
  const navBar = document.querySelector(".navbar");

  if (e.matches) {
    navBtn.classList.add("btn-menu");
    navBtn.classList.remove("btn-change");

    dropDiv.classList.remove("dropdown-nav");
    body.classList.remove("fixed-body");
    restBody.forEach((el) => {
      el.classList.remove("lay-down");
    });
    navBar.classList.remove("move-right");
  }
}

const originalNav = () => {
  const mediaQuery = window.matchMedia("(min-width: 992px)");
  mediaQuery.addListener(handleTableChange);
  handleTableChange(mediaQuery);
};

export { originalNav };
