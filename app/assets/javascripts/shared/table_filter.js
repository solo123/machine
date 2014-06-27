$(function() {
  $(".filter").keyup(function() {
    var rex = new RegExp($(this).val(), "i");
    $(".search-table tr").hide();
    $(".search-table tr").filter(function() {
        return rex.test($(this).text());
    }).show();
  });
});
