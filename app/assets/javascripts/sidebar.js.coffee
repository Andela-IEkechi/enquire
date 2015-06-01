# Toggle sidebar
$(document).ready ->
  $(document).on 'click', '#button-toggle', ->
    $('#sidebar').toggleClass 'sidebar_toggle'
    return
  return
