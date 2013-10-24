<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ruserba</title>
    <link rel="icon" type="image/png" href="assets/favicon.png">
    <link rel="stylesheet" href="assets/css/home.css" type="text/css" />
    <script src="assets/ajax_generic.js"></script>
</head>
<body>
    <header>
        <div class="container">
            <a href="./"><img src="assets/logo.png" height="72" alt="Ruko Serba Ada"></a>
            <span id="login"><a href="#">Daftar untuk pelanggan baru</a>, <a onClick="showHide()" style="cursor: pointer">Login</a></span>
        </div>
        <div id="loginbox"><form class="container" method="post">
            <input name="nama_pengguna" type="text" placeholder="Nama Pengguna">
            <input name="kata_sandi" type="password" placeholder="Kata Sandi">
            <input name="submit" type="button" value="Login">
        </form></div>
        <nav><div class="container">
            <a class="menu_cell hyperlink" href="./">Home</a>
            <a class="menu_cell hyperlink" href="#" onFocus="showSubmenu()" onBlur="hideSubmenu()">Kategori</a>
            <form id="wbd_search" style="position: absolute; top: 0; right: 0" class="menu_cell" onSubmit="return testA()">
                <input type="text" name="search_input">
                <input type="submit" name="submit" value="Cari">
            </form>
        </div></nav>
        <nav id="kategorilist"><div class="container">
            <a href="./">Kategori 1</a>
            <a href="./">Kategori 2</a>
            <a href="./">Kategori 3</a>
            <a href="./">Kategori 4</a>
        </div></nav>
    </header>
    <article class="container">