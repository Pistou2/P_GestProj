<html>
 <head>
  <title>Test PHP</title>
 </head>
 <body>
 <p>Bonjour le monde</p>
 <?php
echo 'hello';
try {
    $dbh = new PDO('mysql:host=localhost;dbname=db_mnry', 'root', '');
    foreach($dbh->query('SELECT * from t_person') as $row) {
        print_r($row);
    }
    $dbh = null;
} catch (PDOException $e) {
    print "Erreur !: " . $e->getMessage() . "<br/>";
    die();
}
//fermer la connexion
$dbh = null;
?>
 </body>
</html>