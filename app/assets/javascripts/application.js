// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require select2
//= require cocoon

$(function() {
  $("a.add_fields").data("association-insertion-method", 'append').data("association-insertion-node", '#nested-forms-box');
  $('#add-nested-field').trigger('click');
});

$(document).on('page:change', function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();

  $(document).on('cocoon:after-insert', function() {
    $('select[name*="order[items_attributes]"]').ajax_search_select2("Selecione um Produto", "bootstrap", "/products", 5, 'name_cont');

    $('#nested-forms-box').animate({
      scrollTop: $('#nested-forms-box').prop("scrollHeight")
    }, 'slow');
  });

  $('select[name*="order[items_attributes]"]').ajax_search_select2("Selecione um Produto", "bootstrap", "/products", 5, 'name_cont');

  $('#nested-forms-box').animate({
    scrollTop: $('#nested-forms-box').prop("scrollHeight")
  }, 'slow');

  // update the items cart values automatically when selecting or adding more
  $(document).change(function() {
    $('div[role="nested-items-row"]').each(function() {
      $(this).update_forms_values();
    });
  });

  $('#person_cpf').mask('999.999.999-99');

  $('#order_person_id').ajax_search_select2("Selecione um Cliente", "bootstrap", "/people", 7, 'name_or_cpf_cont');
});
