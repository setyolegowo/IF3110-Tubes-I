<div class="kategori">
    <h1><?php print $kategori['nama_kategori']; ?></h1>
    <p>
        <a class="sorting" href="?by=nama&sort=asc">Sorting By Name Ascending</a>
        <a class="sorting" href="?by=nama&sort=desc">Sorting By Name Descending</a>
        <a class="sorting" href="?by=harga&sort=asc">Sorting By Price Ascending</a>
        <a class="sorting" href="?by=harga&sort=desc">Sorting By Price Descending</a>
    </p>
    <?php foreach($kategori['data'] as $barang) { ?>
    <div class="box_barang">
        <img class="gambar_barang" src="<?php if($barang['image_url'] == "" || $barang['image_url'] == null) print HOME_URL."assets/image/default.png"; else print urldecode($barang['image_url']) ?>" alt="Default" height="100" width="100">
        <a href="<?php print HOME_URL."barang/".$barang['barang_id']; ?>"><?php print $barang['nama']; ?></a>
        <span class="harga">Rp.<?php print number_format($barang['harga'], 2, ',', '.'); ?></span>
        <form onSubmit="return addToShoppingChart(this)"><input type="hidden" name="id_barang" value="<?php print $barang['barang_id']; ?>"><input type="text" name="qty" onKeyUp="validateQty(this)"><input type="submit" value="+" disabled="disabled"></form>
    </div>
    <?php } ?>
</div>