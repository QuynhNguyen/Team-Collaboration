
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
    this.model = new TeamCollaboration.ProjectModel();
    if (this.model.isNew()) {
      this.model.set({
        id: projectName
      });
      return this.model.save();
    } else {
      return console.log("Fk u");
    }
  },
  render: function(e) {
    this.$el.html(this.template());
    return this;
  }
});
