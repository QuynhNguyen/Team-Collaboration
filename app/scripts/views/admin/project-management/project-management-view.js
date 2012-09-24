
TeamCollaboration.ProjectManagementMain = Backbone.View.extend({
  el: $('#content'),
  events: {
    "click button#createProject": "createProject"
  },
  initialize: function() {
    return DOMHelper.clearElement(this.el);
  },
  template: _.template($('#tpl-admin-project-management-main').html()),
  createProject: function() {
    var projectName, self;
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
  },
  render: function(e) {
    return this.$el.html(this.template());
  }
});

TeamCollaboration.ProjectListView = Backbone.View.extend({
  el: $('#sidebar'),
  events: {
    "click li.projectName": "renderEditProjectView"
  },
  template: _.template($('#tpl-admin-project-management-sidebar').html()),
  initialize: function() {
    DOMHelper.clearElement(this.el);
    this.$el.html(this.template());
    this.collection.on("reset", this.render, this);
    return this.collection.on("add", this.addProjectToListView, this);
  },
  renderEditProjectView: function(e) {
    var project, projectID;
    projectID = $(e.currentTarget).data("id");
    project = this.collection.get(projectID);
    this.editProjectView = new TeamCollaboration.EditProjectView({
      model: project
    });
    return this.editProjectView.render();
  },
  addProjectToListView: function(project) {
    this.projectView = new TeamCollaboration.ProjectView({
      model: project
    });
    return this.$el.append(this.projectView.render());
  },
  render: function() {
    this.collection.forEach(this.addProjectToListView, this);
    return this;
  }
});

TeamCollaboration.ProjectView = Backbone.View.extend({
  model: TeamCollaboration.ProjectModel,
  tagName: 'li',
  className: 'projectName',
  initialize: function() {
    this.model.on('remove', this.remove, this);
    return this.model.on('change', this.render, this);
  },
  remove: function() {
    return this.$el.remove();
  },
  template: _.template($('#tpl-project').html()),
  render: function(e) {
    this.$el.attr("data-id", this.model.id);
    return this.$el.html(this.template(this.model.toJSON()));
  }
});

TeamCollaboration.EditProjectView = Backbone.View.extend({
  el: $('#content'),
  events: {
    "click button#createAnotherProject": "navigateToProjectCreator",
    "click button#deleteProject": "deleteProject",
    "keyup input#projectName": "updateProjectNameAsUserType",
    "click button#updateProject": "saveProject",
    "keypress input#projectName": "saveProjectOnEnter"
  },
  initialize: function() {
    return DOMHelper.clearElement(this.el);
  },
  template: _.template($('#tpl-edit-project').html()),
  navigateToProjectCreator: function() {
    return window.location.reload();
  },
  saveProjectOnEnter: function(event) {
    if (event.keyCode === 13) {
      return this.saveProject();
    }
  },
  updateProjectNameAsUserType: function(event) {
    var projectName;
    projectName = $('#projectName').val().trim();
    return this.model.set({
      name: projectName
    }, {
      error: function(model, errorMsg) {
        return $('.alert').addClass('alert-error').text($.parseJSON(errorMsg.responseText).error);
      }
    });
  },
  saveProject: function() {
    return this.model.save({}, {
      success: function() {
        return $('.alert').removeClass("alert-error").addClass('alert-success').text("Project name has been updated");
      },
      error: function(model, err) {
        return $('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error);
      }
    });
  },
  deleteProject: function() {
    var self;
    self = this;
    return this.model.destroy({
      success: function(model, res) {
        return self.$el.html("<div class=\"alert alert-success span4\">\n	Succesfully Deleted Project\n<br /><br />\n<p><button class=\"btn btn-primary\">Create Another Project</button></p>\n</div>");
      }
    });
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return $('#projectName').focus();
  }
});
