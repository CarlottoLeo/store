$(document).on('turbolinks:load cocoon:after-insert', function() {
  function somaTudo() {
    var tudo = 0;

    $('.product_total').each(function(_, input) {
      tudo += parseFloat($(input).val());
    });

    $('#cart_total').val((tudo.toString() !== '' ? tudo.toFixed(2) : 0.00));
  }

  $('select.produto').on('change', function() {
    var value = $(this).val();
    var $parent = $(this).closest('.nested-parent');

    var $valorProduto = $('.product_value', $parent);
    $valorProduto.val(parseFloat(value).toFixed(2));
    var $qtdProduto = $('.product_amount', $parent);

    $qtdProduto.on('change', function() {
      var qtd = $(this).val();
      var total = $valorProduto.val() * qtd;
      $('.product_total', $parent).val(parseFloat(total).toFixed(2));

      var tudo = 0;

      somaTudo();
    });

    somaTudo();
  });

  $(document).on('cocoon:after-remove', somaTudo);
});
