
function copy(num, msg){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = num;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert(msg);
}