function newMap (){
  const myShop = document.getElementById('select');
  myShop.addEventListener('click', function(){
    myShop.innerHTML ="登録する"

    //東京の位置
    const options =  {
      zoom:15,
      center: {lat:35.681167, lng: 139.767052}
    };

    //google mapの表示
    const map = new google.maps.Map(document.getElementById('map'), options);

    //クリックイベントを追加
    map.addListener('click', function(e) {
      getClickLatLng(e.latLng, map);
    });
    function getClickLatLng(lat_lng, map){

      document.getElementById('lat').textContent = lat_lng.lat();
      document.getElementById('lng').textContent = lat_lng.lng();

      const marker = new google.maps.Marker({
        position: lat_lng,
        map: map,
        animation: google.maps.Animation.DROP
      });
    };


  });
};

window.addEventListener("load", newMap);