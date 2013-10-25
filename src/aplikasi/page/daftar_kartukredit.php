<h1>Pendaftaran Pelanggan</h1>
<form id="daftar_kartukredit" method="post">
    <p><label>Nomor kartu kredit</label>: <input type="text" name="nomor_kartu" size="22" maxlength="19"></p>
    <p><label>Nama pada kartu</label>: <input type="text" name="nama_kartu" size="40" maxlength="40"></p>
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
    <p><label>&nbsp;</label>&nbsp; <input type="submit" name="submit" value="Daftarkan Kartu Kredit"> atau <a href="">Cukup lewat saja</a></p>
</form>