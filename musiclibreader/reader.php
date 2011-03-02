<html>
<head><title>My mp3Library</title></head>
<body>
<?php
	$xml = simplexml_load_file('musiclib.xml');
?>
	
<h1>Info</h1>
<?php
	$a = $xml->xpath("/MyMusic/info/artists");
	$b = $xml->xpath("/MyMusic/info/albums");
	$c = $xml->xpath("/MyMusic/info/songs");
	print "Artists: <b>" . $a[0]['total'] . "</b><br>";
	print "Albums: <b>" . $b[0]['total'] . "</b><br>";
	print "Songs: <b>" . $c[0]['total'] . "</b><br>";
?>

<h1>Albums</h1>
<?php
	$artists = $xml->xpath("/MyMusic/music/artist");
	foreach($artists as $art ) {
		print "<b>" . $art['name'] . "</b><br>";
		foreach ($art as $album) {
			print "<i>" . $album['name'] . "</i><br>";
			foreach ($album as $song) {
				print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $song . "<br>";
			}
		}
	}
?>
</body>
</html>