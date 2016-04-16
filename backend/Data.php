<?php

require_once("php-crud-api/api.php");

require_once("Core.inc.php");

// uncomment the lines below when running in stand-alone mode:
$isAllowedTableFunction = function($cmd, $db, $tab) {
	// read/list is allowed for all   
	if ($cmd == 'list' || $cmd == 'read') {

		$tabShort = substr($tab, strlen($_ENV["table_prefix"]));

		switch ($tabShort) {
			case 'article':
			case 'matches':
			case 'scorer':
			case 'player':
			case 'team':
			case 'play_table':
			case 'saison':
				return true;
		}
	}

	if ($cmd == 'list' || $cmd == 'read' || $cmd == 'update' || $cmd == 'delete' || $cmd == 'create') {
		$core = new MyCore();
		$user = $core->GetSelf();
		if ($user != null && $user['rights'] == 'ADMIN') {
			return true;
		}
	}

	return false;
};

$api = new MySQL_CRUD_API(['hostname' => $_ENV["db_server"],
	'username' => $_ENV["db_user"],
	'password' => $_ENV["db_password"],
	'database' => $_ENV["db_catalog"],
	'charset' => 'utf8',
	'table_authorizer' => $isAllowedTableFunction
		]);
$api->executeCommand();

//$_ENV["table_prefix"]
?>