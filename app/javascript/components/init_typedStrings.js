import Typed from "typed.js";

const typed_strings = document.querySelector("#caption-title-typed").innerText;
const subtyped_strings = document.querySelector(
  "#caption-subtitle-typed"
).innerText;

async function firstFunction() {
  if (document.getElementById("caption-title-slider")) {
    return new Typed("#caption-title-slider", {
      strings: typed_strings.split(","),
      typeSpeed: 50,
      fadeOut: true,
      showCursor: false,
      startDelay: 2000,
    });
  }
}

async function typedStrings() {
  await firstFunction();
  return new Typed("#caption-subtitle-slider", {
    strings: subtyped_strings.split(","),
    typeSpeed: 50,
    fadeOut: true,
    showCursor: false,
    startDelay: 6500,
  });
}

export { typedStrings };
