<?php
$countries = [];
$values = [];
try
{
    /*** connecting to the database ***/
    $mysql_hostname = 'localhost';
    $mysql_username = 'secure_user';
    $mysql_password = 'd8Kj462H79ls';
    $mysql_dbname = 'eventsfinder';

    $dbh = new PDO("mysql:host=$mysql_hostname;dbname=$mysql_dbname", $mysql_username, $mysql_password);

    /*** setting the error mode to exceptions ***/
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    /*** preparing the statement ***/
    $stmt = $dbh->prepare("SELECT countryName FROM country ORDER BY countryId");

    /*** executing the prepared statement ***/
    $stmt->execute();

    /*** Fetching a result ***/
    $countries = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);

    /*** Checking the result ***/
    if($countries== false)
    {
        $message = 'Something wrong here';
    }
    else
    {
        /*** preparing the statement ***/
        $stmt = $dbh->prepare("SELECT countryValue FROM country ORDER BY countryId");

        /*** executing the prepared statement ***/
        $stmt->execute();

        /*** Fetching a result ***/
        $values = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        if($countries== false)
        {
            $message = 'Something else wrong here';
        }
    }
}
catch(Exception $e)
{
    /*** An Exception has occurred ***/
    $message = $e;
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>EventsFinder V2</title>
        <link rel="shortcut icon" href="images/favicon.ico" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet"/>
    

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">EventsFinder</a>
                </div>
        
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="index.php">Home</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">About Us</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <form action="sendRequests.php" method="GET" class="form-inline" id="searchForm" onsubmit="return validateDate()">
                        <div id="location">
                            <div class="form-group">
                                <select class="form-control" id="country" name="country">
                                    <option value="">-- Select the country --</option>
                                    <?php
                                    /*** Displaying all the user posts ***/
                                    for($i = 0; $i < count($countries); $i++)
                                    {
                                        $j = $i + 1;
                                        $element = "<option value='$values[$i]'>$countries[$i]</option>";
                                        echo $element;
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="city">city</label>
                                <input type="text" class="form-control" id="city" name="city" placeholder="Your city">
                            </div>
                            <button type="button" id="search" class="btn btn-success">OK</button>
                        </div>
                        <div id="date">
                            <h2 class="text-success">Select a range of dates:</h2>
                            <div class="form-group">
                                <input class="form-control" id="datetimepicker" name="datetimepicker" type="text" placeholder="start">
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="datetimepicker1" name="datetimepicker1" type="text" placeholder="end">
                            </div>
                            <button type="submit" id="submit" class="btn btn-success">Search</button>
                        </div>
                    </form>
                    <!--
                    <form action="index.html">
                        <button type="submit" id="reset" class="btn btn-danger hidden">Reset</button>
                    </form>
                    -->
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <p id="message" class="text-danger"></p>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" id="eventsContainer">
                    <h2 id="title" class="text-primary">Unordered list of events:</h2>
                    
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" id="map"></div>
                <div class="col-md-1"></div>
            </div>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-1.10.2.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <!--Scripts-->
        <!--    - gmaps.js : it contains the code to create the map and add markers and infowindows-->
        <!--    - combiner.js: it gets the events and uses gmaps methods to mark the map-->
        <!--    - start.js : contains the callback function (start) used for the google maps Oauth script-->
        <script src="js/gmaps.js"></script>
        <script src="js/event.js"></script>
        <script src="js/songkick.js"></script>
        <script src="js/eventbrite.js"></script>
        <script src="js/combiner.js"></script>
        <script src="js/start.js"></script>
        <!--DateTime picker plugin-->
        <link rel="stylesheet" type="text/css" href="js/plugins/datetimepicker/jquery.datetimepicker.css"/ >
        <script src="js/plugins/datetimepicker/jquery.js"></script>
        <script src="js/plugins/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
        <script>
            jQuery('#datetimepicker').datetimepicker({
              format:'Y.m.d H:i'
            });

            jQuery('#datetimepicker1').datetimepicker({
                format:'Y.m.d H:i'
            });
        </script>
        <!--Google maps API OAuth script-->
        <script src="https://maps.googleapis.com/maps/api/js?callback=start" async defer></script>
    </body>
</html>
