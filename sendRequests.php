<?php
$country = filter_var($_GET['country'], FILTER_SANITIZE_STRING);
$city = filter_var($_GET['city'], FILTER_SANITIZE_STRING);
$start = filter_var($_GET['datetimepicker'], FILTER_SANITIZE_STRING);
$endDate = filter_var($_GET['datetimepicker1'], FILTER_SANITIZE_STRING);
$events = [];
if(!isset( $_GET['country'], $_GET['city'], $_GET['datetimepicker'], $_GET['datetimepicker1']))
{
    $message = 'both parameters are required';
}
else{
    try{
        /*** connecting to the database ***/
        $mysql_hostname = 'localhost';
        $mysql_username = 'secure_user';
        $mysql_password = 'd8Kj462H79ls';
        $mysql_dbname = 'eventsfinder';

        $dbh = new PDO("mysql:host=$mysql_hostname;dbname=$mysql_dbname", $mysql_username, $mysql_password);

        /*** setting the error mode to exceptions ***/
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        /*** preparing the statement ***/
        $stmt = $dbh->prepare("SELECT title, description, startDate, category, venueName, url, img FROM event WHERE country = :country AND  city = :city AND startDate BETWEEN :start AND :endDate ORDER BY startDate ASC");

        /*** binding the parameters ***/
        $stmt->bindParam(':country', $country, PDO::PARAM_STR);
        $stmt->bindParam(':city', $city, PDO::PARAM_STR);
        $stmt->bindParam(':start', $start, PDO::PARAM_STR);
        $stmt->bindParam(':endDate', $endDate, PDO::PARAM_STR);
        /*** executing the prepared statement ***/
        $stmt->execute();

        /*** Fetching a result ***/
        $events = $stmt->fetchAll(PDO::FETCH_ASSOC);

        /*** Checking the result ***/
        if($events == false)
        {
            $message = "something wrong";
        }
        else{
            $message = "List of the events for " . $city . " (" . $country . ")";
        }

    }
    catch(Exception $e){
        $message = $e;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>EventsFinder</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
            <a class="navbar-brand" href="index.php">EventsFinder</a>
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
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form action="sendRequests.php" method="GET" class="form-inline" id="searchForm" onsubmit="return validateDate()">
                <div id="location hidden">
                    <div class="form-group">
                        <select class="form-control hidden" id="country" name="country">
                            <option value="<?php echo $country; ?>"></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control hidden" id="city" name="city" value="<?php echo $city; ?>">
                    </div>
                </div>
                <div id="date">
                    <h2 class="text-success">Select a range of dates:</h2>
                    <div class="form-group">
                        <input class="form-control" id="datetimepicker" name="datetimepicker" type="text" value="<?php echo $start ?>">
                    </div>
                    <div class="form-group">
                        <input class="form-control" id="datetimepicker1" name="datetimepicker1" type="text" value="<?php echo $endDate ?>">
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

        </div>
        <div class="col-md-1"></div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" id="map"></div>
        <div class="col-md-1"></div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h2 class="text-primary"><?php echo $message; ?></h2>
            <?php

            for($i = 0; $i < count($events); $i++)
            {
                $title = $events[$i]['title'];
                $description = $events[$i]['description'];
                $date = $events[$i]['startDate'];
                $img = $events[$i]['img'];
                $url = $events[$i]['url'];
                $category = $events[$i]['category'];

                $element = '<div class="row jumbotron">' .
                    '<div class="col-md-4">' .
                    '<h2>'. $category . '</h2>' .
                    '<h3 class="secondHeading"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> ' . $date . '</h3>' .
                    '<img class="img-responsive" data-src="http://assets.sk-static.com/assets/default_images/thumb/default-artist-ba18a04.png" src="' . $img . '" alt="'. $title .'"/>' .
                    '</div>'.
                    '<div class="col-md-8">' .
                    '<h2 class="firstHeading text-info">'. $title .'</h2>' .
                    '<div class="bodyContent">' .
                    '<p>' .
                    $description .
                    '</p>' .
                    '<br> <a class="btn btn-success" href="' . $url . '" target="_blank">' .
                    'Read More</a> ' .
                    '</div>' .
                    '</div>' .
                    '</div>' ;


                //$element = "<div class='post'><h2>Event</h2><p> $title</p></div>";
                echo $element;
            }
            ?>
        </div>
        <div class="col-md-1"></div>
    </div>

</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.10.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
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
</body>
</html>
