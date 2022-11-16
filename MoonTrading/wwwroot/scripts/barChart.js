window.makeBarChart = (canvasId, json) => {
    var canvas = document.getElementById(canvasId);
    canvas.innerHTML = '';

    var dataArr = [];
    for (var i = 0; i < json.length; i++) {
        var date = new Date(json[i]['timeStamp']);
        dataArr.push(
            {
                x: json[i]['timeStamp'],
                y: json[i]['volume']
            }
        );
    }

    var options = {
        series: [{
            data: dataArr,
        }],
        chart: {
            type: 'bar',
            height: 150
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%',
                endingShape: 'rounded'
            },
        },
        dataLabels: {
            enabled: false
        },
        xaxis: {
            type: 'datetime'
        },
        
        fill: {
            opacity: 1
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

