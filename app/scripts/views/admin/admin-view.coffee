
TeamCollaboration.AdminMain = Backbone.View.extend(

	el: $('#content')

	template: _.template($('#tpl-admin-main').html())
	
	initialize: ->
		this.$el.unbind()
		this.$el.empty()

	render: (e) ->
		console.log("test")
		this.$el.html(this.template())
)

TeamCollaboration.AdminSideBar = Backbone.View.extend(

	el: $('#sidebar')

	template: _.template($('#tpl-admin-sidebar').html())
	
	initialize: ->
		this.$el.unbind()
		this.$el.empty()
	
	render: (e) ->
		this.$el.html(this.template())
)



