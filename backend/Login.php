<?php

include "Core.inc.php";

$core = new MyCore();

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

echo json_encode($core->Login($request->username, $request->password));
?>