
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
    $('.nav-header').text("Administrative Tasks");
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
    this.model = new TeamCollaboration.ProjectModel();
    this.model.set({
      name: projectName
    });
    this.model.save();
    return $('#projectName').val("");
  },
  render: function(e) {
    this.$el.html(this.template());
    return this;
  }
});
