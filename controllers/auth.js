/////// ROUTES /////////////
module.exports = function(server) {
  //Landing page
  server.get('/', function(req,res) {
      res.local('title', 'Riiple');
      res.local('description', 'Page Description');
      res.local('analyticssiteid', 'XXXXXXX');
      res.local('source', 'landing');
      console.log("About to load page");
      res.render('index');
  });
};