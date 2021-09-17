console.log("hi");

const stars = document.querySelectorAll("input[type='radio']");

const ratings = () => {
  stars.forEach((star) => {
    star.addEventListener("mouseover", (event) => {
      const filteredStars = Array.from(stars).filter(
        (star) => parseInt(star.value, 10) <= parseInt(event.target.value, 10)
      );

      filteredStars.forEach((filtered) => {
        filtered.parentElement.classList.add("full-star");
      });
    });

    star.addEventListener("mouseleave", (event) => {
      const filteredStars = Array.from(stars).filter(
        (star) => parseInt(star.value, 10) <= parseInt(event.target.value, 10)
      );

      filteredStars.forEach((filtered) => {
        filtered.parentElement.classList.remove("full-star");
      });
    });

    star.addEventListener("click", (event) => {
      stars.forEach((star) => {
        star.parentElement.classList.remove("active");
      });

      const filteredStars = Array.from(stars).filter(
        (star) => parseInt(star.value, 10) <= parseInt(event.target.value, 10)
      );

      filteredStars.forEach((filtered) => {
        filtered.parentElement.classList.add("active");
      });
    });
  });
};

export default ratings();
