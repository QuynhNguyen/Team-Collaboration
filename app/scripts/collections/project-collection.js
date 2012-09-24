
TeamCollaboration.ProjectCollection = Backbone.Collection.extend({
  model: TeamCollaboration.ProjectModel,
  url: "http://localhost:8080/projects",
  fetchIfEmpty: function() {
    if (this.length <= 0) {
      return this.fetch();
    }
  }
});
