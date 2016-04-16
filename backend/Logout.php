<?php

include "Core.inc.php";

$core = new MyCore();

echo json_encode($core->Logout());
?>