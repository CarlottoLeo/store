jQuery.fn.extend({
  update_forms_values: function() {
    var CALLER = this;

    callback = function (scope) {
      var name = $('.select2-selection__rendered', scope).text();
      var total = 0;

      $('select[name*="id"] option', scope).each(function(_, v) {
        if ($(v).text() == name) {
          var itemValue = parseFloat($(v).val().match(/value[:] [-+]?([0-9]*.[0-9]+|[0-9]+)/i)[1]);
          var itemAmount = $('input[name*="amount"]', scope).val();

          if (itemValue && itemAmount) {
            total = (itemValue * itemAmount);

            $('input[name*="value"]', scope).attr('value', itemValue.toFixed(2));
            $('input[name*="total"]', scope).attr('value', total.toFixed(2));
          }
        }
      });

      return total;
    }

    var total_cart = 0;

    $(this).each(function() {
      total_cart += callback(this);
    });

    $("#cart_total").val(total_cart.toFixed(2));
  },

  submit_order: function() {
    $('select option').each(function(i, v) {
      var value = $(v).val();

      if (value && value.match(/[{]/)) {
        var id = value.match(/id[:] [-+]?([0-9]*)/i)[1];

        $(v).val(id);
      }
    });

    $(this).submit();
  }
});
