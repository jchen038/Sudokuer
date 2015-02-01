$(document).ready(function(){
  // Puzzle functionality
  $(".button-select").click(function() {
    var currentSquare = this;
    $(".button-select").removeClass("Active");
    $(currentSquare).addClass("Active");
  });

  $(".buttons").click(function() {
    var currentButton = this;
    var currentButtonValue = $(this).text().trim();
    var activeClasses = $.inArray( "base_cell", $(".Active").attr('class').split(/\s+/)) < 0;
    console.log(activeClasses);
    if (activeClasses) {
      $(".Active").text("");
      $(".Active").text(currentButtonValue);
    }
  });
});
