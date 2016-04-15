<?php

require_once("Config.inc.php");

/**
 * core short summary.
 *
 * core description.
 *
 * @version 1.0
 * @author Manfred
 */
class MyCore
{
    protected $db = null;

    public function __construct() 
    {
        session_start();

        $db = new mysqli($_ENV["db_server"], $_ENV["db_user"], $_ENV["db_password"], $_ENV["db_catalog"]);
        if (mysqli_connect_errno()) {
                throw new \Exception('Connect failed. '.mysqli_connect_error());
        }
        if (!mysqli_set_charset($db, 'utf8')) {
                throw new \Exception('Error setting charset. '.mysqli_error($db));
        }
        if (!mysqli_query($db,'SET SESSION sql_mode = \'ANSI_QUOTES\';')) {
                throw new \Exception('Error setting ANSI quotes. '.mysqli_error($db));
        }
        
        $this->db = $db;
    }

    public function Login($username, $password) {
	    $passHash = hash(PASSWORD_HASH_ALGO, $password);

	    $sql = "select id from `" . $_ENV["table_prefix"] . "users` where username=? and password=?";

      $result = array("result" => false, "message" => "Benutzer Passwort Kombination ist falsch.");
      
      if ($stmt = $this->db->prepare($sql))
      {
          $stmt->bind_param("ss", $username, $passHash);
          $stmt->execute();
          $stmt->bind_result($id);
          
          if ($stmt->fetch()) {
            $_SESSION["user_id"] = $id; 
            $result["result"] = true;
            $result["message"] = "ok";
          }
          
          $stmt->close();
      }
      
	    if (isset($_SESSION["user_id"]))
        $result["user"] = $this->GetSelf();
      
	    return $result;
    }

    public function Logout() {
    	unset($_SESSION["user_id"]);
    }
    
    public function GetSelf() {
	    $result = null;
	    if (isset($_SESSION["user_id"])) {
		    $sql = "select id, username, firstname, lastname, email, id_team, rights from `" . $_ENV["table_prefix"]
				    . "users` where id = ?";

        if ($stmt = $this->db->prepare($sql))
        {
            $stmt->bind_param("i", $_SESSION["user_id"]);
            $stmt->execute();
            $stmt->bind_result($id, $username, $firstname, $lastname, $email, $id_team, $rights);
            
            if ($stmt->fetch()) {
              $result = array();
              $result["id"] = $id;
              $result["username"] = $username;
              $result["firstname"] = $firstname;
              $result["lastname"] = $lastname;
              $result["email"] = $email;
              $result["id_team"] = $id_team;
              $result["rights"] = $rights;
              
              $result["password"] = PASSWORD_DUMMY;
              $result["confirmPassword"] = PASSWORD_DUMMY;
            }
            
            $stmt->close();
        }
	    }
	    return $result;
    }
		
    public function SaveMatchPlayer($data)
    {
        $sql = "select id, id_player from " . $_ENV["table_prefix"] . "match_player";
        $sql .= " where id_match = ?";
        $sql .= " and id_saison_team = ?";
        
        $playerToMatchPlayer = array();
        
        if ($stmt = $this->db->prepare($sql))
        {
            $stmt->bind_param("ii", $data["matchId"], $data["saisonTeamId"]);
            
            $stmt->execute();

            $stmt->bind_result($id, $idPlayer);

            while ($stmt->fetch()) {
                $playerToMatchPlayer[$idPlayer] = $id;
            }

            $stmt->close();
        }
        
        //print_r($data);
        //print_r($playerToMatchPlayer);
        
        foreach($data["player"] as $player)
        {
            if (array_key_exists($player["id"], $playerToMatchPlayer))
            {
                $matchPlayerId = $playerToMatchPlayer[$player["id"]];
                
                unset($playerToMatchPlayer[$player["id"]]);
                
                // update item
                $querySql = "UPDATE " . $_ENV["table_prefix"] . "player_match ";
                $querySql .= "SET hasRedCard = ?, hasYellowCard = ?, hasYellowRedCard = ?, goals = ?";
                $querySql .= " WHERE id = ?";
                
                if ($querySql != "" && $stmt = $this->db->prepare($querySql))
                {
                    $stmt->bind_param("iiiii", 
                            $player["hasRedCard"], 
                            $player["hasYellowCard"], 
                            $player["hasYellowRedCard"], 
                            $player["goals"], 
                            $matchPlayerId);
                    $stmt->execute();
                    $stmt->close();
                }
            }
            else
            {
                // create
                // check for saison player
                $querySql = "select id from " . $_ENV["table_prefix"] . "saison_player where id_player = ?";
                
                $saisonPlayerId = -1;
                
                if ($stmt = $this->db->prepare($querySql))
                {
                    $stmt->bind_param("i", $player["id"]);
                    $stmt->execute();
                    $stmt->bind_result($saisonPlayerId);
                    
                    if (!$stmt->fetch())
                        $saisonPlayerId = -1;
                    
                    $stmt->close();
                }
                
                if ($saisonPlayerId < 0)
                {
                    // create new saison player
                    $querySql = "insert into " . $_ENV["table_prefix"] . "saison_player";
                    $querySql .= " (id_saison_team, id_player)";
                    $querySql .= " values(?,?)";
                
                    if ($stmt = $this->db->prepare($querySql))
                    {
                        $stmt->bind_param("ii", $data["saisonTeamId"], $player["id"]);
                        $stmt->execute();
                        
                        $saisonPlayerId = $this->db->insert_id;
                        
                        $stmt->close();
                    }
                }
                
                $querySql = "INSERT INTO " . $_ENV["table_prefix"] . "player_match ";
                $querySql .= "(id_match, id_saison_player, hasRedCard, hasYellowCard, hasYellowRedCard, goals)";
                $querySql .= "VALUES (?, ?, ?, ?, ?, ?)";
                if ($stmt = $this->db->prepare($querySql))
                {
                    $stmt->bind_param("iiiiii", 
                            $data["matchId"], 
                            $saisonPlayerId, 
                            $player["hasRedCard"],
                            $player["hasYellowCard"], 
                            $player["hasYellowRedCard"],
                            $player["goals"]);
                    
                    $stmt->execute();
                    $stmt->close();
                }
            }
            
        }
        
        $idsToDelete = "";
        
        // delete all not set
        foreach($playerToMatchPlayer as $playerId => $matchPlayerId)
        {
            if (is_int($matchPlayerId))
            {
                if ($idsToDelete != "")
                    $idsToDelete .= ", ";
                $idsToDelete .= $matchPlayerId;
            }
        }
        
        if ($idsToDelete != "")
            $this->db->query("DELETE FROM " . $_ENV["table_prefix"] . "player_match WHERE id IN ($idsToDelete)");
        
        return true;
    }
}

?>
