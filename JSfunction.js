var gate = "";
var type = "";
var province = "";
//var station = ""; not yet needed

function setGate(ngate) {
  gate = ngate;
}

function setType(ntype) {
  type = ntype;
}

function setProvince(nprovince) {
  province = nprovince;
}

function setStation(nstation) {
  station = nstation;
}

function showTable() {
  $.ajax({
  method: "POST",
  url: "getTable.php",
  cache: false,
  dataType: "html",
  data: { gate: gate, type: type, province: province },
  success: function( data, status, jqXHR ) {
    $("#show").html(data);
  }
});
}
