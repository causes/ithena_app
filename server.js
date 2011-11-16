//================= setup Dependencies =========================//
var connect = require('connect')
  , express = require('express')
  , auth = require('connect-auth')
  , mongoose = require('mongoose')
  , mongoClient = mongoose.connect('mongodb://localhost/dbtest')
  , port = (process.env.PORT || 80);
//=============================================================================//

//======================== SETUP THE SERVER =================================//
var server = express.createServer();
server.configure(function(){
  server.use(express.static(__dirname + '/static'));
  server.set('views', __dirname + '/views');
  server.set('view engine', 'jade');
  server.use(express.cookieParser());
  server.use(express.bodyParser());
  server.use(express.session({ secret: 'I know the p!' }));
  server.use(express.methodOverride());
  server.use(server.router);
  server.use(express.errorHandler({ dumpExceptions: true }));
});
//=============================================================================//


//setup the errors
server.error( function (err, req, res, next) {
  if (err instanceof NotFound) {
    res.render ('404.jade', { locals: { 
      title : '404 - Not Found'
      ,footer: 'jajajjs'
      ,description: ''
      ,analyticssiteid: 'XXXXXXX'
      ,source:'login'
      },status: 404 });
    } 
    else {
      res.render ('500.jade', { locals: {
        title : 'The Server Encountered an Error'
        ,footer: 'fhfh'
        ,description: ''
        ,analyticssiteid: 'XXXXXXX'
        ,source:'login'
        ,error: err 
        },status: 500 });
    }
});


//==============Set up the now server for real time communication!=============//
var io = require('socket.io');
io = io.listen(server);
server.listen(port);
//=============================================================================//



//================= ROUTES  ==================================================//
require('./controllers/auth')(server,io);
//=============================================================================//

//A Route for Creating a 500 Error (Useful to keep around)
server.get('/500', function(req, res){
  throw new Error('This is a 500 Error');
});

//The 404 Route (ALWAYS Keep this as the last route)
server.get('/*', function(req, res){
  throw new NotFound;
});

function NotFound(msg){
  this.name = 'NotFound';
  Error.call(this, msg);
  Error.captureStackTrace(this, arguments.callee);
}
//=============================================================================//
console.log('Listening on http://0.0.0.0:' + port );
