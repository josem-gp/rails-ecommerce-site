const postReview = () => {
  var buttonSubmit = document.querySelector(".submit-btn");
  var submit = document.querySelector(".submit");
  const reviewContent = document.querySelector("#review_content");
  const reviewTitle = document.querySelector("#review_title");
  const reviewRating = document.querySelectorAll(".radio_button");

  function toggleClass() {
    this.classList.toggle("active-submit");
  }

  function addGoodClass() {
    this.classList.add("finished-submit");
  }

  function addBadClass() {
    this.classList.add("error-submit");
  }

  function checkRating() {
    var total = 0;
    reviewRating.forEach((rating) => {
      if (rating.classList.contains("active")) {
        total += 1;
      }
    });
  }

  if (buttonSubmit) {
    buttonSubmit.addEventListener("click", (event) => {
      event.preventDefault();
      if (!reviewContent.value || !reviewTitle.value || checkRating() === 0) {
        buttonSubmit.classList.add("active-submit");
        buttonSubmit.addEventListener("transitionend", toggleClass);
        buttonSubmit.addEventListener("transitionend", addBadClass);
        setTimeout(function () {
          buttonSubmit.classList.remove("error-submit");
        }, 4000);
      } else {
        buttonSubmit.classList.add("active-submit");
        buttonSubmit.addEventListener("transitionend", toggleClass);
        buttonSubmit.addEventListener("transitionend", addGoodClass);
        setTimeout(function () {
          document.querySelector("#new_review").submit();
        }, 4000);
      }
    });
  }
};

export { postReview };
