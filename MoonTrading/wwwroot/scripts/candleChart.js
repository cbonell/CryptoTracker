window.makeCandleChart = (canvasId, chartData) => {
    var canvas = document.getElementById(canvasId);
    canvas.innerHTML = '';

    var dataArr = [];
    for (var i = 0; i < chartData.length; i++) {
        dataArr.push(
            {
                x: chartData[i]['timeStamp'],
                y: [chartData[i]['open'], chartData[i]['high'], chartData[i]['low'], chartData[i]['close']]
            }
        );
    }

    var options = {
        series: [{
            data: dataArr,
        }],
        chart: {
            type: 'candlestick',
            height: 350
        },
        title: {
            text: 'CandleStick Chart',
            align: 'left'
        },
        xaxis: {
            type: 'datetime'
        },
        yaxis: {
            tooltip: {
                enabled: true
            }
        }
    };

    var chart = new ApexCharts(canvas, options);
    chart.render();
}
