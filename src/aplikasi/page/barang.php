<h1>Detail Barang</h1>
<form class="table">
    <div class="row">
        <span class="column"><img src="<?php print HOME_URL."assets/image/default.big.png"; ?>" alt="Default" width="250" height="250"></span>
        <span class="column" style="vertical-align: top">
            <h2>Nama Barang</h2>
            <p>Harga barang</p>
            <p>Deskripsi Barang</p>
            <p><textarea name="pesan"></textarea></p>
            <p>Kuantitas: <input type="text" name="qty" onKeyUp="validateQty(this)"> <input type="submit" value="+" disabled="disabled"></p>
        </span>
    </div>
</form>