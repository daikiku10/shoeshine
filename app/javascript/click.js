function newMap (){
  //東京の位置
  const options =  {
    zoom:15,
    center: {lat:35.681167, lng: 139.767052}
  };
  //google mapの表示
  const map = new google.maps.Map(document.getElementById('new-map'), options);
  //ジオコーディングのインスタンスの生成
  const geocoder = new google.maps.Geocoder();

  map.addListener('click', function(e){
    //リバースジオコーディングでは location を指定
    geocoder.geocode({location: e.latLng}, function(results, status){
      if(status === 'OK' && results[0]) {
        //マーカーの生成
        const marker = new google.maps.Marker({
          position: results[0].geometry.location,
          map: map,
          animation: google.maps.Animation.DROP,
          icon: "https://maps.google.com/mapfiles/ms/micons/blue-dot.png"
        });
        document.getElementById('lat').value = results[0].geometry.location.lat();
        document.getElementById('lng').value = results[0].geometry.location.lng();
      }else if(status === 'ZERO_RESULTS') {
        alert('不明なアドレスです：' + status);
        return;
      }else {
        alert('失敗しました：' + status);
      }
    });
  });
};

window.addEventListener("load", newMap);