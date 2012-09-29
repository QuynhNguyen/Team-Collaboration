class TeamCollaboration.AdminMain extends Backbone.View

	el: $('#content')

	template: _.template($('#tpl-admin-main').html())
	
	initialize: ->
		DOMHelper.clearElement(this.el)

	render: (e) ->
		this.$el.html(this.template())


class TeamCollaboration.AdminSideBar extends Backbone.View

	el: $('#sidebar')

	template: _.template($('#tpl-admin-sidebar').html())
	
	initialize: ->
		DOMHelper.clearElement(this.el)
	
	render: (e) ->
		this.$el.html(this.template())



