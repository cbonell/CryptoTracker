window.makeLineChart = (id, json) => {
    var arr = [];
    arr.push(['Date', 'Volume']);
    for (var i = 0; i < json.length; ++i) {
        arr.push([new Date(json[i]['timeStamp']), json[i]['price']]);
    }

    var data = google.visualization.arrayToDataTable(arr);

    var options = {
        title: 'Price',
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