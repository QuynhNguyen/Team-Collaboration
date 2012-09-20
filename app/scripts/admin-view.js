
TeamCollaboration.AdminMain = Backbone.View.extend({
  el: $('#content'),
  template: _.template($('#tpl-admin-main').html()),
  render: function(e) {
    return this.$el.html(this.template());
  }
});

TeamCollaboration.AdminSideBar = Backbone.View.extend({
  el: $('#sidebar'),
  template: _.template($('#tpl-admin-sidebar').html()),
  render: function(e) {
    return this.$el.html(this.template());
  }
});

TeamCollaboration.AdminProjectManagementMain = Backbone.View.extend({
  el: $('#content'),
  initialize: function() {
    return console.log("init");
  },
  events: {
    "click button#createProject": "createProject"
  },
  template: _.template($('#tpl-admin-project-management-main').html()),
  createProject: function() {
    var projectName;
    console.log("clicking");
    projectName = $('#projectName').val();
    this.model = new TeamCollaboration.ProjectModel();
    this.model.set({
      name: projectName
    });
    this.model.save();
    console.log("wtf man");
    this.collection.add(this.model);
    return $('#projectName').val("");
  },
  render: function(e) {
    return this.$el.html(this.template());
  }
});

TeamCollaboration.AdminProjectListView = Backbone.View.extend({
  el: $('#sidebar'),
  events: {
    "click li.projectName": "renderEditProjectView"
  },
  renderEditProjectView: function(e) {
    var project, projectID;
    projectID = $(e.currentTarget).data("id");
    console.log(projectID);
    project = this.collection.get(projectID);
    this.editProjectView = new TeamCollaboration.AdminEditProjectView({
      model: project
    });
    return this.editProjectView.render();
  },
  template: _.template($('#tpl-admin-project-management-sidebar').html()),
  initialize: function() {
    this.$el.html(this.template());
    this.collection.on("reset", this.render, this);
    return this.collection.on("add", this.addProject, this);
  },
  addProject: function(project) {
    this.projectView = new TeamCollaboration.AdminProjectView({
      model: project
    });
    return this.$el.append(this.projectView.render());
  },
  render: function() {
    this.collection.forEach(this.addProject, this);
    return this;
  }
});

TeamCollaboration.AdminProjectView = Backbone.View.extend({
  template: _.template($('#tpl-project').html()),
  render: function(e) {
    return this.template(this.model.toJSON());
  }
});

TeamCollaboration.AdminEditProjectView = Backbone.View.extend({
  el: $('#content'),
  template: _.template($('#tpl-edit-project').html()),
  render: function() {
    return this.$el.html(this.template(this.model.toJSON()));
  }
});
