function number_format( number, decimals, dec_point, thousands_sep ) {
	var n = number, c = isNaN(decimals = Math.abs(decimals)) ? 2 : decimals;
	var d = dec_point == undefined ? "," : dec_point;
	var t = thousands_sep == undefined ? "." : thousands_sep, s = n < 0 ? "-" : "";
	var i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
	return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
}


function calcula_preco(id_input) {
    // pega o numero identificador dos campos de calculo
	
    id = id_input.split('-')[1];

    // transforma o valor base em uma string apropriada para calculo
    valorUnitario = $('#valorUnitario-' + id).val().replace(".","").replace(",",".");

    // transforma o desconto em uma string apropriada para calculo
    quantidade = $('#quantidade-' + id).val().replace(".","").replace(",",".");

    // calcula a diferenca entre o valor base menos o desconto 
    total = parseFloat(valorUnitario) * parseFloat(quantidade);

    // coloca o valor total no input em formato da moeda real
    $('#total-' + id).val(number_format(total, 2, ',', '.'));	
}