Project: EventFinder
Technologies Used: javascript, jquery, php, bootstrap, mySQL.
Author: Valerio Zanibellato
github link: https://github.com/Zanibellato/EventsFinderPhp.git

Requirements:
PHP 5.6.10
mySQL 5.5

Description:

    Javascript files

        -event.js:
            It defines the class Event and the constructor, it's used to create a custom type for the event
            returned by the APIs.

        - eventbrite.js:
            It manages the requests to the eventbrite API (http://developer.eventbrite.com).
            For each event, the code create an element of the class "Event" using a constructor, and pushes the element
            inside an array which can be returned using the method geList().

        -songkick.js:
            It manages the requests to the songkick API (http://www.songkick.com/developer).
            For each event, the code create an element of the class "Event" using a constructor, and pushes the element
            inside an array which can be returned using the method geList().

        - gmaps.js:
            It's used to create a google map, the markers, the infowindows and gecoding the country and the city from the users.

        - combiner.js:
            It's the core of the application, it combines all the other files and make an ajax request to the addEvent.php page to store
            the events into the database.

        - dateValidation.js:
            It checks if the date the user submit are valid.

        - start.js:
            It creates the combiner object as a singleton. The function start() is called by the google maps API using a callback function
            in the url.

    PHP files

        - index.php:
            It takes the country list from the database and creates the options for the select.
            It displays the unfiltered and unordered list of the events taken from the APIs requests and appended
            using javascript and a map with the markers.

        - sendRequests.php:
            It takes the user date filters and sort preferences and takes the events from the database.
            After the query to the database it display the events filtered and sorted and the map with the markers.

        - addEvents.php:
            It's used to submit an INSERT statement to the database and store the events.
            The page it's called using ajax inside the combiner.js file.



