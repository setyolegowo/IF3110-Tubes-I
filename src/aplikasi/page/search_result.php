<?php
    // check input
    if(strpos($_GET['query'],"less ") === 0) {
        $result = substr($_GET['query'],5);
        $title = "Hasil pencarian kurang dari Rp. ".number_format($result,2,',','.');
        $sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        $sql .= "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        $sql .= "WHERE barang_data.harga < ".mysql_real_escape_string($result);
    } else if(strpos($_GET['query'],"more ") === 0) {
        $result = substr($_GET['query'],5);
        $title = "Hasil pencarian lebih dari Rp. ".number_format($result,2,',','.');
        $sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        $sql .= "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        $sql .= "WHERE barang_data.harga > ".mysql_real_escape_string($result);
    } else if(strpos($_GET['query'],"category ") === 0) {
        $result = substr($_GET['query'],9);
        $title = "Hasil pencarian untuk kategori <i>".$result."</i>";
        $sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        $sql .= "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        $sql .= "WHERE barang_kategori.kategori_nama LIKE '%".mysql_real_escape_string($result)."%'";
    } else {
        $result = $_GET['query'];
        $title = "Hasil pencarian untuk <i>".$result."</i>";
        $sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        $sql .= "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        $sql .= "WHERE barang_data.nama LIKE '%".mysql_real_escape_string($result)."%'";
    }
    $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
    $total_row = mysql_num_rows($query);
    
    $start_number = 0;
    $this_page = 1;
    if(isset($_GET['page'])) {
        if(is_numeric($_GET['page'])) {
            $this_page = $_GET['page'];
            $start_number = $total_row > ($_GET['page'] - 1)*10 && $_GET['page'] > 0 ? ($_GET['page'] - 1)*10 : 0;
        }
    }
?>
<h1><?php print $title; ?></h1>
<?php 
    if($total_row == 0) {
        print '<p><i>Hasil pencarian tidak ada.</i></p>';
    } else { 
        $sql .= " LIMIT ".$start_number.", 10;";
        $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        while($barang = mysql_fetch_assoc($query)) {
    ?>
<div class="table sresult" onSubmit="return addToShoppingChartBarang(this)">
    <div class="row">
        <span class="column"><img src="<?php if($barang['image_url'] == "" || $barang['image_url'] == null) print HOME_URL."assets/image/default.png"; else print HOME_URL.urldecode($barang['image_url']) ?>" alt="Default" width="100" height="100"></span>
        <span class="column" style="vertical-align: top">
            <h3><a href="<?php print HOME_URL."barang/".$barang['barang_id']; ?>"><?php print $barang['nama']; ?></a></h3>
            <p>Rp.<?php print number_format($barang['harga'],2,',','.'); ?><br>
            <?php print $barang['deskripsi']; ?><br>
            <form onSubmit="return addToShoppingChart(this)"><span>Kuantitas: </span><input type="hidden" name="id_barang" value="<?php print $barang['barang_id']; ?>"><input type="text" name="qty" onKeyUp="validateQtyBarang(this)"> <input type="submit" value="+" disabled="disabled"></form></p>
        </span>
    </div>
</div>
<?php 
        }
        $sisa = $total_row % 10;
        $total_page = (($total_row - $sisa) / 10) + 1;
        print '<div align="center">Page';
        for($i = 1; $i <= $total_page; $i++) {
            if($i == $this_page) print ' - <b>'.$i.'</b>';
            else print ' - <a href="?query='.urlencode($_GET['query']).'&page='.$i.'">'.$i.'</a>';
        }
        print '</div>';
    }
?>