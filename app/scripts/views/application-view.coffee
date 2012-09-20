TeamCollaboration.ApplicationView = Backbone.View.extend(

	template: _.template($('#tpl-frontpage-sidebar').html())
	
	render: (e) ->
		this.$el.html(this.template())
		return this

)