##ADMIN MAIN PAGE

TeamCollaboration.AdminMain = Backbone.View.extend(

	el: $('#content')

	template: _.template($('#tpl-admin-main').html())
	
	initialize: ->
		this.$el.unbind()
		this.$el.empty()

	render: (e) ->
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


##ADMIN PROJECT MANAGEMENT

TeamCollaboration.AdminProjectManagementMain = Backbone.View.extend(

	el: $('#content')
	
	events: 
		"click button#createProject": "createProject"
		
	initialize: ->
		this.$el.unbind()
		this.$el.empty()
	
	template: _.template($('#tpl-admin-project-management-main').html())
	
	createProject: ->
		console.log("clicking")
		projectName = $('#projectName').val()
		this.model = new TeamCollaboration.ProjectModel()
		self = this
		this.model.save(
			{name:projectName} 
			success: (model, response) ->
				self.collection.add(model)
		)
		$('#projectName').val("")
	
	render: (e) ->
		this.$el.html(this.template())
		
) 


TeamCollaboration.AdminProjectListView = Backbone.View.extend(

	el: $('#sidebar')
	
	events:
		"click li.projectName": "renderEditProjectView"
		
	initialize: ->
		this.$el.unbind()
		this.$el.empty()
		this.$el.html(this.template())
		this.collection.on("reset", this.render, this)
		this.collection.on("add", this.addProject, this)
		
	renderEditProjectView: (e) ->
		projectID = $(e.currentTarget).data("id")
		console.log(projectID)
		project = this.collection.get(projectID)
		this.editProjectView = new TeamCollaboration.AdminEditProjectView({model:project})
		this.editProjectView.render()
	
	template: _.template($('#tpl-admin-project-management-sidebar').html())
	
	
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
		##console.log(this.model)
		return this.template(this.model.toJSON())
)

TeamCollaboration.AdminEditProjectView = Backbone.View.extend(

	el: $('#content')
	
	events: {
		"click button#createAnotherProject": "navigateToProjectCreator"
	}
	
	template: _.template($('#tpl-edit-project').html())
	
	navigateToProjectCreator: ->
		console.log("test")
		window.location.reload()
	
	render: ->
		this.$el.html(this.template(this.model.toJSON()))

)