<h1>Update Klant</h1>

<?php

include 'conn.php';
include 'include/verkoop.php';

$conn = dbConnect();
$verkoop = new Verkoop();

echo '<form action="updateKlant.php" method="post">
	<input type="hidden" name="id" value="$_POST[bewerken]">
	<label>Naam</label>
	<input type="text" name="naam" required></br>
	<label>Email</label>
	<input type="text" name="email" required></br>
	<label>Adres</label>
	<input type="text" name="adres" required ></br>
	<label>Postcode</label>
	<input type="text" name="postcode" required	></br>
	<label>Woonplaats</label>
	<input type="text" name="woonplaats" required></br>
	<input type="submit" name="submit" value="Update">
</form>';

if(!empty($_POST['update'])){
	$verkoop->updateVerkoop($_POST['id'], $_POST['Klantid'], $_POST['artId'], $_POST['verkOrdDatum'], $_POST['verkOrdStatus'], $conn);
}

?>

