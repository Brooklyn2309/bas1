<h1>Update verkooporder</h1>

<?php

include 'conn.php';
include 'include/verkoop.php';

$conn = dbConnect();
$verkoop = new Verkoop();

echo '<form action="updateVerkoop.php" method="POST">';
	echo '<input type="hidden" name="id" value="$_POST[bewerken]">';
	echo '<label>Klant ID</label>
	<input type="text" name="Klantid" required></br>
	<label>Artikel ID</label>
	<input type="text" name="artId" required></br>
	<label>Verkoop order datum</label>
	<input type="text" name="verkOrdDatum" required ></br>
	<label>Bestel aantal</label>
	<input type="text" name="verkOrdBestAantal" required	></br>
	<label>Status</label>
	<input type="text" name="verkOrdStatus" required></br>
	<input type="submit" name="update" value="Bewerken">
</form>';

if(!empty($_POST['update'])){
	$verkoop->updateVerkoop($_POST['id'], $_POST['Klantid'], $_POST['artId'], $_POST['verkOrdDatum'], $_POST['verkOrdStatus'], $conn);
}

?>