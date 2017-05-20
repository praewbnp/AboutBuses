function showBusTable(place, index) {
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

  for (var i = 1 ; i < 11 ; i++) {
    document.getElementById("place" + i).style.backgroundColor = "white";
    // document.getElementById("place" + i).style.opacity = 50;
  }
  document.getElementById("place" + index).style.backgroundColor = "#dadbd4";
  // document.getElementById("place" + index).style.color = "white";
}
