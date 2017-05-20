var gate = "";
var type = "All";
var province = "";
var stationID = "";
var list = new Array(10);

function setGate(ngate) {
  gate = ngate;
}

function setType(ntype) {
  type = ntype;
}

function setProvince(nprovince) {
  province = nprovince;
  getStationList(nprovince);
}

function setStation(nstation) {
  stationID = nstation;
}

function showTable() {
  $.ajax({
  method: "POST",
  url: "getTable.php",
  cache: false,
  dataType: "html",
  data: { gate: gate, type: type, province: province, station: stationID },
  success: function( data, status, jqXHR ) {
    console.log(data);
    $("#show").append(data);
  }
});

}

function getStationList(val) {
  $.ajax({
  method: "POST",
  url: "getStationListFromProvinceChoice.php",
  cache: false,
  dataType: "html",
  data: { province: val },
  success: function( data, status, jqXHR ) {
    $("#select_station_list").html(data);
  }
});
}
