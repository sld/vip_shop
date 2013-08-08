$(document).ready ->
  $('#balance').html("<%= escape_javascript(render :partial => 'shared/user_balance') %>")