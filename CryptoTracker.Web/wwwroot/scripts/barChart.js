window.makeBarChart = (canvasId, json) => {
    var arr = [];
    arr.push(['Date', 'Volume']);
    for (var i = 0; i < json.length; ++i) {
        var date = new Date(json[i]['timeStamp']);
        
        arr.push([date.toLocaleDateString(undefined, { month: "short", day: "numeric", hour: "2-digit"  }), json[i]['volume']]);

    }

    var data = google.visualization.arrayToDataTable(arr);

    var options = {
        //title: 'Price',
        //curveType: 'function',
        legend: { position: 'none' },
        //bar: { groupWidth: '100%' },
        //chartArea: {
        //    backgroundColor: '#252525'
        //},
        backgroundColor: '#252525',
        //bars: 'vertical',
        chartArea: {  top: 0 }
    };

    var chart = new google.visualization.ColumnChart(document.getElementById(canvasId));
    chart.draw(data, options);
}
