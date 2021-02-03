$(document).ready(function(){
  $("#ship_method_1").change(function(){
    total_sum = 50 + Number($("#subtotal").text().replace(/[^0-9.-]+/g,""));
    $("#total_sum").html("$" + total_sum)
    $("#ship_price").html("$" + 50)
  })

  $("#ship_method_2").change(function(){
    total_sum = 100 + Number($("#subtotal").text().replace(/[^0-9.-]+/g,""));
     $("#total_sum").html("$" + total_sum)
     $("#ship_price").html("$" + 100)
  })
});
