<form class="table sbtable">
    <div class="row thead">
        <span class="column">Gambar</span>
        <span class="column">Nama barang / Permintaan</span>
        <span class="column">Qty</span>
        <span class="column">Harga per Unit</span>
        <span class="column">Harga Total</span>
    </div>
    <?php if($keranjang != null) {
    foreach($keranjang['data'] as $barang) {
    ?>
    <div class="row tcontent">
        <span class="column"><img src="<?php if($barang['image_url'] == "" || $barang['image_url'] == null) print HOME_URL."assets/image/default.png"; else print urldecode($barang['image_url']) ?>" alt="Default"></span>
        <span class="column"><a href="<?php print HOME_URL."barang/".$barang['barang_id']; ?>"><?php print $barang['nama']; ?></a><p><?php print $barang['deskripsi']; ?></p></span>
        <span class="column"><input type="text" name="qty_<?php print $barang['barang_id']; ?>" value="<?php print $barang['qty']; ?>"></span>
        <span class="column">Rp. <?php print number_format($barang['harga'], 2, ',', '.'); ?></span>
        <span class="column">Rp. <?php print number_format($barang['harga']*$barang['qty'], 2, ',', '.'); ?></span>
    </div>
    <?php } ?>
    <div class="row">
        <span class="column"></span>
        <span class="column"></span>
        <span class="column"></span>
        <span class="column"></span>
        <span class="column">Total: Rp. <?php print number_format($keranjang['total'], 2, ',', '.'); ?><p><input type="button" value="Simpan"><input type="button" value="Beli"></p></span>
    </div>
    <?php } else { ?>
    <p>Tidak ada barang di keranjang</p>
    <?php } ?>
</form>