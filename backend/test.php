<?php
error_reporting(E_ALL & ~E_NOTICE);

require_once("Core.inc.php");

$x = ["yarr" => "meaningasdfful_value"];
var_dump(IfNull($x["aharr"], IfNull($x["waharr"], $x["yarr"])));

//class MyDateTime implements JsonSerializable {
//
//    public $timestamp;
//
//    public function __construct($dateTime) {
//        $this->timestamp = strtotime($dateTime);
//    }
//
//    public function jsonSerialize() {
//        return 'new Date("' . date(DateTime::ATOM, $this->timestamp) .'")';
//    }
//
//}
//
//$dt = new MyDateTime('2016-01-22 09:01:01' );
//
//echo "type: " . gettype($dt) . "\n";
//
//$row = ['a' => $dt, 'b' => "2", "c" => 1];
//echo json_encode($row);

//function testJSON()
//{
//  $row = ['a' => "3", 'b' => "2", "c" => 1];
//  echo json_encode($row);



//  $dbh = new PDO('mysql:host=localhost;dbname=hsv', 'root', 'manni123', array(
//    PDO::ATTR_EMULATE_PREPARES => false
//  ));

//  foreach ($dbh->query('SELECT * from jos_categories') as $row) {
//    $id=$row['id'];
//    echo "\r\n" . json_encode($row);
//    //echo gettype($id);
//   }
//   $dbh = null;
//}
?>