$(function(){
  $('.best_in_place').bind("ajax:success", function () { sum_all_tables(); });
  $(".best_in_place").best_in_place();

  sum_all_tables();
});

var test_obj = null;

function sum_all_tables(){
  $('table.sum-table').each(function(){ sum_table($(this));});
}

function sum_table(table){
   table.find('[class*=sum_]').each(function() { sum_column($(this), table); });
}

function sum_column(sum_cell, table){
  $.each(sum_cell.attr('class').split(' '), function(i, val){
    var re = val.match(/^sum_(.*)/);
    if(re){
      var tot = 0.0;
      table.find('.' + re[1]).each(function(){
        tot += parseFloat($(this).text());
      });

      sum_cell.text(tot);
    }
  });

}
