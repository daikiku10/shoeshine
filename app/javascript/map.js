function initMap(){
  //東京の位置
  const options =  {
    zoom:8,
    center: {lat:35.681167, lng: 139.767052}
  };
  //google mapの表示
  const map = new google.maps.Map(document.getElementById('map'), options);
};

window.addEventListener("load", initMap);