window.makeLineChart = (id, priceData1, priceData2) => {
    let canvas = document.getElementById(id);
    canvas.innerHTML = '';

    let arr = [];
    for (let i = 0; i < priceData1.length; i++) {
        arr.push(
            {
                x: priceData1[i]['timeStamp'],
                y: priceData1[i]['price']
            }
        );
    }

    let arr2 = [];
    if (priceData2) {
        for (let i = 0; i < priceData2.length; i++) {
            arr2.push(
                {
                    x: priceData2[i]['timeStamp'],
                    y: priceData2[i]['price']
                }
            );
        }
    }
    let seriesData = [{
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
    let options = {
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
            tooltip: {
                enabled: true
            }
        },
        xaxis: {
            type: 'datetime',
        }
    };

    let chart = new ApexCharts(canvas, options);
    chart.render();
}
