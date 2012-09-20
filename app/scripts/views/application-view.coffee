TeamCollaboration.ApplicationView = Backbone.View.extend(

	template: _.template($('#tpl-frontpage-sidebar').html())
	
	render: (e) ->
		return this.template()

)