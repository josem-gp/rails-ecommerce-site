const ratingsError = () => {
  const ratings = document.querySelectorAll(".fa-star");
  const submitRating = document.querySelector('input[value="Create Review"]');
  const ratingsDiv = document.querySelector(".review_rating");
  const titleDiv = document.querySelector('input[name="review[title]"');
  const contenDiv = document.querySelector('textarea[name="review[content]"');
  if (submitRating) {
    submitRating.addEventListener("click", (event) => {
      console.log("clicked!");
      ratingsDiv.classList.remove("invalid-stars");
      titleDiv.classList.remove("invalid-title");
      contenDiv.classList.remove("invalid-content");

      if (
        ratings[0].classList.contains("active") &&
        titleDiv.value &&
        contenDiv.value
      ) {
        console.log("free!");
      } else if (
        !ratings[0].classList.contains("active") ||
        !titleDiv.value ||
        !contenDiv.value
      ) {
        event.preventDefault();
        console.log("doomed!");
        if (
          !ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          !contenDiv.value
        ) {
          console.log("one!");
          titleDiv.classList.add("invalid-title");
          contenDiv.classList.add("invalid-content");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          !ratings[0].classList.contains("active") &&
          titleDiv.value &&
          contenDiv.value
        ) {
          console.log("two!");
          titleDiv.classList.add("valid-title");
          contenDiv.classList.add("valid-content");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          !ratings[0].classList.contains("active") &&
          titleDiv.value &&
          !contenDiv.value
        ) {
          console.log("three!");
          titleDiv.classList.add("valid-title");
          contenDiv.classList.add("invalid-content");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          !ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          contenDiv.value
        ) {
          console.log("four!");
          titleDiv.classList.add("invalid-title");
          contenDiv.classList.add("valid-content");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          !contenDiv.value
        ) {
          console.log("five!");
          titleDiv.classList.add("invalid-title");
          contenDiv.classList.add("invalid-content");
          ratingsDiv.classList.add("valid-stars");
        } else if (
          ratings[0].classList.contains("active") &&
          titleDiv.value &&
          !contenDiv.value
        ) {
          console.log("six!");
          titleDiv.classList.add("valid-title");
          contenDiv.classList.add("invalid-content");
          ratingsDiv.classList.add("valid-stars");
        } else if (
          ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          contenDiv.value
        ) {
          console.log("seven!");
          titleDiv.classList.add("invalid-title");
          contenDiv.classList.add("valid-content");
          ratingsDiv.classList.add("valid-stars");
        }
      }
    });
  }
};

export { ratingsError };
