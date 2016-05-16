jQuery.fn.extend({
    post_order: function() {
    // filling data
    var items = [];

    $('tbody > tr').each(function() {
      var entry = {};

      entry['name']   = $(this).find('td[name="item[name]"]').text();
      entry['amount'] = $(this).find('td[name="item[amount]"]').text();
      entry['value']  = $(this).find('td[name="item[value]"]').text();

      items.push(entry);
    });

    // sending data
    $.ajax({
      type: "POST",
      url: $("#order-form").attr('action'), // 'pt-BR/orders'
      data: {order: {items: items}},                // tabela com os valores
      dataType: "JSON"
    });

    return false;
  }
});
