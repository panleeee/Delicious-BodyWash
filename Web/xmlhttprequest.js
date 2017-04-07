var stats = document.getElementById('stats-btn');
var gift = document.getElementById('gift-btn');
var background = document.getElementById('background-color');
var giftModal = document.getElementById('gift');
var statsModal = document.getElementById('stats');
var isStatOpen = false;
var isGiftOpen = false;

background.onclick = function () {
    background.style.visibility = "hidden";
    giftModal.style.visibility = "hidden";
    statsModal.style.visibility = "hidden";
    isStatOpen = false;
    isGiftOpen = false;
}
gift.onclick = function () {
    if (!isGiftOpen) {
        giftModal.style.visibility = "visible";
        background.style.visibility = "visible";
        isGiftOpen = true;
    } else {
        isGiftOpen = false;
        background.style.visibility = "hidden";
        giftModal.style.visibility = "hidden";
        statsModal.style.visibility = "hidden";
    }
}
stats.onclick = function () {
    if (!isStatOpen) {
        statsModal.style.visibility = "visible";
        background.style.visibility = "visible";
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        isStatOpen = true;
    } else {
        isStatOpen = false;
        background.style.visibility = "hidden";
        giftModal.style.visibility = "hidden";
        statsModal.style.visibility = "hidden";
    }
    function drawChart() {

        var req = new XMLHttpRequest();
        req.open('GET', '/useage', false);
        req.send(null);
        if (req.status == 200) {
            jsonData = JSON.parse(req.responseText);
            // console.log(req);
            console.log(jsonData);

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
