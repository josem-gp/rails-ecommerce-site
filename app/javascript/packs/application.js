// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("jquery");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { start } from "turbolinks";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { ratings } from "../components/init_ratings";
import { closeTag } from "../components/init_closeTag";
import { ratingsError } from "../components/init_ratingsError";
import { loginError } from "../components/init_loginError";
import { shippingError } from "../components/init_shippingError";
import { billingError } from "../components/init_billingError";
import { disableStripe } from "../components/init_disableStripe";
import { toggleSearch } from "../components/init_toggleSearch";
import { dropdownNav } from "../components/init_dropdownNav";
import { originalNav } from "../components/init_originalNav";
import { filterProducts } from "../components/init_filterProducts";
import { sortDropdown } from "../components/init_sortDropdown";
import { showImgDisplay } from "../components/init_showImgDisplay";

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();

  ratings();
  ratingsError();
  loginError();
  closeTag();
  shippingError();
  billingError();
  setTimeout(function () {
    disableStripe();
  }, 500);
  toggleSearch();
  dropdownNav();
  originalNav();
  filterProducts();
  sortDropdown();
  showImgDisplay();
});
