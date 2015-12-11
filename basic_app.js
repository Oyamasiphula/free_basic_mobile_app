var express = require('express'),	
	exphbs = require('express-handlebars');
  	// formPge1 = require('./routes/formPge1');

var app = express();

//setup template handlebars as the template engine
app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.use(express.static(__dirname + '/public'));
app.use('/bower_components',  express.static(__dirname + '/bower_components'));

app.get("/", function (req,res) {
    res.render("home")
})

app.get("/applicationForm", function (req,res) {
    res.render("question1")
})

app.get("/codecademy", function (req,res) {
    res.render("codecademy")
})

// app.get("/", function (req,res) {
//     res.render("home")
// })
// app.get('/formPge1', formPge1.show)
// app.post('/formPge1/add', formPge1.add)

//start everything up
var port = process.env.port ||    2010;

app.listen( port, function(){
  console.log('listening on *:' + port);
});