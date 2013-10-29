<form id="shopping_bag" class="table sbtable">
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
        <span class="column"><img src="<?php if($barang['image_url'] == "" || $barang['image_url'] == null) print HOME_URL."assets/image/default.png"; else print HOME_URL.urldecode($barang['image_url']) ?>" alt="<?php print $barang['nama']; ?>" width="100" height="100"></span>
        <span class="column">
            <a href="<?php print HOME_URL."barang/".$barang['barang_id']; ?>"><?php print $barang['nama']; ?></a>
            <p><?php print $barang['deskripsi']; ?></p><?php if($barang['detail_tambahan'] != null) print '<p><b>Detail tambahan:</b> '.$barang['detail_tambahan'].'</p>'; ?>
        </span>
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
        <span class="column">Total: Rp. <?php print number_format($keranjang['total'], 2, ',', '.'); ?><p><input type="button" value="Simpan" onClick="saveToShoppingBag()"><input type="button" value="Beli" onClick="checkIsCard()"></p></span>
    </div>
    <?php } else { ?>
    <p>Tidak ada barang di keranjang</p>
    <?php } ?>
</form>