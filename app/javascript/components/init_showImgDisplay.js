const showImgDisplay = () => {
  const productImgs = document.querySelectorAll(".changeable-pic");
  const displayDiv = document.querySelector(".main-pic");

  productImgs.forEach((img) => {
    img.addEventListener("click", (event) => {
      let duplicate = event.target.outerHTML;
      if (!displayDiv.firstElementChild) {
        displayDiv.insertAdjacentHTML("beforeend", duplicate);
      } else {
        displayDiv.firstElementChild.remove();
        displayDiv.insertAdjacentHTML("beforeend", duplicate);
      }
    });
  });
};

export { showImgDisplay };
