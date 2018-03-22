import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  // const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
var geocoder = new google.maps.Geocoder();
var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 10,
});
geocoder.geocode({'address': "Brussels"}, function(results, status) {
  if (status === 'OK') {
    map.setCenter(results[0].geometry.location);
  } else {
    alert('Geocode was not successful for the following reason: ' + status);
  }
});

const providers = JSON.parse(mapElement.dataset.mealprovider);
providers.forEach((p) => {
  let a = new google.maps.Marker({
    position: {lat: p.latitude, lng: p.longitude},
    title: p.name,
    map: map
  });

  var contentString = ` <div id="content"> <img src="${p.photo.url}" height="150" width="150"></div>
   <div class='banner-description'>

    <h3> ${p.name}</h3>
    <p><b>${p.category}</b></p><p>${p.address}</p></div>`;
// Le back tick permet de créer un 'chunk' d html dans lequel on peut interpoler

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });
  a.addListener('click', function() {
    infowindow.open(map, a);
  });
})
}


