const closeTag = () => {
  const alert = document.querySelector(".alert");

  if (alert) {
    setTimeout(function () {
      alert.firstElementChild.click();
    }, 2000);
  }
};

export { closeTag };
