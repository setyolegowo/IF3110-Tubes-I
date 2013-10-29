<h1>Detail Barang</h1>
<form class="table barang" method="post" onSubmit="return addToShoppingChartBarang(this)">
    <div class="row">
        <span class="column"><img src="<?php if($barang['image_url'] == "" || $barang['image_url'] == null) print HOME_URL."assets/image/default.big.png"; else print HOME_URL.urldecode($barang['image_url']) ?>" alt="Default" width="250" height="250"></span>
        <span class="column" style="vertical-align: top">
            <h2><?php print $barang['nama']; ?></h2>
            <p>Rp.<?php print number_format($barang['harga'],2,',','.'); ?></p>
            <p><?php print $barang['deskripsi']; ?></p>
            <p><textarea name="pesan"></textarea></p>
            <p><span>Kuantitas: </span><input type="hidden" name="id_barang" value="<?php print $barang['barang_id']; ?>"><input type="text" name="qty" onKeyUp="validateQtyBarang(this)"> <input type="submit" value="+" disabled="disabled"></p>
        </span>
    </div>
</form>