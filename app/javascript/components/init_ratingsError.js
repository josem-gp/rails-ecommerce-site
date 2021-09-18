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
    console.log("clicked!");

    if (ratings[0].classList.contains("active")) {
      console.log("free!");
    } else {
      event.preventDefault();
      console.log("doomed!");
      if (titleDiv.value && contenDiv.value) {
        titleDiv.classList.add("valid-title");
        contenDiv.classList.add("valid-content");
      } else if (titleDiv.value && !contenDiv.value) {
        titleDiv.classList.add("valid-title");
        contentWrapper.classList.remove("invalid-title-div");
        contenDiv.classList.add("invalid-content");
        contentWrapper.classList.add("invalid-content-div");
      } else if (!titleDiv.value && contenDiv.value) {
        titleDiv.classList.add("invalid-title");
        titleWrapper.classList.add("invalid-title-div");
        contenDiv.classList.add("valid-content");
        contentWrapper.classList.remove("invalid-content-div");
      } else if (!titleDiv.value && !contenDiv.value) {
        titleDiv.classList.add("invalid-title");
        titleWrapper.classList.add("invalid-title-div");
        contenDiv.classList.add("invalid-content");
        contentWrapper.classList.add("invalid-content-div");
      }
      ratingsDiv.classList.add("invalid-stars");
    }
  });
};

export { ratingsError };
