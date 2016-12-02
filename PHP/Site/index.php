<!DOCTYPE html>
<!--
ETML
Author: 
Date: 
Summary: 
-->
<html lang="fr">
	<head>
		<meta charset="UTF-8">
		<link href="resources/css/common.css" rel="Stylesheet" type="text/css">
		<title></title>
	</head>
	<body>
        
		<div id="container">
			<header>
				<p>LOGO</p>
			</header>
			<nav>  
            </nav>
			<section>
			<p>PHP begin</p>
			
			<?php
				try {
					$dbh = new PDO('mysql:host=localhost;dbname=db_mnry', 'root', '');
					foreach($dbh->query('SELECT forTitle from t_formation') as $row) {
						//print_r($row);
						print $row['forTitle'] . "<br/>";
					}
					$dbh = null;
				} catch (PDOException $e) {
					print "Erreur !: " . $e->getMessage() . "<br/>";
					die();
				}
				//fermer la connexion
				$dbh = null;
			?>
			
			<p>PHP stop</p>
				<table>
				
					<tr>
						<td><p>test</p></td>
						<td><p>test</p></td>
						<td><p>test</p></td>
						<td><p>test</p></td>
						<td><p>test</p></td>
					</tr>
					
				</table>
			</section>
			<footer>
                <p>copyright</p>
			</footer>
		</div>
	</body>
</html>
