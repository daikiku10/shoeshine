function initMap(){
  //東京の位置
  const options =  {
    zoom:6,
    center: {lat:35.681167, lng: 139.767052}
  };
  //google mapの表示
  const map = new google.maps.Map(document.getElementById('map'), options);

  //データベースに登録されている緯度経緯にマーカーを立てる
  const shopsArray = Array.from(gon.shops);
  for(let i = 0; i < shopsArray.length; i++){
    const marker = new google.maps.Marker({
      position: {lat: shopsArray[i].lat, lng: shopsArray[i].lng },
      map: map,
    });
  };
};

window.addEventListener("load", initMap);