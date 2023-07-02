// Add to its own JS file because if not, when clicking on a page and going back
// the letters go backward, creating a bug

const typed = () => {
  var typedTitle = document.getElementById('title-typed')
  var typedSubtitle = document.getElementById('subtitle-typed')

  if(typedTitle && typedSubtitle) {
    var typed = new Typed("#title-typed", {
      stringsElement: "#caption-title-typed",
      backSpeed: 40,
      typeSpeed: 20,
    });
  
    var typedTwo = new Typed("#subtitle-typed", {
      stringsElement: "#caption-subtitle-typed",
      backSpeed: 40,
      typeSpeed: 10,
      startDelay: 3000,
    });
  }  
};

export { typed };
