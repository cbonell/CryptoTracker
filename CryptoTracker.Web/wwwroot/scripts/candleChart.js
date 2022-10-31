google.charts.load('current', { 'packages': ['corechart', 'bar'] });

window.makeCandleChart = (canvasId, json) => {
    document.getElementById(canvasId).width = window.innerWidth / 4;
    document.getElementById(canvasId).height = window.innerHeight / 4;
    candlestickChart = new pingpoliCandlestickChart(canvasId);
    for (var i = 0; i < json.length; ++i) {
        candlestickChart.addCandlestick(new pingpoliCandlestick(json[i]['timeStamp'], json[i]['open'], json[i]['close'], json[i]['high'], json[i]['low']));
    }
    candlestickChart.draw();
}
