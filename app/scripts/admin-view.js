
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
    var projectName, self;
    console.log("clicking");
    projectName = $('#projectName').val();
    this.model = new TeamCollaboration.ProjectModel();
    self = this;
    this.model.save({
      name: projectName
    }, {
      success: function(model, response) {
        console.log(model);
        console.log(self.model);
        console.log(response);
        model.set({
          _id: response._id
        });
        return self.collection.add(model);
      }
    });
    console.log("wtf man");
    return $('#projectName').val("");
  },
  render: function(e) {
    return this.$el.html(this.template());
  },
  close: function() {
    this.$el.unbind();
    return this.$el.empty();
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
  },
  close: function() {
    this.$el.unbind();
    return this.$el.empty();
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
