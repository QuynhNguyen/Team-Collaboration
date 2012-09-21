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
		this.collection.on("add", this.addProjectToListView, this)
		##this.collection.on("remove", this.removeProjectFromListView, this)
		
	renderEditProjectView: (e) ->
		projectID = $(e.currentTarget).data("id")
		console.log(projectID)
		project = this.collection.get(projectID)
		this.editProjectView = new TeamCollaboration.AdminEditProjectView({model:project})
		this.editProjectView.render()
	
	template: _.template($('#tpl-admin-project-management-sidebar').html())
	
	
	addProjectToListView: (project) -> 
		this.projectView = new TeamCollaboration.AdminProjectView({model:project})
		this.$el.append(this.projectView.render())
		
		

	render: ->
		this.collection.forEach(this.addProjectToListView, this)
		return this
		
		
)

TeamCollaboration.AdminProjectView = Backbone.View.extend(

	template: _.template($('#tpl-project').html())

	remove: ->
		this.$el.remove()

	render: (e) ->
		return this.template(this.model.toJSON())
)

TeamCollaboration.AdminEditProjectView = Backbone.View.extend(

	el: $('#content')
	
	events: {
		"click button#createAnotherProject": "navigateToProjectCreator"
		"click button#deleteProject": "deleteProject"
	}
	
	initialize: ->
		this.$el.unbind()
		this.$el.empty()
	
	template: _.template($('#tpl-edit-project').html())
	
	navigateToProjectCreator: ->
		window.location.reload()
		
	deleteProject: ->
		console.log("test me")
		
		this.model.destroy(
			success: (model, res) ->
				console.log(res)
				console.log(model)
		)
		
	render: ->
		this.$el.html(this.template(this.model.toJSON()))

)