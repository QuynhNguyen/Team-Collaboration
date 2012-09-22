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
		$('.alert').removeClass('alert-error').text("Project name must be unique and not blank")
		projectName = $('#projectName').val().trim()
		this.model = new TeamCollaboration.ProjectModel()
		self = this
		this.model.save(
			{name:projectName} 
			success: (model, response) ->
				self.collection.add(model)
			error: (model, err) ->
				console.log(err)
				$('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error)
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
		
	
	renderEditProjectView: (e) ->
		projectID = $(e.currentTarget).data("id")
		project = this.collection.get(projectID)
		this.editProjectView = new TeamCollaboration.AdminEditProjectView({model:project})
		this.editProjectView.render()
	
	template: _.template($('#tpl-admin-project-management-sidebar').html())
	
	
	addProjectToListView: (project) -> 
		console.log("WTFzz")
		this.projectView = new TeamCollaboration.AdminProjectView({model:project})
		this.$el.append(this.projectView.render())
		
		

	render: ->
		this.collection.forEach(this.addProjectToListView, this)
		return this
		
		
)

TeamCollaboration.AdminProjectView = Backbone.View.extend(

	model: TeamCollaboration.ProjectModel
	
	tagName: 'li'
	className: 'projectName'

	initialize: ->
		this.model.on('remove', this.remove, this)
		this.model.on('change', this.render, this)
		
	remove: ->
		this.$el.remove()

	template: _.template($('#tpl-project').html())

	render: (e) ->
		this.$el.attr("data-id", this.model.id)
		return this.$el.html(this.template(this.model.toJSON()))
)

TeamCollaboration.AdminEditProjectView = Backbone.View.extend(

	el: $('#content')
	
	events: {
		"click button#createAnotherProject": "navigateToProjectCreator"
		"click button#deleteProject": "deleteProject"
		"keyup input#projectName": "updateProjectNameAsUserType"
	}
	
	initialize: ->
		this.$el.unbind()
		this.$el.empty()
	
	template: _.template($('#tpl-edit-project').html())
	
	navigateToProjectCreator: ->
		window.location.reload()
		
	updateProjectNameAsUserType: ->
		console.log("key down")
		projectName = $('#projectName').val()
		this.model.set({name: projectName})
		this.model.save()
	
	deleteProject: ->
		self = this
		this.model.destroy(
			success: (model, res) ->
				self.$el.html( 
					"""
						<div class="alert alert-success span4">
							Succesfully Deleted Project
						<br /><br />
						<p><button class="btn btn-primary">Create Another Project</button></p>
						</div>
					"""
				)
		)
		
	render: ->
		this.$el.html(this.template(this.model.toJSON()))

)