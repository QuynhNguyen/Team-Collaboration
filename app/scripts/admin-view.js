
TeamCollaboration.AdminMain = Backbone.View.extend({
  template: _.template($('#tpl-admin-main').html()),
  render: function(e) {
    this.$el.html(this.template());
    return this;
  }
});

TeamCollaboration.AdminSideBar = Backbone.View.extend({
  template: _.template($('#tpl-admin-sidebar').html()),
  render: function(e) {
    this.$el.html(this.template());
    return this;
  }
});

TeamCollaboration.AdminProjectManagementMain = Backbone.View.extend({
  events: {
    "click button": "createProject"
  },
  template: _.template($('#tpl-admin-project-management-main').html()),
  createProject: function() {
    var projectName;
    projectName = $('#projectName').val();
    console.log(projectName);
    this.model = new TeamCollaboration.ProjectModel({
      name: projectName
    });
    return console.log(this.model);
  },
  render: function(e) {
    this.$el.html(this.template());
    return this;
  }
});
