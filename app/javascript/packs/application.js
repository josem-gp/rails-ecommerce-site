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
import { toggleSearch } from "../components/init_toggleSearch";
import { openMenuNav } from "../components/init_openMenuNav";
import { originalNav } from "../components/init_originalNav";
import { filterProducts } from "../components/init_filterProducts";
import { sortDropdown } from "../components/init_sortDropdown";
import { showImgDisplay } from "../components/init_showImgDisplay";
import { cartSteps } from "../components/init_cartSteps";
import { prefillingStripe } from "../components/init_prefillingStripe";
import { sendingContactForm } from "../components/init_sendingContactForm";
import { readjustCatalog } from "../components/init_readjustCatalog";

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();

  ratings();
  ratingsError();
  loginError();
  closeTag();
  shippingError();
  billingError();
  toggleSearch();
  openMenuNav();
  originalNav();
  filterProducts();
  sortDropdown();
  showImgDisplay();
  cartSteps();
  prefillingStripe();
  sendingContactForm();
  readjustCatalog();
});
