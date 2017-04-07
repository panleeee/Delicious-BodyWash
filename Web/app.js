var express = require('express');
var session = require('express-session');
var bodyParser = require('body-parser')
var request = require('request');


var app = express();

app.use(express.static(__dirname));
// app.use('/',function(req,res,next){
//     if(!req.session.isLogin )
//     res.redirect('/');
// })
app.use(session({
    secret: 'deleciousBodyWash',
    resave: false,
    saveUninitialized: true
}));

app.use(bodyParser.urlencoded({ extended: false }))

app.use(bodyParser.json())


app.get('/', function (req, res) {
    res.sendFile(__dirname + "/signUp.html");
});

app.get('/main', function (req, res) {
    res.sendFile(__dirname + '/main.html');
});

app.get('/Useage', function (req, res) {
    var clientID = req.session.clientID;
    request("https://enermong.scalingo.io/api/" + clientID + "/getUsage", function (error, response, body) {
        var jsonData = JSON.parse(response.body);
        var sendArr = [['요일','사용량']];
        for (var i in jsonData.data) {
            var littleArr = [];
            var key = Object.keys(jsonData.data[i]);
            littleArr.push((7-(parseInt(i)+1))+"일 전");
            console.log(jsonData.data[i]);
            littleArr.push(jsonData.data[i].usage);
            sendArr.push(littleArr);
        }
        res.send({"data":sendArr});
    });
    // res.sendfile(__dirname + "/signUp.html");
});

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
app.get('/getMongInfo',function(req,res){
    request('https://enermong.scalingo.io/api/'+req.session.clientID+'/loadmain',function(err,response,body){
        res.send(body);
    });
});

app.post('/signIn', function (req, res) {
    var email = req.body.email;
    var pwd = req.body.pw;
    console.log(email + "&&" + pwd);
    console.log({ form: { email: email, pw: pwd } });
    request.post({ url: "https://enermong.scalingo.io/api/signIn", form: { "email": email, "pw": pwd } }, function (err, response, body) {
        var data = JSON.parse(response.body);
        req.session.clientID = data.id;
        console.log(req.session);
        if (req.session.clientID != undefined) {
            req.session.isLogin = true;
            res.redirect('/main');
        }
    });
});

app.post('/logout', function (req, res) {
    req.session.isLogin = false;
    res.redirect('/');
});

app.listen(8000, function () {
    console.log("port 8000 is open");
});