(function() {
  $(document).ready(function() {
    $('.play').click(function() {
      $('.about-video').show();
      $('.play').hide();
    });
    $('#close').click(function() {
      $('.about-video').hide();
      $('.play').show();
    });
  });

}).call(this);
