// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "../stylesheets/application"
import "jquery"
// import "@fortawesome/fontawesome-free/css/all.css";
// import "jquery-bar-rating"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const filter_dialog = $('.filter-dialog');
$('.filter-search').on('click',function() {
    alert('test');
    filter_dialog.toggleClass('open');
});

console.log('loaded js')

