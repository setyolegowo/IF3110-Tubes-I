<h1>Pendaftaran Pelanggan</h1>
<form id="daftar_kartukredit" onSubmit="return submitCreditCard(this)">
    <p><label>Nomor kartu kredit</label>: <input type="text" name="nomor_kartu" size="25" maxlength="23" onKeyUp="regCCNumber(this)"> <i>exp. 1234-5678-9012-3456</i></p>
    <p><label>Nama pada kartu</label>: <input type="text" name="nama_kartu" size="40" maxlength="40" onKeyUp="regCCName(this)"></p>
    <p><label>Masa akhir berlaku kartu</label>: <select name="bulan">
<?php $arrayofbulan = array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"); 
    $i = 0;
    foreach($arrayofbulan as $elemenbulan) {
        $i++;
        print '<option value="'.$i.'">'.$elemenbulan.'</option>';
    } ?>
        </select>&nbsp;<select name="tahun">
<?php for($i = 2050; $i >= 2013; $i--) {
        print '<option value="'.$i.'">'.$i.'</option>';
    } ?>
        </select></p>
    <p><label>&nbsp;</label>&nbsp;<input type="submit" name="submit" value="Daftarkan Kartu Kredit" disabled="disabled"> atau <a href="<?php print HOME_URL; ?>">Cukup lewat saja</a></p>
</form>