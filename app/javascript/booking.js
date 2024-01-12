$('#booking_show_date').on('change', function() {
  var show_date = $(this).val();
  var showtime_id = $("#booking_showtime_id").val();

  $.ajax({
    url: 'seat_options',
    data: { show_date: show_date, showtime_id: showtime_id },
  });
});

