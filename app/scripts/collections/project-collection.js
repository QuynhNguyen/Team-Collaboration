var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.ProjectCollection = (function(_super) {

  __extends(ProjectCollection, _super);

  function ProjectCollection() {
    return ProjectCollection.__super__.constructor.apply(this, arguments);
  }

  ProjectCollection.prototype.model = TeamCollaboration.ProjectModel;

  ProjectCollection.prototype.url = "http://217.23.7.78:8080/projects";

  return ProjectCollection;

})(Backbone.Collection);
