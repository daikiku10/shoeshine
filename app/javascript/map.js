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
  const usersArray = Array.from(gon.users);
  for(let i = 0; i <= shopsArray.length; i++){
    const marker = new google.maps.Marker({
      position: {lat: shopsArray[i].lat, lng: shopsArray[i].lng },
      map: map,
      icon: "https://maps.google.com/mapfiles/ms/micons/blue-dot.png",
    });

    //マーカーをクリックしたら詳細情報が表示される
    google.maps.event.addListener(marker, "click", function(){
      const contentStr = `<ul>
                            <li>店舗名：${shopsArray[i].shop_name}</li>
                            <li>店舗住所：${shopsArray[i].address}</li>
                            <li>インスタグラムユーザー名：${shopsArray[i].instagram}</li>
                          </ul>`;
                          
      const infoWindow = new google.maps.InfoWindow({
        content: contentStr
      });
      infoWindow.open(map,marker);
    });
  };
};

window.addEventListener("load", initMap);