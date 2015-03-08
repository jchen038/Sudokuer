$(document).ready(function(){
  // Puzzle functionality
  $(".button-select").click(function() {
    var currentSquare = this;
    $(".button-select").removeClass("Active");
    $(".current-selected").removeClass("current-selected");
    $(currentSquare).addClass("Active current-selected");
    var number_list = ["1","2","3","4","5","6","7","8","9"];
    var cell_value = "";
    $.each(number_list, function(index, value) {
      if($(currentSquare).attr("class").search(value) >= 0) {
        cell_value = value;
      }
    });
    if(cell_value.length > 0) {
      $('.' + cell_value).addClass("Active");
    }
  });

  $(".buttons").click(function() {
    var currentButton = this;
    var currentButtonValue = $(this).text().trim();
    var activeClasses = $.inArray("base_cell", $(".current-selected").attr('class').split(/\s+/)) < 0;
    if (activeClasses) {
      $(".current-selected").text("");
      $(".current-selected").text(currentButtonValue);
      $(".current-selected").addClass(currentButtonValue);
    }
  });

  $("#cancel").click(function() {
    var activeClasses = $.inArray("base-cell", $(".current-selected").attr('class').split(/\s+/)) < 0;
    if (activeClasses) {
      var numberRemove = $(".current-selected").text();
      $(".current-selected").text("");
      $(".current-selected").removeClass(numberRemove);
    }
  });

  $("#save").click(function(e) {
    e.preventDefault();
    var url = $("#save").attr("href") + "?" ;
    $(".new-cell").each(function(index, value) {
      var currentSquare = this;
      url += $(currentSquare).attr("id") + "=" + $(currentSquare).text() + "&" ;
    });
    window.location.replace(url.replace(/\s+/g, "").slice(0,-1));
  });

  $("#create").click(function(e) {
    e.preventDefault();
    var url = $("#create").attr("href") + "?" ;
    $(".new-cell").each(function(index, value) {
      var currentSquare = this;
      url += $(currentSquare).attr("id") + "=" + $(currentSquare).text() + "&" ;
    });
    url += "name" + $("#name").text();
    window.location.replace(url.replace(/\s+/g, ""));
  });
});
