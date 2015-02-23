$(document).ready(function(){
  // Puzzle functionality
  $(".button-select").click(function() {
    var currentSquare = this;
    $(".button-select").removeClass("Active");
    $(currentSquare).addClass("Active");
    var number_list = ["1","2","3","4","5","6","7","8","9"];
    var cell_value = "";
    $.each(number_list, function(index, value) {
      if($(currentSquare).attr("class").search(value) >= 0) {
        cell_value = value;
        console.log(cell_value);
      }
    });
    $('.' + cell_value).addClass("Active");
  });

  $(".buttons").click(function() {
    var currentButton = this;
    var currentButtonValue = $(this).text().trim();
    var activeClasses = $.inArray( "base_cell", $(".Active").attr('class').split(/\s+/)) < 0;
    if (activeClasses) {
      $(".Active").text("");
      $(".Active").text(currentButtonValue);
      $(".Active").addClass(currentButtonValue);
    }
  });

  $("#cancel").click(function() {
    var activeClasses = $.inArray( "base_cell", $(".Active").attr('class').split(/\s+/)) < 0;
    if (activeClasses) {
      $(".Active").text("");
    }
  });
});
