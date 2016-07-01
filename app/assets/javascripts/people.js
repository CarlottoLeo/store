$(document).on('ready page:load', function() {
  // creates CEP's mask for user input
  $("input[name*='cep']").mask("99.999-999");

  // changes the navigation between person registration
  $('.nav-tabs > li').on('click', function(e, dom) {
    if (!$(this).hasClass('disabled')) {
      $('.nav-tabs > li').each(function() {
        var tab_name = $(this).data('tab-name');

        $(this).removeClass('active');
        $(tab_name).addClass('hidden');
      });

      var tab_name = $(this).data('tab-name');

      $(this).addClass('active');
      $(tab_name).removeClass('hidden');
    }
  });
});
