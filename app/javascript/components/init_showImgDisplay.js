const showImgDisplay = () => {
  const displayDiv = document.querySelector(".main-pic");
  if (displayDiv) {
    const productImgs = document.querySelectorAll(".changeable-pic");
    const productImg = document.querySelector(".changeable-pic").outerHTML;

    displayDiv.insertAdjacentHTML("beforeend", productImg);
    displayDiv.firstElementChild.classList.add("augment-pic");

    productImgs.forEach((img) => {
      img.addEventListener("click", (event) => {
        let duplicate = event.target.outerHTML;

        displayDiv.firstElementChild.remove();
        displayDiv.insertAdjacentHTML("beforeend", duplicate);
        displayDiv.firstElementChild.classList.add("augment-pic");
      });
    });
  }
};

export { showImgDisplay };
