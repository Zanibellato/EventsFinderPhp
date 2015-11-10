var app = app || {};

(function () {
    "use strict";
    function Event() {

        var event = {
            title: "",
            description: "",
            startDate: "",
            startTime: "",
            category: "",
            venueName: "",
            country:"",
            city:"",
            location: "",
            locationLat: null,
            locationLng: null,
            url: "",
            source: "",
            img: ""
        };

        var createEvent =
            function(title , description, startDate, startTime, category,
                     venueName,country, city, location, locationLat, locationLng, url, source, img){
                event.title = title;
                event.description = description;
                event.startDate = startDate;
                event.startTime = startTime;
                event.category = category;
                event.venueName = venueName;
                event.country = country;
                event.city = city;
                event.location = location;
                event.locationLat = locationLat;
                event.locationLng = locationLng;
                event.url = url;
                event.source = source;
                event.img = img;
            };

        var getTheEvent = function(){

            //console.log(this.event);
            return event;

        };

        return {
            createEvent: createEvent,
            getTheEvent: getTheEvent
        };
    }// End of class Event()

    app.Event = Event;
}());

