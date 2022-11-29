window.makeLineChart = (id, priceData1, priceData2) => {
    var canvas = document.getElementById(id);
    canvas.innerHTML = '';

    var arr = [];
    for (var i = 0; i < priceData1.length; i++) {
        arr.push(
            {
                x: priceData1[i]['timeStamp'],
                y: priceData1[i]['price']
            }
        );
    }

    var arr2 = [];
    if (priceData2) {
        for (var i = 0; i < priceData2.length; i++) {
            arr2.push(
                {
                    x: priceData2[i]['timeStamp'],
                    y: priceData2[i]['price']
                }
            );
        }
    }
    var seriesData = [{
        name: 'Price History',
        data: arr
    }];
    if (priceData2) {
        seriesData.push(
            {
                name: 'Price Predicition',
                data: arr2
            });
    }
    var options = {
        series: seriesData,
        chart: {
            type: 'area',
            stacked: false,
            height: 350,
            zoom: {
                type: 'x',
                enabled: true,
                autoScaleYaxis: true
            },
            toolbar: {
                autoSelected: 'zoom'
            }
        },
        dataLabels: {
            enabled: false
        },
        markers: {
            size: 0,
        },
        title: {
            text: 'Price Movement',
            align: 'left'
        },
        fill: {
            type: 'gradient',
            gradient: {
                shadeIntensity: 1,
                inverseColors: false,
                opacityFrom: 0.5,
                opacityTo: 0,
                stops: [0, 90, 100]
            },
        },
        yaxis: {
            labels: {
                formatter: function (val) {
                    return (val / 1000000).toFixed(0);
                },
            },
            title: {
                text: 'Price'
            },
        },
        xaxis: {
            type: 'datetime',
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
