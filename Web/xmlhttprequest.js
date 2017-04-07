var stats = document.getElementById('stats-btn');
var gift = document.getElementById('gift-btn');
var background = document.getElementById('background-color');
var giftModal = document.getElementById('gift');
var giftBox = document.getElementById('gift-box');
var giftBoxModal = document.getElementById('gift-modal');
var statsModal = document.getElementById('stats');
var enermong = document.getElementById('enermong');
var isStatOpen = false;
var isGiftOpen = false;

window.onload = function () {
    var req = new XMLHttpRequest();
    req.open('GET', '/getMongInfo', false);
    req.send(null);
    if (req.status == 200) {
        jsonData = JSON.parse(req.responseText);
        var exp = jsonData.xp;
        var amount = jsonData.amount;
        if (amount > 0) {

            console.log(amount);
        }
    }
}

giftBox.onclick = function () {
    background.style.visibility = "visible";
    giftBoxModal.style.visibility = "visible";
    document.getElementById('prize').style.visibility = "visible";

}

background.onclick = function () {
    background.style.visibility = "hidden";
    giftModal.style.visibility = "hidden";
    statsModal.style.visibility = "hidden";
    giftBoxModal.style = "hidden"
    document.getElementById('prize').style.visibility = "hidden";
    isStatOpen = false;
    isGiftOpen = false;
}
gift.onclick = function () {
    if (!isGiftOpen) {
        giftModal.style.visibility = "visible";
        background.style.visibility = "visible";
        giftBoxModal.style.visibility = "hidden";
        document.getElementById('prize').style.visibility = "hidden";
        isGiftOpen = true;
    } else {
        isGiftOpen = false;
        background.style.visibility = "hidden";
        giftModal.style.visibility = "hidden";
        statsModal.style.visibility = "hidden";
    }
}

enermong.onclick = function(){
    var req = new XMLHttpRequest();
        req.open('GET', '/getMongInfo', false);
        req.send(null);
        if (req.status == 200){
            var jsonData = JSON.parse(req.responseText);
            // 여기에 refresh data를 받은 후 할 작업을 설정해준다.
        }
}

stats.onclick = function () {
    if (!isStatOpen) {
        statsModal.style.visibility = "visible";
        background.style.visibility = "visible";
        giftBoxModal.style.visibility = "hidden";
        document.getElementById('prize').style.visibility = "hidden";
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
