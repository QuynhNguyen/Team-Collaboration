var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.ProjectManagementMain = (function(_super) {

  __extends(ProjectManagementMain, _super);

  function ProjectManagementMain() {
    return ProjectManagementMain.__super__.constructor.apply(this, arguments);
  }

  ProjectManagementMain.prototype.el = $('#content');

  ProjectManagementMain.prototype.events = {
    "click button#createProject": "createProject",
    "keypress input#projectName": "saveProjectOnEnter"
  };

  ProjectManagementMain.prototype.initialize = function() {
    return DOMHelper.clearElement(this.el);
  };

  ProjectManagementMain.prototype.template = _.template($('#tpl-admin-project-management-main').html());

  ProjectManagementMain.prototype.saveProjectOnEnter = function(event) {
    if (event.keyCode === 13) {
      return this.createProject();
    }
  };

  ProjectManagementMain.prototype.createProject = function() {
    var projectName, self;
    $('.alert').removeClass('alert-success alert-error');
    projectName = $('#projectName').val().trim();
    this.model = new TeamCollaboration.ProjectModel();
    self = this;
    return this.model.save({
      name: projectName
    }, {
      success: function(model, response) {
        self.collection.add(model);
        $('.alert').addClass('alert-success').text("" + projectName + " has been created");
        return $('#projectName').val("");
      },
      error: function(model, err) {
        return $('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error);
      }
    });
  };

  ProjectManagementMain.prototype.render = function(e) {
    return this.$el.html(this.template());
  };

  return ProjectManagementMain;

})(Backbone.View);

TeamCollaboration.ProjectListView = (function(_super) {

  __extends(ProjectListView, _super);

  function ProjectListView() {
    return ProjectListView.__super__.constructor.apply(this, arguments);
  }

  ProjectListView.prototype.el = $('#sidebar');

  ProjectListView.prototype.events = {
    "click li.projectName": "renderEditProjectView"
  };

  ProjectListView.prototype.template = _.template($('#tpl-admin-project-management-sidebar').html());

  ProjectListView.prototype.initialize = function() {
    DOMHelper.clearElement(this.el);
    this.$el.html(this.template());
    this.collection.on("reset", this.render, this);
    return this.collection.on("add", this.addProjectToListView, this);
  };

  ProjectListView.prototype.renderEditProjectView = function(e) {
    var project, projectID;
    projectID = $(e.currentTarget).data("id");
    project = this.collection.get(projectID);
    this.editProjectView = new TeamCollaboration.EditProjectView({
      model: project
    });
    return this.editProjectView.render();
  };

  ProjectListView.prototype.addProjectToListView = function(project) {
    this.projectView = new TeamCollaboration.ProjectView({
      model: project
    });
    return this.$el.append(this.projectView.render());
  };

  ProjectListView.prototype.render = function() {
    this.collection.forEach(this.addProjectToListView, this);
    return this;
  };

  return ProjectListView;

})(Backbone.View);

TeamCollaboration.ProjectView = (function(_super) {

  __extends(ProjectView, _super);

  function ProjectView() {
    return ProjectView.__super__.constructor.apply(this, arguments);
  }

  ProjectView.prototype.model = TeamCollaboration.ProjectModel;

  ProjectView.prototype.tagName = 'li';

  ProjectView.prototype.className = 'projectName';

  ProjectView.prototype.initialize = function() {
    this.model.on('remove', this.remove, this);
    return this.model.on('change', this.render, this);
  };

  ProjectView.prototype.remove = function() {
    return this.$el.remove();
  };

  ProjectView.prototype.template = _.template($('#tpl-project').html());

  ProjectView.prototype.render = function(e) {
    this.$el.attr("data-id", this.model.id);
    return this.$el.html(this.template(this.model.toJSON()));
  };

  return ProjectView;

})(Backbone.View);

TeamCollaboration.EditProjectView = (function(_super) {

  __extends(EditProjectView, _super);

  function EditProjectView() {
    return EditProjectView.__super__.constructor.apply(this, arguments);
  }

  EditProjectView.prototype.el = $('#content');

  EditProjectView.prototype.events = {
    "click button#createAnotherProject": "navigateToProjectCreator",
    "click button#deleteProject": "deleteProject",
    "keyup input#projectName": "updateProjectNameAsUserType",
    "click button#updateProject": "saveProject",
    "keypress input#projectName": "saveProjectOnEnter"
  };

  EditProjectView.prototype.initialize = function() {
    return DOMHelper.clearElement(this.el);
  };

  EditProjectView.prototype.template = _.template($('#tpl-edit-project').html());

  EditProjectView.prototype.navigateToProjectCreator = function() {
    return window.location.reload();
  };

  EditProjectView.prototype.saveProjectOnEnter = function(event) {
    if (event.keyCode === 13) {
      return this.saveProject();
    }
  };

  EditProjectView.prototype.updateProjectNameAsUserType = function(event) {
    var projectName;
    projectName = $('#projectName').val().trim();
    return this.model.set({
      name: projectName
    }, {
      error: function(model, errorMsg) {
        return $('.alert').addClass('alert-error').text($.parseJSON(errorMsg.responseText).error);
      }
    });
  };

  EditProjectView.prototype.saveProject = function() {
    return this.model.save({}, {
      success: function() {
        return $('.alert').removeClass("alert-error").addClass('alert-success').text("Project name has been updated");
      },
      error: function(model, err) {
        return $('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error);
      }
    });
  };

  EditProjectView.prototype.deleteProject = function() {
    var self;
    self = this;
    return this.model.destroy({
      success: function(model, res) {
        self.$el.html(_.template($('#tpl-project-deleted').html()));
        return $('#project-deleted').click(function() {
          return self.navigateToProjectCreator();
        });
      }
    });
  };

  EditProjectView.prototype.render = function() {
    this.$el.html(this.template(this.model.toJSON()));
    return $('#projectName').focus();
  };

  return EditProjectView;

})(Backbone.View);
