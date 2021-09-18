//this is as a default because if not it creates an error if the form is sent without stars

const fiveStars = () => {
  const fiveStars = document.querySelector("#review_rating_1");
  fiveStars ? fiveStars.click() : "";
};

export { fiveStars };
