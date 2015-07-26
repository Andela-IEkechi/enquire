$(document).ready ->
  $('.play').click ->
    $('.about-video').show()
    $('.play').hide()
    return

  $('#close').click ->
    $('.about-video').hide()
    $('.play').show()
    return
  return