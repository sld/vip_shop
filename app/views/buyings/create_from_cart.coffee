$(document).ready ->
  need_money = $("#total-price-val").html() - $("#user-balance-val").html()  
  if confirm('Balance is too small. Would you like to add ' + need_money + ' into balance?')
    $.post("<%= j balances_increase_path %>", { value: need_money } )
