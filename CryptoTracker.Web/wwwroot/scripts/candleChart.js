google.charts.load('current', { 'packages': ['corechart', 'bar'] });

window.makeCandleChart = (canvasId, json) => {
    document.getElementById(canvasId).width = window.innerWidth / 3;
    document.getElementById(canvasId).height = window.innerHeight / 3;
    candlestickChart = new pingpoliCandlestickChart(canvasId);
    for (var i = 0; i < json.length; ++i) {
        candlestickChart.addCandlestick(new pingpoliCandlestick(json[i]['timeStamp'], json[i]['open'], json[i]['close'], json[i]['high'], json[i]['low']));
    }
    candlestickChart.draw();
}

window.makeLineChart = (id, json) => {
    //lineChart(canvasId, data);
    var arr = [];
    arr.push(['Date', 'Volume']);
    for (var i = 0; i < json.length; ++i) {
        arr.push([new Date(json[i]['timeStamp']), json[i]['price']]);
    }

    var data = google.visualization.arrayToDataTable(arr);

    var options = {
        title: 'Volume',
        curveType: 'function',
        legend: { position: 'none' },
        bar: { groupWidth: '100%' },
        chartArea: {
            backgroundColor: '#252525'
        },
        backgroundColor: '#252525',
        bars: 'vertical',
    };

    var chart = new google.visualization.LineChart(document.getElementById(id));
    chart.draw(data, options);
}

window.makeBarChart = (canvasId, json) => {
    //makeBarChart(canvasId, data);
    var arr = [];
    arr.push(['Date', 'Volume']);
    for (var i = 0; i < json.length; ++i) {
        arr.push([new Date(json[i]['timeStamp']), json[i]['volume']]);

    }

    var data = google.visualization.arrayToDataTable(arr);

    var options = {
        title: 'Volume',
        curveType: 'function',
        legend: { position: 'none' },
        //hAxis: {
        //    textPosition: 'none'
        //},
        bar: { groupWidth: '100%' },
        chartArea: {
            backgroundColor: '#252525'
        },
        backgroundColor: '#252525',
        bars: 'vertical',
    };

    var chart = new google.charts.Bar(document.getElementById(canvasId));
    chart.draw(data, google.charts.Bar.convertOptions(options));
}

//google.charts.setOnLoadCallback(googleCandles);

//function googleCandles(json) {
//    var arr = [];

//    for (var i = 0; i < json.length; ++i) {
//        arr.push([new Date(json[i]['timeStamp']), json[i]['low'], json[i]['open'], json[i]['close'], json[i]['high']]);
//    }

//    var data = google.visualization.arrayToDataTable(arr, true);

//    var options = {
//        legend: 'none',
//        backgroundColor: '#252525',
//        chartArea: { left: 20, top: 0, width: '1280', height: '720' },
//        candlestick: {
//            fallingColor: {
//                stroke: '#FF0000', fill: '#FF0000'
//            },
//            risingColor: {
//                stroke: '#00CC00', fill: '#00CC00'
//            }
//        }
//    };

//    var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

//    chart.draw(data, options);
//}

//function plot(id, json) {
//    document.getElementById(id).width = window.innerWidth / 3;
//    document.getElementById(id).height = window.innerHeight / 3;
//    candlestickChart = new pingpoliCandlestickChart(id);
//    for (var i = 0; i < json.length; ++i) {
//        candlestickChart.addCandlestick(new pingpoliCandlestick(json[i]['timeStamp'], json[i]['open'], json[i]['close'], json[i]['high'], json[i]['low']));
//    }
//    candlestickChart.draw();
//}

//function barChart(id, json) {
//    var arr = [];
//    arr.push(['Date', 'Volume']);
//    for (var i = 0; i < json.length; ++i) {
//        arr.push([new Date(json[i]['timeStamp']), json[i]['volume']]);

//    }

//    var data = google.visualization.arrayToDataTable(arr);

//    var options = {
//        title: 'Volume',
//        curveType: 'function',
//        legend: { position: 'none' },
//        //hAxis: {
//        //    textPosition: 'none'
//        //},
//        bar: { groupWidth: '100%' },
//        chartArea: {
//            backgroundColor: '#252525'
//        },
//        backgroundColor: '#252525',
//        bars: 'vertical',
//    };

//    var chart = new google.charts.Bar(document.getElementById(id));
//    chart.draw(data, google.charts.Bar.convertOptions(options));
//}


function lineChart(id, json) {
    var arr = [];
    arr.push(['Date', 'Volume']);
    for (var i = 0; i < json.length; ++i) {
        arr.push([new Date(json[i]['timeStamp']), json[i]['price']]);

    }

    var data = google.visualization.arrayToDataTable(arr);

    var options = {
        title: 'Volume',
        curveType: 'function',
        legend: { position: 'none' },
        bar: { groupWidth: '100%' },
        chartArea: {
            backgroundColor: '#252525'
        },
        backgroundColor: '#252525',
        bars: 'vertical',
    };

    var chart = new google.visualization.LineChart(document.getElementById(id));
    chart.draw(data, options);


    //chart.draw(data, google.charts.Bar.convertOptions(options));
    //var chart = new google.charts.Bar(document.getElementById(id));

    //chart.draw(data, google.charts.Bar.convertOptions(options));
}
