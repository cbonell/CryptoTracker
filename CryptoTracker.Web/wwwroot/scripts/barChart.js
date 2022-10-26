window.makeBarChart = (canvasId, json) => {
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
