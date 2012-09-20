
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
    this.model.toJSON();
    return this.model.save({
      name: projectName
    }, {
      success: function() {
        return console.log("Saved");
      },
      error: function(mymodel, error) {
        console.log("error");
        console.log(mymodel.toJSON());
        return console.log(error);
      }
    });
  },
  render: function(e) {
    this.$el.html(this.template());
    return this;
  }
});
