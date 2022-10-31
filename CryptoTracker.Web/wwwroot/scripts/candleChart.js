google.charts.load('current', { 'packages': ['corechart', 'bar'] });

window.makeCandleChart = (canvasId, json) => {
    var canvas = document.getElementById(canvasId);
    canvas.style.width = '100%';
    //canvas.style.height = '100%';
    // ...then set the internal size to match
    canvas.width = canvas.offsetWidth -100;
//    canvas.height = canvas.offsetHeight;
//]]]
    candlestickChart = new pingpoliCandlestickChart(canvasId);
    for (var i = 0; i < json.length; ++i) {
        candlestickChart.addCandlestick(new pingpoliCandlestick(json[i]['timeStamp'], json[i]['open'], json[i]['close'], json[i]['high'], json[i]['low']));
    }
    candlestickChart.draw();
}
