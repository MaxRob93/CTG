import { autocomplete } from './autocomplete';
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

  var contentString = ` <div id="iw-container"> <h3> ${p.name}</h3> </div>
  <div class="mapimage"> <img src="${p.photo.url}" style="width: 100%;"> </div>
   <div class='banner-description'>


    <h2>${p.category}</h2><p>${p.address}</p></div>`;
// Le back tick permet de créer un 'chunk' d html dans lequel on peut interpoler

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });
  a.addListener('click', function() {
    infowindow.open(map, a);
  });
  google.maps.event.addListener(infowindow, 'domready', function() {

   // Reference to the DIV which receives the contents of the infowindow using jQuery
   var iwOuter = $('.gm-style-iw');

   /* The DIV we want to change is above the .gm-style-iw DIV.
    * So, we use jQuery and create a iwBackground variable,
    * and took advantage of the existing reference to .gm-style-iw for the previous DIV with .prev().
    */
   var iwBackground = iwOuter.prev();
   iwOuter.css({'height' : '150px'});

   // Remove the background shadow DIV
   iwBackground.children(':nth-child(2)').css({'display' : 'none'});

   // Remove the white background DIV
   iwBackground.children(':nth-child(4)').css({'display' : 'none'});

});
})
}

autocomplete();


