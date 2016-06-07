jQuery.fn.extend({
  update_forms_values: function() {
    callback = function (scope) {
      var name = $('.select2-selection__rendered', scope).text();
      var total = 0;

      $('select[name*="id"] option', scope).each(function(_, v) {
        if ($(v).text() == name) {
          item_id = $(v).val();
          item_amount = $('input[name*="amount"]', scope).val();

          if (item_amount != "") {
            item_amount = parseInt(item_amount);
          } else {
            item_amount = null;
          }

          var item_value;

          $.ajax({
            async: false,
            url: '/products/' + item_id,
            dataType: 'JSON',
            success: function(data) {
              item_value = data.value;
            },

            error: function(data) {
              item_value = 0;
            }
          });

          if (item_value) {
            $('input[name*="value"]', scope).attr('value', item_value);

            if (item_amount) {
              total = (item_value * item_amount);

              $('input[name*="total"]', scope).attr('value', total.toFixed(2));
            }
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

  ajax_search_select2: function(placeholder, theme, urlpath) {
    $(this).select2({
      placeholder: placeholder,
      theme: theme,
      minimumInputLength: 1,

      ajax: {
        url: urlpath,
        dataType: 'JSON',
        delay: 250,

        data: function (params) {
          return {
            q: params.term,
            page: params.page,
            per: 5
          }
        },

        processResults: function (data, params) {
          params.page = params.page || 1;

          return {
            results: data,
            pagination: {
              more: params.page * params.per < data.length
            }
          }
        }
      },

      templateResult: function(state) {
        if (!state || !state.id) {
          return '';
        }

        return state.name;
      }
    });
  }
});
