// Generated by CoffeeScript 1.3.3
(function() {
  var projectSchema, restify, saveProject, server;

  restify = require('restify');

  projectSchema = require('./schema/Project.js');

  server = restify.createServer();

  saveProject = function(req, res, next) {
    var project, projectName;
    projectName = req.params.name;
    project = new projectSchema.Project(projectName);
    return project.save(res);
  };

  server.post('/projects/:name', saveProject);

  server.listen(8080, function() {
    return console.log("listening to server " + server.name + ", " + server.url);
  });

}).call(this);