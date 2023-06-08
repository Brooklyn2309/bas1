<!DOCTYPE html>
<html>
<body>
	<h1>Voeg Inkoop toe</h1>

	<form action="insertInkoop.php" method="post">
		<label>Leverancier</label>
		<select name="leverancier" required>
			<?php foreach ($leverancier as $row){ ?>
	   	<option><?=$row?></option>
		<?php } ?>
	</select></br>
	
		<input type="text" name="artId" placeholder="Artikel Id"required> *</br>
		<input type="text" name="aantal" placeholder="Aantal" required> *</br></br>
		<input type="submit" name="submit" value="Inkoop toevoegen">
	</form>

	<a href="index.php">Terug naar de hoofdpagina</a>

	<?php 

	if(isset($_POST['submit'])){
		include "conn.php";
		include 'include/inkoop.php';
		$conn = dbConnect();

		$lev = $_POST['levId'];
		$art = $_POST['artId'];
		$aantal = $_POST['aantal'];

		$inkoop = new Inkoop();
		$inkoop->insertInkoop($conn, $lev, $art, $aantal);
	}

	if(isset($inkoop) && $inkoop == true){
		echo '<script>alert("Inkoop toegevoegd")</script>';
        echo "<script> location.replace('index.php'); </script>";
	} 

	?>
</body>
</html>