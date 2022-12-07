window.makeCandleChart = (canvasId, chartData) => {
    let canvas = document.getElementById(canvasId);
    canvas.innerHTML = '';

    let dataArr = [];
    for (let i = 0; i < chartData.length; i++) {
        dataArr.push(
            {
                x: chartData[i]['timeStamp'],
                y: [chartData[i]['open'], chartData[i]['high'], chartData[i]['low'], chartData[i]['close']]
            }
        );
    }

    let options = {
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

    let chart = new ApexCharts(canvas, options);
    chart.render();
}
