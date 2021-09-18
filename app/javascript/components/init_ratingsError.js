const ratingsError = () => {
  const ratings = document.querySelectorAll(".fa-star");
  const submitRating = document.querySelector('input[value="Create Review"]');
  const ratingsDiv = document.querySelector(".review_rating");
  const ratingsLabel =
    document.querySelector(".review_rating").firstElementChild;
  const titleDiv = document.querySelector('input[name="review[title]"');
  const contenDiv = document.querySelector('textarea[name="review[content]"');
  const titleWrapper = document.querySelector("#title");
  const contentWrapper = document.querySelector("#content");

  submitRating.addEventListener("click", (event) => {
    event.preventDefault();
    ratings.forEach((rating) => {
      if (rating.classList.contains("active")) {
        ratingsDiv.classList.remove("invalid-stars");
        titleDiv.classList.remove("invalid-title");
        contenDiv.classList.remove("invalid-content");
        titleWrapper.classList.remove("invalid-title-div");
        contentWrapper.classList.remove("invalid-content-div");
      } else {
        ratingsDiv.classList.add("invalid-stars");
        titleDiv.classList.add("invalid-title");
        contenDiv.classList.add("invalid-content");
        titleWrapper.classList.add("invalid-title-div");
        contentWrapper.classList.add("invalid-content-div");
      }
    });
  });
};

export { ratingsError };
