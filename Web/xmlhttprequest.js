var stats = document.getElementById('stats-btn');
var background = document.getElementById('background-color');
var giftModal = document.getElementById('gift');
var statsModal = document.getElementById('stats');

background.onclick = function () {
    background.style.visibility = "hidden";
    giftModal.style.visibility = "hidden";
    statsModal.style.visibility = "hidden";
}

stats.onclick = function () {
    statsModal.style.visibility = "visible";
    background.style.visibility = "visible";
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var req = new XMLHttpRequest();
        req.open('GET', '/getNowPower', false);
        req.send(null);
        if (req.status == 200) {
            jsonData = JSON.parse(req.responseText);
            console.log(jsonData.data);

            var data = google.visualization.arrayToDataTable(jsonData.data);
            var options = {
                title: '최근 사용 내역',
                colors: ['#ffd200'],
                hAxis: { title: 'Week', titleTextStyle: { color: '#333' } },
                vAxis: { minValue: 0 }
            };

            var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    }
}

window.onload = function () {

}