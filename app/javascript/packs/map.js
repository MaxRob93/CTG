import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  // const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
 var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: 0, lng: 0}
        });

  // const markers = JSON.parse(mapElement.dataset.markers);
  // map.addMarkers(markers);
  // if (markers.length === 0) {
  //   map.setZoom(2);
  // } else if (markers.length === 1) {
  //   map.setCenter(markers[0].lat, markers[0].lng);
  //   map.setZoom(14);
  // } else {
  //   map.fitLatLngBounds(markers);
  // }
  // var infowindow = new google.maps.InfoWindow({
  //         content: "Bamm Surprise "
  //   });

  //   map.markers.forEach((m) =>  m);



    const providers = JSON.parse(mapElement.dataset.mealprovider);
   providers.forEach((p) => {
        let a = new google.maps.Marker({
          position: {lat: p.latitude, lng: p.longitude},
          title: p.name,
          map: map
               });

        var infowindow = new google.maps.InfoWindow({
          content: p.category
    });
        a.addListener('click', function() {
          infowindow.open(map, a);
        });

        } )

}
