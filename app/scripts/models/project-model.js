var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.ProjectModel = (function(_super) {

  __extends(ProjectModel, _super);

  function ProjectModel() {
    return ProjectModel.__super__.constructor.apply(this, arguments);
  }

  ProjectModel.prototype.idAttribute = "_id";

  ProjectModel.prototype.urlRoot = "" + GlobalConfig.API.server + ":" + GlobalConfig.API.port + "/projects";

  ProjectModel.prototype.validate = function(attrs) {
    if (attrs.name === null || attrs.name === "") {
      return {
        responseText: '{"error": "Project name must not be blank"}'
      };
    }
  };

  return ProjectModel;

})(Backbone.Model);
