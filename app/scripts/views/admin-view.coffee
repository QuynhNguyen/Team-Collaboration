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

TeamCollaboration.Test = Backbone.View.extend(

	initialize: ->
		console.log(this.test)
		console.log(this.collection)
		
	render: ->
		console.log(this.test)
		console.log(this.collection)
		console.log('hi')

)


TeamCollaboration.AdminEditProjectView = Backbone.View.extend(

	el: $('#content')
	
	events: {
		"click button#createAnotherProject": "navigateToProjectCreator"
		"click button#deleteProject": "deleteProject"
		"keyup input#projectName": "updateProjectNameAsUserType"
		"click button#updateProject": "saveProject"
		"keypress input#projectName": "saveProjectOnEnter"
	}
	
	initialize: ->
		this.$el.unbind()
		this.$el.empty()
	
	template: _.template($('#tpl-edit-project').html())
	
	navigateToProjectCreator: ->
		window.location.reload()
		
	updateProjectNameAsUserType: (event) ->
		
		projectName = $('#projectName').val().trim()
		if event.keyCode is not 13
			$('.alert').removeClass('alert-error alert-success').text("Project name must be unique and not blank")
		this.model.set(
			{name: projectName}
			success: () ->
				console.log("success")
			error: (model, errorMsg) ->
				console.log('test me yes')
				$('.alert').addClass('alert-error').text($.parseJSON(errorMsg.responseText).error)
		)
		
	saveProject: ->
		this.model.save(
			{}
			success: () ->
				$('.alert').removeClass("alert-error").addClass('alert-success').text("Project name has been updated")
			error: (model, err) ->
				console.log(err)
				$('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error)
		)
		
	saveProjectOnEnter: (event) ->
		this.saveProject() if event.keyCode is 13
	
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
		$('#projectName').focus()

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

