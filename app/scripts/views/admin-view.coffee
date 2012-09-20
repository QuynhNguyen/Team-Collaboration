##ADMIN MAIN PAGE

TeamCollaboration.AdminMain = Backbone.View.extend(

	template: _.template($('#tpl-admin-main').html())

	render: (e) ->
		this.$el.html(this.template())
		return this
)

TeamCollaboration.AdminSideBar = Backbone.View.extend(

	template: _.template($('#tpl-admin-sidebar').html())
	
	render: (e) ->
		return this.template()
)


##ADMIN PROJECT MANAGEMENT

TeamCollaboration.AdminProjectManagementMain = Backbone.View.extend(

	events: 
		"click button": "createProject"
	
	template: _.template($('#tpl-admin-project-management-main').html())
	
	createProject: ->
		projectName = $('#projectName').val()
		this.model = new TeamCollaboration.ProjectModel()
		this.model.set({name:projectName})
		this.model.save()
		this.collection.add(this.model)
		$('#projectName').val("")
	
	render: (e) ->
		this.$el.html(this.template())
		return this
) 


TeamCollaboration.AdminProjectListView = Backbone.View.extend(
	
	template: _.template($('#tpl-admin-project-management-sidebar').html())
	
	initialize: ->
		this.$el.append(this.template())
		this.collection.on("reset", this.render, this)
		this.collection.on("add", this.addProject, this)
	
	addProject: (project) -> 
		this.projectView = new TeamCollaboration.AdminProjectView({model:project})
		this.$el.append(this.projectView.render())

	render: ->
		this.collection.forEach(this.addProject, this)
		return this
		
)

TeamCollaboration.AdminProjectView = Backbone.View.extend(
	
	template: _.template($('#tpl-project').html())

	render: (e) ->
		console.log(this.model)
		return this.template(this.model.toJSON())
)