var loginformhtml = "<div id=\"loginbox\" class=\"overlay\"><form class=\"popup\" method=\"post\" onSubmit=\"return submitlogin(this)\">" +
            "<h2>Login</h2>" +
            "<p><input name=\"nama_pengguna\" type=\"text\" placeholder=\"Nama Pengguna\">" +
            "<input name=\"kata_sandi\" type=\"password\" placeholder=\"Kata Sandi\">" +
            "<input name=\"submit\" type=\"submit\" value=\"Login\"></p>" +
            "<p>Atau <a href=\"" + BASE_URL + "pendaftaran/\">Daftar baru</a></p>" +
            "<a class=\"close\" href=\"#close\"></a>" +
        "</form></div>";

function myOutput(data) {
	var result = JSON.parse(data);
	alert(result.data);
}
function testA() {
	var form = document.getElementById("wbd_search");
	var bucket = {"todo":"searching", "data":form.elements[0].value};
	sendJSONType(bucket, myOutput);
	return false;
}
function showSubmenu() {
	var child = document.getElementById('kategorilist');
	if(child != null) child.parentNode.removeChild(child);
	var bucket = {"todo":"subkategori", "data":"kategorilist"};
	sendJSONType(bucket,showSubmenuAfterAjax);
}
function showSubmenuAfterAjax(data) {
	var result = JSON.parse(data);

	if(result.status == "success") {
		var submenu = document.createElement("nav");
		submenu.id = "kategorilist";
		var kontainer = document.createElement("div");
		kontainer.className = "container";
		submenu.appendChild(kontainer);
		for(var i = 0; i < result.data.length; i++) {
			var kategori = document.createElement("a");
			kategori.href = BASE_URL + "kat/" + (i + 1);
			kategori.innerHTML = result.data[i];
			kontainer.appendChild(kategori);
		}
		var parent = document.getElementsByTagName("header");
		parent[0].appendChild(submenu);
	} else {
		alert(result.data);
	}
}
function submitlogin(field) {
	var bucket = {"todo":"login", "data":[
			{"nama_pengguna":field.nama_pengguna.value, "kata_sandi":field.kata_sandi.value}
		]};
	sendJSONType(bucket, loginAfter);
	return false;
}
function loginAfter(data) {
	var result = JSON.parse(data);
	if(result.status == "success") {
		if(saveToLocalStorage != null) {
			saveToLocalStorage("userData", result.data);
		}
		var changeelement = document.getElementById('login');
		changeelement.innerHTML = "Welcome, <a href=\"profil/\">" + getItemLocalStorage("userData").nama_lengkap + "</a> - ";
		changeelement.innerHTML += "<a onClick=\"logout()\" href=\"#\">Logout</a>";
		var child = document.getElementById('loginbox');
		if(child != null) child.parentNode.removeChild(child);
	} else if(result.status == "failed") {
		alert("Data username atau password salah.\nSilahkan coba lagi.");
	}
}
function logout() {
	if(removeLocalStorage != null) {
		removeLocalStorage("userData");
	}
	var changeelement = document.getElementById('login');
	changeelement.innerHTML = "<a href=\"#loginbox\">Login</a>";
	var parent = changeelement.parentNode;
	parent.innerHTML += loginformhtml;
}


/* ------------------------------------------------------------------------- */
/*                                LOCAL STORAGE                              */
/* ------------------------------------------------------------------------- */
if(typeof(Storage) !== "undefined") {
	function saveToLocalStorage(key, value) {
		localStorage[key] = JSON.stringify(value);
	}
	function getItemLocalStorage(key) {
		if(localStorage[key] != null)
			return JSON.parse(localStorage[key]);
		else
			return null;
	}
	function removeLocalStorage(key) {
		localStorage.removeItem(key);
	}
	if(getItemLocalStorage("userData") != null) {
		var child = document.getElementById('loginbox');
		if(child != null) child.parentNode.removeChild(child);
		var changeelement = document.getElementById('login');
		changeelement.innerHTML = "Welcome, <a href=\"profil/\">" + getItemLocalStorage("userData").nama_lengkap + "</a> - ";
		changeelement.innerHTML += "<a onClick=\"logout()\" href=\"#\">Logout</a>";
	} else { // Not User Data
		var node = document.getElementById('login');
		node.innerHTML = "<a href=\"#loginbox\">Masuk</a>";
		var parent = node.parentNode;
		parent.innerHTML += loginformhtml;
	}
} else {
	alert("Browser tidak support Local Storage. Mohon ganti ke browser yang mendukung.");
}