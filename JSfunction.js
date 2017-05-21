var gate = "";
var type = "All";
var province = "";
var stationID = "";
var firstName = "" ;
var lastName = "" ;
var age = "" ;
var gender = "Male" ;
var TypeStaff = "Driver";

function setfirstName() {
  firstName = document.getElementById("input_firstname").value ;
  console.log(firstName);
}
function setlastName(){
  lastName = document.getElementById("input_lastname").value ;
}
function setAge() {
  age = document.getElementById("input_age").value ;
}
function setGender(ngender){
  gender = ngender ;
}

function setTypeStaff(nstafftype) {
  TypeStaff = nstafftype ;

}

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
    $("#show").html(data);
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

function getStaffList() {
  $.ajax({
    method: "POST",
    url: "getStaffList.php",
    cache: false,
    dataType: "html",
    success: function(data, status, jqXHR) {
      console.log(data);
      $("#staff_list").html(data);
    }
  });
}

function pasuser(form) {
  console.log("Sucess Login");
  if (form.username.value=="Angelamp") {
    if (form.password.value=="2538") {
      $('#loginModal').modal('toggle') ;
      $('.modal-backdrop').css({
        'position': 'relative'
      });
      $('#staffModal').modal(show) ;

    } else {
      alert("Invalid Password");
    }
  } else {
    alert("Invalid UserID");
  }
  getStaffList();
  $('.modal-backdrop').css({
    'position': 'relative'
  });
}

function deleteStaffList(id) {
  console.log(id);
  // $.ajax({
  //   method: "POST",
  //   url: "deleteStaff.php",
  //   cache: false,
  //   dataType: "html",
  //   data: { id: id },
  //   success: function(data, status, jqXHR) {
  //     $("#staff_list").html(data);
  //   }
  // });
}

function addStaffList(firstname,lastname,gender,age,type) {

  console.log(firstname);
  console.log(lastname);
  console.log(gender);
  console.log(age);
  console.log(type);
  // $.ajax({
  //   method: "POST",
  //   url: "addStaff.php",
  //   cache: false,
  //   dataType: "html",
  //   data: { firstname:firstname,lastname:lastname,gender:gender,age:age,type:type },
  //   success: function(data, status, jqXHR) {
  //     $("#staff_list").html(data);
  //   }
  // });
}

function deleteRow(r){
  var i = r.parentNode.parentNode.rowIndex;
  document.getElementById("table").deleteRow(i);
  deleteStaffList(r.id);

}

function addRow(){
  var table = document.getElementById("table");
  var row= table.insertRow(table.rows.length);
  var id = "S"+ (table.rows.length-1) ;

  setfirstName();
  setlastName();
  setAge();

  var col1 = row.insertCell(0);
  col1.innerHTML= id ;
  var col2 = row.insertCell(1);
  col2.innerHTML= firstName ;
  var col3 = row.insertCell(2);
  col3.innerHTML= lastName ;
  var col4 = row.insertCell(3);
  col4.innerHTML= gender;
  var col5 = row.insertCell(4);
  col5.innerHTML= age ;
  var col6 = row.insertCell(5);
  col6.innerHTML= TypeStaff ;
  var col7 = row.insertCell(6);
  col7.innerHTML = " <input type='image' id='$id' src='/aboutbuses/images/trash.png' alt='Submit' width='24' height='24' onclick='deleteRow(this)' >" ;

  var first = document.getElementById("input_firstname");
  var last = document.getElementById("input_lastname");
  var age = document.getElementById("input_age");

  first.placeholder = "FirstName...";
  first.value = "" ;
  last.placeholder = "LastName....";
  last.value = "";
  age.placeholder = "Age..";
  age.value = "" ;

  addStaffList(firstName,lastName,gender,age,TypeStaff);
}

function getStaffName(divID, busNo, busType, staffType) {
  $.ajax({
    method: "POST",
    url: "getStaffName.php",
    cache: false,
    dataType: "html",
    data: {busNo: busNo, busType: busType, staffType: staffType},
    success: function(data, status, jqXHR ) {
      $("#" + divID).html(data);
    }
  });
}

function getBusInfo(divID, busNo, busType) {
  $.ajax({
    method: "POST",
    url: "getBusInfo.php",
    cache: false,
    dataType: "html",
    data: {busNo: busNo, busType: busType},
    success: function(data, status, jqXHR ) {
      $("#" + divID).html(data);
    }
  });
}
