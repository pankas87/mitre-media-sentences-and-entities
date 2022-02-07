// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", function() {
    var addTextButtons = document.getElementsByClassName("add-text-button")
    function addText(event) {
        // Getting the text that shall be added
        var element = event.currentTarget;
        var parent = element.parentNode;
        var textToAdd = parent.getElementsByClassName("text-to-add")[0].innerText;

        // Adding the text
        var textInput = document.getElementById("text");
        var currentValue = textInput.value;
        textInput.value = (currentValue == "") ? textToAdd : currentValue + " " + textToAdd;
        console.log(textToAdd.textContent);
    }

    for (var i = 0; i < addTextButtons.length; i++) {
        addTextButtons[i].addEventListener('click', addText, false);
    }
});


