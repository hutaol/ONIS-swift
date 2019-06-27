
function setValues(data) {
    
    for (var k in data) {
        var eles = document.getElementById(k).getElementsByClassName('emplaceholder');
        if (eles[0]) {
            eles[0].innerHTML = data[k];
        }
    }

}
