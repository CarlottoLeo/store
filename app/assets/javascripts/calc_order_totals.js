$(document).ready(function () {
  $('#item_amount').change(function() {
    var itemValue  = parseFloat($('#item_id option:selected').attr('value').match(/value[:] [-+]?([0-9]*.[0-9]+|[0-9]+)/i)[1]);
    var itemAmount = parseInt($('#item_amount').val());

    if (itemValue && itemAmount) {
      $('#item_value').attr('value', itemValue.toFixed(2));
      $('#item_total').attr('value', (itemValue * itemAmount).toFixed(2));
    };
  });

  $('#item_info').change(function() {
    var itemValue  = parseFloat($('#item_id option:selected').attr('value').match(/value[:] [-+]?([0-9]*.[0-9]+|[0-9]+)/i)[1]);
    var itemAmount = parseInt($('#item_amount').val());

    if (itemValue) {
      $('#item_value').attr('value', itemValue.toFixed(2));
    };

    if (itemValue && itemAmount) {
      $('#item_value').attr('value', itemValue.toFixed(2));
      $('#item_total').attr('value', (itemValue * itemAmount).toFixed(2));
    };
  });
});
