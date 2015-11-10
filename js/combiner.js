var app = app || {};

(function () {
    "use strict";
    
    //This class combines google maps API (gmaps.js) with other APIs to get events
    function Combiner() {
        
        var combiner = {
            map: null, //The Map object
            eventsList: [], //Array of Event objects
            markers: [], //Array of google maps Markers
            infoWindows: [], //Array of google maps infoWindows 
            country: '', //The country and 
            city: '', //The city in which looking for the events
            lat: null, //Latitude and
            lng: null, // longitude for country and city
            datetime: [],
            datetime2: [],
            eventbrite: null, // Eventbrite object
            songkick: null // Songkick object
        };
        
        //DOM elements 

         // display the message in case of errors
        var message = document.getElementById("message");

        // Used to submit the user search parameters
        var searchBtn = document.getElementById("search");
        
        //Used to reset and the user preferences and refresh the page
        var submitBtn = document.getElementById("submit");

        var title = document.getElementById("title");

        //The form that contains the dropdown list and the text field
        var searchForm = document.getElementById("searchForm");
        var locationDiv = document.getElementById("location");
        var dateDiv = document.getElementById("date");
        var datetimepicker = document.getElementById("datetimepicker");
        var datetimepicker1 = document.getElementById("datetimepicker1");
        dateDiv.className = "hidden";
        title.className = "hidden";
        //Adding event listener to the buttons
        searchBtn.addEventListener("click", setPreferences);
        submitBtn.addEventListener("click", dateValidation);


        //Get the user input from the search bar and the select element
        function setPreferences(){

            //Pointing the DOM elements
            var country = document.getElementById("country");
            var city = document.getElementById("city");

            //Storing the values from the user inputs
            combiner.country = country.options[country.selectedIndex].value;           
            combiner.city = city.value;
            //Checking the fields
            if(combiner.city !== "" && combiner.country !== "" && combiner.datetime !== ""){
                //The fields are valid
                //Hiding the search fields and the search button
                locationDiv.className = "hidden";
                dateDiv.className = "visible";
                title.className = "text-primary";
                //calling the google maps api
                initMap();
            }else{
                //One of the fields or both are empty
                message.innerHTML = "Both fields are required!";
            }             
        }; //End of setPreferences()

        function dateValidation(){
            combiner.datetime = datetimepicker.value.split(" ");
            combiner.datetime2 = datetimepicker1.value.split(" ");
            if(datetimepicker.value == "" && datetimepicker1.value == ""){
                message.innerHTML = "Date fields are required!";
            }
        };

        //It runs the requests to the APIs
        var getEvents = function() {
            
            //Creating a new Eventbrite object
            combiner.eventbrite = new app.Eventbrite();

            //Get the events from Eventbrite API using the location parameters
            var promise1 = combiner.eventbrite.getEventbriteEvents(combiner.country, combiner.city, combiner.lat, combiner.lng).done(function(){
                
                //Getting a temporary list of eventBrite events
                var evs = combiner.eventbrite.getList();

                //Pushing all the events in the global eventList[]
                for(var i = 0; i < evs.length; i++){
                    var e = evs[i];
                    combiner.eventsList.push(e);
                } 
            });

            combiner.songkick = new app.Songkick();
            var promise2 = combiner.songkick.getSongkickEvents(combiner.country, combiner.city, combiner.lat, combiner.lng).done(function(){
                var evs = combiner.songkick.getList();
                for(var i = 0; i < evs.length; i++){
                    var e = evs[i];
                    combiner.eventsList.push(e);
                }  
            });  
            
            //$.when(promise1, promise2).done(createMarkers);
            $.when(promise1, promise2).done(storeIntoDB);
        }; // End of getEvents()

        var storeIntoDB = function(){
            var promises = [];
            combiner.eventsList.forEach(function(event, i, arr){
                var promise = $.ajax({
                    type: "POST",
                    url: "addEvents.php",
                    data: event,
                    cache: true
                })
                promises.push(promise);
            })
            $.when(promises.length == combiner.eventsList.length).done(createMarkers);
        };

        //Creating and initializing a Map object
        var initMap = function () {
            combiner.map = new app.Map();
            combiner.map.initMap();

            //Using google geoCode APIs to get the coordinates of the city
            combiner.map.geoCodeThis(combiner.city + ', ' + combiner.country, function(res){
                combiner.lat = res.results[0].geometry.location.lat;
                combiner.lng = res.results[0].geometry.location.lng;
                //Calling the getEvents function
                getEvents();
            }); 
            
        };
        
        var eventsContainer = document.getElementById("eventsContainer");
        
        var createMarkers = function () {
            combiner.eventsList.forEach(function (event, i, arr) {                
                //var shortDescription;
                //console.log(event);
                var time;
                if(event.startTime){
                    time = event.startTime;
                }
                var contentString =
                            '<div class="row jumbotron">' +
                                '<div class="col-md-4">' +  
                                    '<h3 class="secondHEading"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> ' + event.startDate + 
                                    '<br><span class="glyphicon glyphicon-time" aria-hidden="true"></span> ' + time + '</h3>' + 
                                    '<img class="img-responsive" style="width: 100%; data-src="http://assets.sk-static.com/assets/default_images/thumb/default-artist-ba18a04.png" src="' + event.img+ '" alt="'+ event.title+'"/>' +
                                '</div>'+
                                '<div class="col-md-8">' +
                                    '<h2 class="firstHeading text-info">'+event.title+'</h2>' +
                                    '<div class="bodyContent">' /*+ "<h2>"+ event.locationLat + ", " + event.locationLng+ "</h2>"*/ +
                                        '<p>' +
                                            event.description +
                                        '</p>' +
                                        '<br> <a class="btn btn-success" href="' + event.url + '" target="_blank">' +
                                        'Read More</a> ' +
                                    '</div>' +
                                '</div>' +
                            '</div>' ;
                var infowindow = combiner.map.createInfoWindow(contentString);
                combiner.infoWindows.push(infowindow);
                var marker = combiner.map.createMarker(event.locationLat, event.locationLng, event.title, event.source);
                combiner.markers.push(marker);
                var markerToAttach = combiner.markers[combiner.markers.indexOf(marker)];
                var infoWindowToAttach = combiner.infoWindows[combiner.infoWindows.indexOf(infowindow)];
                combiner.map.attachInfoWindow(markerToAttach, infoWindowToAttach);
                
                var element = document.createElement("div");
                element.className = "event";                
                
                element.innerHTML = contentString;
                eventsContainer.appendChild(element);
                
            });
            combiner.map.fitTheMap();
            
        };
        
        
    }
    
    app.Combiner = Combiner;
}());