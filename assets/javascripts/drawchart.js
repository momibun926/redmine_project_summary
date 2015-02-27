function drawTrackerChart(chartdata, placeholder){ 
    var chartOptions = {
            credits:{
                enabled: false
            },
            chart: {
                type: 'pie',
                renderTo: placeholder,
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },            
            series:[{
                data: chartdata
            }]
      };
      var lg1 = new Highcharts.Chart(chartOptions);
}

