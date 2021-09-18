const ratingsError = () => {
  const ratings = document.querySelectorAll(".fa-star");
  const submitRating = document.querySelector('input[value="Create Review"]');
  const ratingsDiv = document.querySelector(".review_rating");
  const ratingsLabel =
    document.querySelector(".review_rating").firstElementChild;
  const titleDiv = document.querySelector('input[name="review[title]"');
  const contenDiv = document.querySelector('input[name="review[content]"');

  submitRating.addEventListener("click", (event) => {
    event.preventDefault();
    ratings.forEach((rating) => {
      if (rating.classList.contains("active")) {
        ratingsDiv.classList.remove("invalid-stars");
        titleDiv.classList.remove("invalid-title");
        contenDiv.classList.remove("invalid-content");
      } else {
        ratingsDiv.classList.add("invalid-stars");
        titleDiv.classList.add("invalid-title");
        contenDiv.classList.add("invalid-content");
      }
    });
  });
};

export { ratingsError };
