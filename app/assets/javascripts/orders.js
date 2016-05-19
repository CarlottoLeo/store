$(function() {
  $('select').select2({placeholder: "Select Products"});

  $(document).on('cocoon:after-insert', function() {
    $('select').select2({placeholder: "Select Products"});
  });

  $("a.add_fields").data("association-insertion-method", 'before').data("association-insertion-node", 'this');

  $(document).on('change', function() {
    $(this).find('div.four.fields.nested-fields').update_forms_values();
  });
});
