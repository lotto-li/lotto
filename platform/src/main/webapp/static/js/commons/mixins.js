function sendRequest(url, method, data){
	let submitData = Object.assign({}, data);
	return $.ajax({
		url: url,
		method: method,
		data: submitData,
		headers:{
			'Content-Type': 'application/x-www-form-urlencoded',
		},
	});
}


function resetArray(array){
	array.splice(0, array.length);
}