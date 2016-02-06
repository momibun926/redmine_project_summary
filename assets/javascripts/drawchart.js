function drawPieChart(chartdata, placeholder){
    var chartOptions = {
            credits:{
                enabled: false
            },
            title: {
                text: ''
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
function drawTimelineChart(chartdata, placeholder){
  var chartOptions = {
          credits:{
              enabled: false
          },
          chart:{
              renderTo: placeholder,
              type: 'line',
          },
          title:{
              text: '',
              align: 'left'
          },
          xAxis:{
              type: 'datetime'
          },
          legend:{
              align: 'center',
              verticalAlign: 'bottom',
              borderWidth: 0,
              itemDistance: 50
          },
          series:[
              {
                name: 'Create on',
                color: '#0f75bc',
                data: chartdata
              }
          ]
    };
    Highcharts.setOptions({global : {useUTC : false}});
    var lg1 = new Highcharts.Chart(chartOptions);
}
