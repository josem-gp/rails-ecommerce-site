const ratingsError = () => {
  const ratings = document.querySelectorAll(".fa-star");
  const submitRating = document.querySelector('input[value="Create Review"]');
  const ratingsDiv = document.querySelector(".review_rating");
  const titleDiv = document.querySelector('input[name="review[title]"');
  const contentDiv = document.querySelector('textarea[name="review[content]"');
  const titleWrapper = document.querySelector("#title");
  const contentWrapper = document.querySelector("#content");

  if (submitRating) {
    submitRating.addEventListener("click", (event) => {
      ratingsDiv.classList.remove("invalid-stars");
      contentDiv.classList.remove("valid-stars");
      titleDiv.classList.remove("invalid-title");
      titleDiv.classList.remove("valid-title");
      contentDiv.classList.remove("invalid-content");
      contentDiv.classList.remove("valid-content");
      titleWrapper.classList.remove("invalid-title-div");
      contentWrapper.classList.remove("invalid-content-div");

      if (
        ratings[0].classList.contains("active") &&
        titleDiv.value &&
        contentDiv.value
      ) {
      } else if (
        !ratings[0].classList.contains("active") ||
        !titleDiv.value ||
        !contentDiv.value
      ) {
        event.preventDefault();
        if (
          !ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          !contentDiv.value
        ) {
          titleDiv.classList.add("invalid-title");
          contentDiv.classList.add("invalid-content");
          ratingsDiv.classList.add("invalid-stars");
          titleWrapper.classList.add("invalid-title-div");
          contentWrapper.classList.add("invalid-content-div");
        } else if (
          !ratings[0].classList.contains("active") &&
          titleDiv.value &&
          contentDiv.value
        ) {
          titleDiv.classList.add("valid-title");
          contentDiv.classList.add("valid-content");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          !ratings[0].classList.contains("active") &&
          titleDiv.value &&
          !contentDiv.value
        ) {
          titleDiv.classList.add("valid-title");
          contentDiv.classList.add("invalid-content");
          contentWrapper.classList.add("invalid-content-div");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          !ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          contentDiv.value
        ) {
          titleDiv.classList.add("invalid-title");
          titleWrapper.classList.add("invalid-title-div");
          contentDiv.classList.add("valid-content");
          ratingsDiv.classList.add("invalid-stars");
        } else if (
          ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          !contentDiv.value
        ) {
          titleDiv.classList.add("invalid-title");
          contentDiv.classList.add("invalid-content");
          ratingsDiv.classList.add("valid-stars");
          titleWrapper.classList.add("invalid-title-div");
          contentWrapper.classList.add("invalid-content-div");
        } else if (
          ratings[0].classList.contains("active") &&
          titleDiv.value &&
          !contentDiv.value
        ) {
          titleDiv.classList.add("valid-title");
          contentDiv.classList.add("invalid-content");
          contentWrapper.classList.add("invalid-content-div");
          ratingsDiv.classList.add("valid-stars");
        } else if (
          ratings[0].classList.contains("active") &&
          !titleDiv.value &&
          contentDiv.value
        ) {
          titleDiv.classList.add("invalid-title");
          titleWrapper.classList.add("invalid-title-div");
          contentDiv.classList.add("valid-content");
          ratingsDiv.classList.add("valid-stars");
        }
      }
    });
  }
};

export { ratingsError };
