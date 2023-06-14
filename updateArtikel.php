<h1>Update artikel</h1>

<?php

include 'conn.php';
include 'include/verkoop.php';

$conn = dbConnect();
$verkoop = new Verkoop();

echo '<form action="update1artikel.php" method="post">
	<input type="hidden" name="id" value="$_POST[bewerken]">
	<label>artOmschrijving</label>
	<input type="text" name="artOmschrijving" required></br>
	<label>artInkoop</label>
	<input type="text" name="artInkoop" required></br>
	<label>artVerkoop</label>
	<input type="text" name="artVerkoop" required ></br>
	<label>artVoorraad</label>
	<input type="text" name="artVoorraad" required	></br>
	<label>artMinVoorraad</label>
	<input type="text" name="artMinVoorraad" required></br>
	<label>artMaxVoorraad</label>
	<input type="text" name="artMaxVoorraad" required></br>
	<label>artLocatie</label>
	<input type="text" name="artLocatie" required></br>
	<label>levId </label>
	<input type="text" name="levId " required></br>
	<input type="submit" name="submit" name="update" value="Bewerken">
</form>';

if(!empty($_POST['update'])){
	$verkoop->updateVerkoop($_POST['id'], $_POST['Klantid'], $_POST['artId'], $_POST['verkOrdDatum'], $_POST['verkOrdStatus'], $conn);
}

?>


?>