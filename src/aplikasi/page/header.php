<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ruserba</title>
    <link rel="icon" type="image/png" href="<?php print HOME_URL; ?>assets/favicon.png">
    <link rel="stylesheet" href="<?php print HOME_URL; ?>assets/css/home.css" type="text/css" />
    <link rel="stylesheet" href="<?php print HOME_URL; ?>assets/css/loginpopup.css" type="text/css" />
    <script src="<?php print HOME_URL; ?>assets/ajax_generic.js"></script>
</head>
<body>
    <header>
        <nav><div class="container">
            <span id="login"><a class="menu_cell hyperlink" href="#loginbox">Login</a></span>
            <form id="wbd_search" class="menu_cell" onSubmit="return testA()">
                <input type="text" name="search_input" placeholder="Cari disini">
                <input type="submit" name="submit" value="Cari">
            </form>
            <a id="keranjang_belanja" class="menu_cell hyperlink" href="<?php print HOME_URL; ?>keranjang/">Keranjang Belanja <?php if(isset($_SESSION['shopping_bag'])) { $result = json_decode($_SESSION['shopping_bag'], true); print '<span id="total_keranjang">'.count($result['data']).'</span>'; } ?></a>
            </div>
        </nav>
        <div class="container">
            <a href="<?php print HOME_URL; ?>"><img id="logo" src="<?php print HOME_URL; ?>assets/logo.png" height="72" alt="Ruko Serba Ada"></a>
        </div>
        <div id="background_cat">
            <img class="background" id='kat1' src="<?php print HOME_URL; ?>assets/img_style/kat1.gif" alt="Kategori 1"/>
            <img class="background" id='kat2' src="<?php print HOME_URL; ?>assets/img_style/kat2.gif" alt="Kategori 1"/>
            <img class="background" id='kat3' src="<?php print HOME_URL; ?>assets/img_style/kat3.gif" alt="Kategori 1"/>
            <img class="background" id='kat4' src="<?php print HOME_URL; ?>assets/img_style/kat4.gif" alt="Kategori 1"/>
            <img class="background" id='kat5' src="<?php print HOME_URL; ?>assets/img_style/kat5.gif" alt="Kategori 1"/>
		</div>
        <div class="kategori_group">
            <a href="<?php print HOME_URL; ?>kat/1/"><img src="<?php print HOME_URL; ?>assets/img_style/klik.gif" alt="Klik"/></a>
            <a href="<?php print HOME_URL; ?>kat/2/"><img src="<?php print HOME_URL; ?>assets/img_style/klik.gif" alt="Klik"/></a>
            <a href="<?php print HOME_URL; ?>kat/3/"><img src="<?php print HOME_URL; ?>assets/img_style/klik.gif" alt="Klik"/></a>
            <a href="<?php print HOME_URL; ?>kat/4/"><img src="<?php print HOME_URL; ?>assets/img_style/klik.gif" alt="Klik"/></a>
            <a href="<?php print HOME_URL; ?>kat/5/"><img src="<?php print HOME_URL; ?>assets/img_style/klik.gif" alt="Klik"/></a>
        </div>
    </header>
    <article class="container">