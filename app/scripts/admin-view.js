
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
