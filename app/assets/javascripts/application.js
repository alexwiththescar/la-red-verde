// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap

//= require wice_grid
//= require jquery_nested_form

//= require_tree .

$(document).ready(function(){
  // Hide div
  $(".hidden_fields").css("display","none");

  // Add onclick handler to checkbox w/ class 'toggle_hidden_fields'
  $(".toggle_hidden_fields").click(function(){
    if ($(".toggle_hidden_fields").is(":checked")) {
      // Show the hidden div
      $(".hidden_fields").show("fast");
      $(".non_hidden_fields").hide("fast");
    }
    else {
      // Otherwise, hide it
      $(".non_hidden_fields").show("fast");
      $(".hidden_fields").hide("fast");
    }
  });
});