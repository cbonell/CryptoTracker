window.makeBarChart = (canvasId, json) => {
    let canvas = document.getElementById(canvasId);
    canvas.innerHTML = '';

    let dataArr = [];
    for (let i = 0; i < json.length; i++) {
        dataArr.push(
            {
                x: json[i]['timeStamp'],
                y: json[i]['volume']
            }
        );
    }

    let options = {
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

    let chart = new ApexCharts(canvas, options);
    chart.render();
}

