const closeTag = () => {
  const alert = document.querySelector(".close");

  if (alert) {
    setTimeout(function () {
      alert.click();
    }, 2000);
  }
};

export { closeTag };
