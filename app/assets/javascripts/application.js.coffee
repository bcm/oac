#= require flatly
#= require_tree .

jQuery ->
  $('[data-toggle=tooltip]').tooltip()
  $('[data-toggle=popover]').popover()
