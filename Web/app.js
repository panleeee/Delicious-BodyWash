var express = require('express');
var request = require('request');
var app = express();

var isOn = false;

app.use(express.static(__dirname));
app.get('/', function (req, res) {
    res.sendfile(__dirname + '/index.html');
});
app.get('/getNowPower', function (req, res) {
    res.send({data:[
          ['Year', 'Sales'],
          ['2013',  523],
          ['2014',  123],
          ['2015',  293],
          ['2016',  442],
          ['2017',  111],
          ['2018', 700],
        ]});
    // if(isOn){
    // request('https://enermong.scalingo.io/api/1/23414/off', function (error, response, body) {
    //     isOn = false;
    //     res.send(response.body);
    // });
    // }else{
    //    request('https://enermong.scalingo.io/api/1/23414/on', function (error, response, body) {
    //     res.send(response.body);
    //     isOn = true;
    // }); 
    // }
});

app.listen(8000, function () {
    console.log("port 8000 is open");
});