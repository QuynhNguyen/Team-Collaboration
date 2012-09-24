TeamCollaboration.ProjectModel = Backbone.Model.extend(

  idAttribute: "_id"
  urlRoot: 'http://localhost:8080/projects'
  validate: (attrs) ->
    if attrs.name is null or attrs.name is "" 
      responseText: '{"error": "Project name must not be blank"}'
			
)
