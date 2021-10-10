const filterProducts = () => {
  const cards = document.querySelectorAll(".mini-product-card");
  const starsFilter = document.querySelectorAll(".stars-filter .box");
  const priceFilter = document.querySelectorAll(".price-filter .box");

  const buttonsFilter = [starsFilter, priceFilter];

  buttonsFilter.forEach((button) => {
    button.forEach((el) => {
      el.addEventListener("click", (event) => {
        event.preventDefault();
        const target = event.currentTarget;
        const dataStars = event.currentTarget.parentElement.dataset.stars;
        const dataPrice = event.currentTarget.parentElement.dataset.price;
        console.log("hi");
        cards.forEach((element) => {
          if (
            element.dataset.stars === `${dataStars}` ||
            element.dataset.price >= `${dataPrice}`
          ) {
            element.classList.contains("disabled")
              ? element.classList.remove("disabled")
              : "";
          } else {
            element.classList.add("disabled");
          }
        });
      });
    });
  });
};

export { filterProducts };
