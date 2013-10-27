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
        <div class="container">
            <a href="<?php print HOME_URL; ?>"><img id="logo" src="<?php print HOME_URL; ?>assets/logo.png" height="72" alt="Ruko Serba Ada"></a>
            <span id="login"><a href="#loginbox">Login</a></span>
        </div>
        <nav><div class="container">
            <a class="menu_cell hyperlink" href="<?php print HOME_URL; ?>">Home</a>
            <a class="menu_cell hyperlink" href="#" onClick="showSubmenu()">Kategori</a>
            <form id="wbd_search" style="position: absolute; top: 0; right: 0" class="menu_cell" onSubmit="return testA()">
                <input type="text" name="search_input" placeholder="Cari disini">
                <input type="submit" name="submit" value="Cari">
            </form>
            <a id="keranjang_belanja" class="menu_cell hyperlink" href="#">Keranjang Belanja</a>
        </div></nav>
    </header>
    <article class="container">