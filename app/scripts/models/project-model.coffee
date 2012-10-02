class TeamCollaboration.ProjectModel extends Backbone.Model

  idAttribute: "_id"
  urlRoot: "#{GlobalConfig.API.server}:#{GlobalConfig.API.port}/projects"
  validate: (attrs) ->
    if attrs.name is null or attrs.name is "" 
      responseText: '{"error": "Project name must not be blank"}'

