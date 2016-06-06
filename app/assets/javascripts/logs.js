//$(function () {
//  $('#logs_search').submit(function () {
//      $.get(this.action, $(this).serialize(), null,'script');
//      return false;
//  });
//});


$(function() {
    $(document).on('click', '#logs_table .pagination a', function () {
        $.getScript(this.href);
        return false;
    });
});