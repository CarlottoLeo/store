$(function() {
  $(document).on('cocoon:after-insert', function() {
    $('select').select2({placeholder: "Select Products"});

    $('#nested-forms-box').animate({
      scrollTop: $('#nested-forms-box').prop("scrollHeight")
    }, 'slow');
  });

  $('select').select2({placeholder: "Select Products"});

  $('#nested-forms-box').animate({
    scrollTop: $('#nested-forms-box').prop("scrollHeight")
  }, 'slow');

  $("a.add_fields").data("association-insertion-method", 'append').data("association-insertion-node", '#nested-forms-box');

  var mustClick = (mustClick || true);

  if (mustClick) {
    $('#add-nested-field').trigger('click');
    mustClick = false;
  }

  $(document).on('change', function() {
    $(this).find('div[role=\'nested-items-row\']').update_forms_values();
  });
});
