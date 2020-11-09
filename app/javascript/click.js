function newMap (){
  const myShop = document.getElementById('select');
  const entry = document.getElementById('entry');
  const geocoder = new google.maps.Geocoder();

  myShop.addEventListener('click', function(){
    myShop.innerHTML= "";
    entry.innerHTML= "登録する";

    //東京の位置
    const options =  {
      zoom:15,
      center: {lat:35.681167, lng: 139.767052}
    };

    //google mapの表示
    const map = new google.maps.Map(document.getElementById('map'), options);

    //クリックイベントを追加
    // map.addListener('click', function(e) {
      // getClickLatLng(e.latLng, map);

    map.addEventListener('click', function(e) {
      geocoder.geocode({location: e.latLng}, function(results, status) {
        if(status === 'OK' && results[0]) {
          map.panTo(results[0].geometry.location);
          const marker = new google.maps.Marker({
            position: results[0].geometry.location,
            map: map,
            animation: google.maps.Animation.DROP,
          });
        };
      });
    });
      
      //マップ上にマーカーしてから登録をクリックする
      entry.addEventListener('click', function(){
        console.log("ok");
      });

    // function getClickLatLng(lat_lng, map){

    //   document.getElementById('lat').textContent = lat_lng.lat();
    //   document.getElementById('lng').textContent = lat_lng.lng();

    //   // const marker = new google.maps.Marker({
    //   //   position: lat_lng,
    //   //   map: map,
    //   //   animation: google.maps.Animation.DROP
    //   });
    // };
  });
};

window.addEventListener("load", newMap);