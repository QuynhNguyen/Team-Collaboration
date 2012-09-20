
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
  events: {
    "click button": "createProject"
  },
  template: _.template($('#tpl-admin-project-management-main').html()),
  createProject: function() {
    var projectName;
    projectName = $('#projectName').val();
    this.model = new TeamCollaboration.ProjectModel();
    this.model.set({
      name: projectName
    });
    this.model.save();
    this.collection.add(this.model);
    return $('#projectName').val("");
  },
  render: function(e) {
    return this.$el.html(this.template());
  }
});

TeamCollaboration.AdminProjectListView = Backbone.View.extend({
  el: $('#sidebar'),
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
    console.log(this.model);
    return this.template(this.model.toJSON());
  }
});
