<div class="box_kategori">
<?php
$connection = mysql_pconnect('localhost', 
						 'wbd_user1',
						 'wbd@if3110') 
		  or die('Tidak dapat membuat koneksi');

mysql_select_db('tugas_wbd1');

$num_kategori_query = 'SELECT COUNT(kategori_id) FROM barang_kategori';
$num_kategori = mysql_query($num_kategori_query, $connection);
$num_kategori_tabel = mysql_fetch_array($num_kategori);

$kategori = $num_kategori_tabel['COUNT(kategori_id)'];

for ($i = 1; $i <= $kategori; $i++){
	$nama_kategori_query = sprintf('SELECT kategori_nama FROM barang_kategori WHERE kategori_id ="%d"',$i);
	$nama_kategori = mysql_query($nama_kategori_query, $connection);
	$nama_kategori_tabel = mysql_fetch_array($nama_kategori);
	
	$numItem = 3;
	$productId = 0;
	
	$num_barang_query = sprintf('SELECT barang_data.barang_id, nama, image_url, harga FROM `barang_kategori` 
	JOIN barang_data JOIN transaksi ON barang_kategori.kategori_id = barang_data.kategori_id 
	AND barang_data.barang_id = transaksi.barang_id WHERE barang_data.kategori_id = "%d" 
	GROUP BY barang_data.barang_id ORDER BY COUNT(nama)DESC',$i);
	$num_barang = mysql_query($num_barang_query, $connection);
	
	if(mysql_num_rows($num_barang) > 0) {
        echo '<div class="box_nama"><h2>'.$nama_kategori_tabel['kategori_nama'].'</h2></div>';
		$nama_size = 0;
		while($num_barang_tabel = mysql_fetch_assoc($num_barang)) {
			$nama[] = $num_barang_tabel['nama'];
			$image_url[] = $num_barang_tabel['image_url'];
			$harga[] = $num_barang_tabel['harga'];
			$id[] = $num_barang_tabel['barang_id'];
			$nama_size++;
		}
		
		for ($j = 1; $j < $numItem+1; $j++){
			echo '
			<a class="box_barang" href="'.HOME_URL.'barang/'.$id[$j-1].'">
			<img class="gambar_barang" src="';
			if($image_url[$j-1] == "" || $image_url[$j-1] == null) 
				print HOME_URL."assets/image/default.png"; 
			else 
				print HOME_URL.urldecode($image_url[$j-1]);
			echo '" alt="Default" height="100" width="100">
			<h3>'.$nama[$j-1].'</h3>
			<span class="harga">Rp. '.$harga[$j-1].'</span>
			</a>';
			if ($j >= $nama_size) break;
		}
		$nama = NULL;
		$image_url = NULL;
		$harga = NULL;
	}
}
?>
</div>