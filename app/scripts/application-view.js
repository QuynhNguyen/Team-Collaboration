
TeamCollaboration.ApplicationSideBarView = Backbone.View.extend({
  el: $('#sidebar'),
  template: _.template($('#tpl-frontpage-sidebar').html()),
  render: function(e) {
    return this.$el.html(this.template());
  }
});
