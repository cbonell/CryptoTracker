google.charts.load('current', { 'packages': ['line'] });

window.makeLineChart = (id, priceData1, priceData2) => {
    var arr = [];
    if (priceData2) {
        arr.push(['Date', 'Price', 'Prediction Price']);

        for (var i = 0; i < priceData1.length; ++i) {
            arr.push([new Date(priceData1[i]['timeStamp']), priceData1[i]['price'], null]);
        }

        for (var i = 0; i < priceData2.length; ++i) {
            arr.push([new Date(priceData2[i]['timeStamp']), null, priceData2[i]['price']]);
        }
    }
    else {
        arr.push(['Date', 'Volume']);
        for (var i = 0; i < priceData1.length; ++i) {
            arr.push([new Date(priceData1[i]['timeStamp']), priceData1[i]['price']]);
        }
    }



    if (priceData2) {

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
        titleTextStyle: {
            color: 'white'
        },
        hAxis: {
            textStyle: {
                color: 'white'
            },
            titleTextStyle: {
                color: 'white'
            }
        },
        vAxis: {
            textStyle: {
                color: 'white'
            },
            titleTextStyle: {
                color: 'white'
            }
        },
    };

    var chart = new google.visualization.LineChart(document.getElementById(id));
    chart.draw(data, options);
}

window.makeMultiLineChart = (id, price1, price2) => {
    var arr = [];
    arr.push(['Date', 'Price', 'Prediction Price']);

    for (var i = 0; i < price1.length; ++i) {
        arr.push([new Date(price1[i]['timeStamp']), price1[i]['price'], null]);
    }

    for (var i = 0; i < price2.length; ++i) {
        arr.push([new Date(price2[i]['timeStamp']), null, price2[i]['price']]);
    }

    var data = google.visualization.arrayToDataTable(arr);

    var options = {
        title: 'Price',
        curveType: 'function',
        bar: { groupWidth: '100%' },
        legend: {
            textStyle: {
                color: 'white'
            }
        },
        chartArea: {
            backgroundColor: '#252525'
        },
        backgroundColor: '#252525',
        bars: 'vertical',
        titleTextStyle: {
            color: 'white'
        },
        hAxis: {
            textStyle: {
                color: 'white'
            },
            titleTextStyle: {
                color: 'white'
            }
        },
        vAxis: {
            textStyle: {
                color: 'white'
            },
            titleTextStyle: {
                color: 'white'
            }
        },
    };

    var chart = new google.visualization.LineChart(document.getElementById(id));
    chart.draw(data, options);
    //chart.draw(data2, options);
}