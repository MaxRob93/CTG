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
    map: map,
    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
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

   // Moves the shadow of the arrow 76px to the left margin
   iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

// Moves the arrow 76px to the left margin
   iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

  // Changes the desired color for the tail outline.
// The outline of the tail is composed of two descendants of div which contains the tail.
// The .find('div').children() method refers to all the div which are direct descendants of the previous div.
   iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

   // Taking advantage of the already established reference to
// div .gm-style-iw with iwOuter variable.
// You must set a new variable iwCloseBtn.
// Using the .next() method of JQuery you reference the following div to .gm-style-iw.
// Is this div that groups the close button elements.
var iwCloseBtn = iwOuter.next();

// Apply the desired effect to the close button
iwCloseBtn.css({
  opacity: '0.8', // by default the close button has an opacity of 0.7
  right: '44px', top: '7px', // button repositioning
  // border: '1px solid #008361', // increasing button border and new color
  'border-radius': '13px', // circular effect
  'box-shadow': '0 0 5px #008361' // 3D effect to highlight the button
  });

// The API automatically applies 0.7 opacity to the button after the mouseout event.
// This function reverses this event to the desired value.
iwCloseBtn.mouseout(function(){
  $(this).css({opacity: '1'});
});

});
})
}

autocomplete();


