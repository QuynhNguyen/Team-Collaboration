
TeamCollaboration.ProjectModel = Backbone.Model.extend({
  idAttribute: "_id",
  urlRoot: 'http://localhost:8080/projects',
  validate: function(attrs) {
    if (attrs.name === null || attrs.name === "") {
      return {
        responseText: '{"error": "Project name must not be blank"}'
      };
    }
  }
});
