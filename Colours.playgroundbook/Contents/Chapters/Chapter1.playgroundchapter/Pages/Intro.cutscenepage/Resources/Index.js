
var pageCount = 1;

$("#left-button").click(function(){

  if (pageCount == 2) {

    $("#content-" + pageCount).animate({
      opacity: 0.0,
      paddingTop: "90px"
    }, {
      duration: 300
    });

    pageCount -= 1;

    $("#content-" + pageCount).delay(100).animate({
      opacity: 1.0,
      paddingTop: "60px"
    }, {
      duration: 600
    });

    $("#left-button").animate({
      opacity: 0.4
    }, {
      duration: 300
    });

  }

});

$("#right-button").click(function(){

  if (pageCount == 1) {
    $("#left-button").animate({
      opacity: 1.0
    }, 200);
  }

  if (pageCount < 3) {

    $("#content-" + pageCount).animate({
      opacity: 0.0,
      paddingTop: "30px"
    }, {
      duration: 300
    });

    pageCount += 1;

    $("#content-" + pageCount).delay(100).animate({
      opacity: 1.0,
      paddingTop: "60px"
    }, {
      duration: 600
    });

  }

  if (pageCount == 3) {

    $("#cracking-button").css("display", "block");

    $(".cracking-button").animate({
      opacity: 1.0
    }, {
      duration: 300
    });

    $("#left-button, #right-button").animate({
      opacity: 0.0
    }, {
      duration: 300
    });

    $("#left-button, #right-button").delay(300).css("display", "none");

  }

});

$(document).ready(function(event){

  $("#content-1").delay(200).animate({
    opacity: 1.0,
    paddingTop: "60px"
  }, {
    duration: 600
  });

  $(".buttons").delay(200).animate({
    opacity: 1.0
  }, {
    duration: 600
  });

});
