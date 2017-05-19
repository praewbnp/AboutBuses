  $('#show').hide();
function showBusTable(place) {
  $('#show').show();
  if(place == 'cenLad') {
    document.getElementById("pre_text").innerHTML = "Bus Number: 24, 29, 39, 59, 104, 510";
  }
  else if(place == 'theMall') {
    document.getElementById("pre_text").innerHTML = "Bus Number: 24, 104";
  }
  else if(place == "major") {
    document.getElementById("pre_text").innerHTML = "Bus Number: 24, 104";
  }
  else {
      document.getElementById("pre_text").innerHTML = "NOt things";
  }
}
