function FadeOut(target, duplicate, speed) {
  var seconds = speed / 1000;
  target.firstElementChild.style.transition = "opacity " + seconds + "s ease";
  target.firstElementChild.style.position = "absolute";

  target.firstElementChild.style.opacity = 0;
  target.insertAdjacentHTML("beforeend", duplicate);
  target.getElementsByTagName("img")[1].classList.add("augment-pic");
  setTimeout(function () {
    target.firstElementChild.remove();
  }, speed);
}

const showImgDisplay = () => {
  const displayDiv = document.querySelector(".main-pic");
  if (displayDiv) {
    const productImgs = document.querySelectorAll(".changeable-pic");
    const productImg = document.querySelector(".changeable-pic").outerHTML;

    displayDiv.childElementCount === 0
      ? ""
      : displayDiv.firstElementChild.remove();
    displayDiv.insertAdjacentHTML("beforeend", productImg);
    displayDiv.firstElementChild.classList.add("augment-pic");

    productImgs.forEach((img) => {
      img.addEventListener("click", (event) => {
        if (displayDiv.childElementCount === 1) {
          //if we try to click images too quickly, it will break things so we make sure it only has 1 child
          let duplicate = event.target.outerHTML;

          FadeOut(displayDiv, duplicate, 500); //with this we do a FadeOut animation when passing each image
        }
      });
    });
  }
};

export { showImgDisplay };
