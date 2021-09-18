//this is as a default because if not it creates an error if the form is sent without stars

const fiveStars = () => {
  document.querySelector("#review_rating_5").click();
};

export { fiveStars };
