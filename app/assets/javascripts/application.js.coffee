#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree .

jQuery ->
  $('[data-toggle=tooltip]').tooltip()
  $('[data-toggle=popover]').popover()
