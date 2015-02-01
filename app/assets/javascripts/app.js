$(document).ready(function(){
    $(".button-select").click(function() {
      var currentSquare = this;
      $(".button-select").removeClass("Active");
      $(currentSquare).addClass("Active");
    });
});
