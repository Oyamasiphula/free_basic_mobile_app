var express = require('express'),	
	exphbs = require('express-handlebars');
	mysql = require('mysql'),
	myConnection = require('express-myconnection'),
	session = require('express-session'),
	bodyParser = require('body-parser'),
  applicationForm = require('./routes/applicationForm');

var app = express();

var dbOptions = {
      host: 'localhost',
      user: 'codeX',
      password: 'password',
      port: 3306,
      database: 'codeX_applicants_db'
};

//setup template handlebars as the template engine
app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.use(express.static(__dirname + '/public'));
app.use('/bower_components',  express.static(__dirname + '/bower_components'));

//setup middleware
app.use(myConnection(mysql, dbOptions, 'single'));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

app.get("/", function (req,res) {
    res.render("home")
});

// app.get("/applicationForm", function (req,res) {
//     res.render("question1")
// });

app.get("/applicationForm", applicationForm.showQuest1)
app.post('/applicantDetailsQ1/add', applicationForm.addApplicantInfoQ1)

app.get("/applicantDetails", function (req,res) {
    res.render("question2")
});


app.post("/applicantDetails", function (req,res) {
    res.render("question2")
});
// app.post("/question2", function (req,res) {
//     res.render("question2")
// });

// app.get('/issues', issues.show)
// app.post('/issues/add', issues.add)
// app.get('/issues/search/:query', issues.search)


app.get("/codecademy", function (req,res) {
    res.render("codecademy")
});

//start everything up
var port = process.env.port ||    2010;

app.listen( port, function(){
  console.log('listening on *:' + port);
});