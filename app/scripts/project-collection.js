
TeamCollaboration.ProjectCollection = Backbone.Collection.extend({
  model: TeamCollaboration.ProjectModel,
  url: "http://localhost:8080/projects"
});
