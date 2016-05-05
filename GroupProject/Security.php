<?php
/**
 * Created by PhpStorm.
 * User: Christian
 * Date: 5/4/2016
 * Time: 3:44 PM
 */
class Security
{
  private $db;

    function __construct($DB_con)
    {
        $this->db = $DB_con;
    }
    public function register($FirstName,$LastName,$Address,$City,$PostalCode,$PhoneNumber,$UserName,$Password,$Email)
    {
        try
        {
            $new_password = password_hash($Password, PASSWORD_DEFAULT);

            $stmt = $this->db->prepare("CALL spInsertClient();");

            $stmt->bindparam(":FirstName", $FirstName);
            $stmt->bindparam(":LastName", $LastName);
            $stmt->bindparam(":Address", $Address);
            $stmt->bindparam(":City", $City);
            $stmt->bindparam(":PostalCode", $PostalCode);
            $stmt->bindparam(":PhoneNumber", $PhoneNumber);
            $stmt->bindparam(":UserName", $UserName);
            $stmt->bindparam(":Email", $Email);
            $stmt->bindparam(":Password", $new_password);
            $stmt->execute();
            return $stmt;
        }
        catch(PDOException $e)
        {
            echo $e->getMessage();
        }
    }

    public function login($UserName,$Password)
    {
        try
        {
            $stmt = $this->db->prepare("CALL spLogin();");

            $stmt->bindparam(":UserName", $UserName);
            $stmt->bindparam(":Password", $Password);
            $stmt->execute();
            return $stmt;
            
            if($stmt->rowCount() > 0)
            {
                if(password_verify($Password, $userRow['Password']))
                {
                    $_SESSION['user_session'] = $userRow['ClientID'];
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        catch(PDOException $e)
        {
            echo $e->getMessage();
        }
    }

    public function is_loggedin()
    {
        if(isset($_SESSION['user_session']))
        {
            return true;
        }
    }

    public function redirect($url)
    {
        header("Location: $url");
    }

    public function logout()
    {
        session_destroy();
        unset($_SESSION['user_session']);
        return true;
    }
}
?>