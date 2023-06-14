<!DOCTYPE html>
<html>
<body>

	<h1>Update Status</h1>
	<?php 

	include "conn.php";
	include "include/verkoop.php";

	$conn = dbConnect();
	$klanten = new Verkoop();
	$klanten = $klanten->getKlanten($conn);
	?>

	<form action="updateStatus.php" method="post">
		<select name="klant" required>
		<?php foreach ($klanten as $klanten){
		foreach ($klanten as $row){ ?>
	    <option><?=$row?></option>
		<?php }} ?>
		</select></br></br>
		<input type="submit" name="submit" value="Zoeken">
	</form>

	<?php 
	if(!empty($_POST['submit'])){
		$data = $_POST['klant'];
		$klanten = $Klanten->
	}?>


</body>
</html>



