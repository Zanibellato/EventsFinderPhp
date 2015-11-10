<?php
/*** begin our session ***/
session_start();

/*** Taking data from the ajax call ***/
$title = filter_var($_POST['title'], FILTER_SANITIZE_STRING);
$description = filter_var($_POST['description'], FILTER_SANITIZE_STRING);
$startDate = filter_var($_POST['startDate'], FILTER_SANITIZE_STRING);
$startTime = filter_var($_POST['startTime'], FILTER_SANITIZE_STRING);
$dateTime = $startDate . " " . $startTime;
$category = filter_var($_POST['category'], FILTER_SANITIZE_STRING);
$venueName = filter_var($_POST['venueName'], FILTER_SANITIZE_STRING);
$country = filter_var($_POST['country'], FILTER_SANITIZE_STRING);
$city = filter_var($_POST['city'], FILTER_SANITIZE_STRING);
$location = filter_var($_POST['location'], FILTER_SANITIZE_STRING);
$locationLat = filter_var($_POST['locationLat'], FILTER_SANITIZE_STRING);
$locationLng = filter_var($_POST['locationLng'], FILTER_SANITIZE_STRING);
$url = filter_var($_POST['url'], FILTER_SANITIZE_STRING);
$source = filter_var($_POST['source'], FILTER_SANITIZE_STRING);
$img = filter_var($_POST['img'], FILTER_SANITIZE_STRING);
try
{
    /*** connecting to the database ***/
    $mysql_hostname = 'localhost';
    $mysql_username = 'secure_user';
    $mysql_password = 'd8Kj462H79ls';
    $mysql_dbname = 'eventsFinder';

    $dbh = new PDO("mysql:host=$mysql_hostname;dbname=$mysql_dbname", $mysql_username, $mysql_password);
    /*** setting the error mode to exceptions ***/
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    /*** preparing the insert statement ***/
    $stmt = $dbh->prepare("INSERT IGNORE INTO event (title , description, startDate, category,
                venueName, country, city, location, latitude, longitude, url, source, img) VALUES (:title , :description, :datetime, :category,
                :venueName, :country, :city, :location, :locationLat, :locationLng, :url, :source, :img)");

    /*** binding the parameters ***/
    $stmt->bindParam(':title', $title, PDO::PARAM_STR);
    $stmt->bindParam(':description', $description, PDO::PARAM_STR);
    $stmt->bindParam(':datetime', $dateTime, PDO::PARAM_STR);
    $stmt->bindParam(':category', $category, PDO::PARAM_STR);
    $stmt->bindParam(':venueName', $venueName, PDO::PARAM_STR);
    $stmt->bindParam(':country', $country, PDO::PARAM_STR);
    $stmt->bindParam(':city', $city, PDO::PARAM_STR);
    $stmt->bindParam(':location', $location, PDO::PARAM_STR);
    $stmt->bindParam(':locationLat', $locationLat, PDO::PARAM_STR);
    $stmt->bindParam(':locationLng', $locationLng, PDO::PARAM_STR);
    $stmt->bindParam(':url', $url, PDO::PARAM_STR);
    $stmt->bindParam(':source', $source, PDO::PARAM_STR);
    $stmt->bindParam(':img', $img, PDO::PARAM_STR);

    /*** executing the prepared statement ***/
    $stmt->execute();

    $message = 'New event added';

}
catch(Exception $e)
{
    /*** An Exception has occurred ***/
    $message = $e;
}
?>
<html>
<head>
    <title>MX task | add post</title>
</head>
<body>
<p><?php echo $message; ?>
</body>
</html>