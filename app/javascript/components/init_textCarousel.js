const textCarousel = () => {
  const carousel = document.querySelector(".carousel-inner");
  const carouselTitle = document.querySelector(".carousel-caption h1");
  const carouselSubtitle = document.querySelector(".carousel-caption p");
  const carouselBtns = document.querySelector(".cta-btns");

  if (carousel) {
    setTimeout(function () {
      carouselTitle.style.visibility = "visible";
    }, 2000);
    setTimeout(function () {
      carouselSubtitle.style.visibility = "visible";
    }, 2500);
    setTimeout(function () {
      carouselBtns.style.visibility = "visible";
    }, 3000);
  }
};

export { textCarousel };
