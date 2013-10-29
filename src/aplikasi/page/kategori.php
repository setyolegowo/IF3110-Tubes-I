<div class="kategori">
    <h1><?php print $kategori['nama_kategori']; ?></h1>
    <p>
        <a class="sorting" href="?by=nama&amp;sort=asc&amp;page=1">Sorting By Name Ascending</a>
        <a class="sorting" href="?by=nama&amp;sort=desc&amp;page=1">Sorting By Name Descending</a>
        <a class="sorting" href="?by=harga&amp;sort=asc&amp;page=1">Sorting By Price Ascending</a>
        <a class="sorting" href="?by=harga&amp;sort=desc&amp;page=1">Sorting By Price Descending</a>
    </p>
	<p>
		<?php $size= $page_no?>
		<?php for ($i = 1; $i <= $size;$i++) {?>
			<?php 
				$uri = "?page=".$i;
				if ($filter == true) $uri = "?by=nama&amp;sort=desc&amp;page=".$i;
			
			?>
			<a class="sorting" href="<?php print $uri ?>"><?php print $i; ?></a>
		<?php } ?>
	</p>
    <?php foreach($kategori['data'] as $barang) { ?>
    <div class="box_barang">
        <img class="gambar_barang" src="<?php if($barang['image_url'] == "" || $barang['image_url'] == null) print HOME_URL."assets/image/default.png"; else print HOME_URL.urldecode($barang['image_url']) ?>" alt="<?php print $barang['nama']; ?>" height="100" width="100">
        <a href="<?php print HOME_URL."barang/".$barang['barang_id']; ?>"><?php print $barang['nama']; ?></a>
        <span class="harga">Rp.<?php print number_format($barang['harga'], 2, ',', '.'); ?></span>
        <form onSubmit="return addToShoppingChart(this)"><input type="hidden" name="id_barang" value="<?php print $barang['barang_id']; ?>"><input type="text" name="qty" onKeyUp="validateQty(this)"><input type="submit" value="+" disabled="disabled"></form>
    </div>
    <?php } ?>
</div>