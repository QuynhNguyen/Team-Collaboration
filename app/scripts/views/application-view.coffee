TeamCollaboration.ApplicationSideBarView = Backbone.View.extend(

	el: $('#sidebar')

	template: _.template($('#tpl-frontpage-sidebar').html())
	
	render: (e) ->
		this.$el.html(this.template())

)