<?php

require_once("config.inc.php");
require_once("Core.inc.php");

$data = json_decode(file_get_contents('php://input'), true);

$core = new MyCore();
echo $core->SaveMatchPlayer($data);
?>