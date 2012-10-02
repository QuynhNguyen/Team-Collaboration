class TeamCollaboration.ProjectManagementMain extends Backbone.View

  el: $('#content')
	
  events: 
    "click button#createProject": "createProject"
    "keypress input#projectName": "saveProjectOnEnter"
		
  initialize: ->
    DOMHelper.clearElement(this.el)
	
  template: _.template($('#tpl-admin-project-management-main').html())
	
  saveProjectOnEnter: (event) ->
    this.createProject() if event.keyCode is 13

  createProject: ->
    $('.alert').removeClass('alert-success alert-error') ## Reset alert class
    projectName = $('#projectName').val().trim()
    this.model = new TeamCollaboration.ProjectModel()
    self = this
    this.model.save(
      {name:projectName} 
      success: (model, response) ->
        self.collection.add(model)
        $('.alert').addClass('alert-success').text("#{projectName} has been created")
        $('#projectName').val("")
      error: (model, err) ->
        $('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error)
    )
	
  render: (e) ->
    this.$el.html(this.template())
 

class TeamCollaboration.ProjectListView extends Backbone.View

  el: $('#sidebar')
	
  path: ""
  
  events:
    "click li.projectName": "renderProjectView"
		
  template: _.template($('#tpl-admin-project-management-sidebar').html())
		
  initialize: (options) ->
    DOMHelper.clearElement(this.el)
    this.$el.html(this.template())
    this.collection.on("reset", this.render, this)
    this.collection.on("add", this.addProjectToListView, this)
    this.path = options.path
    
  isFrontPage: ->
    if this.path is "" then true else false
    
  renderProjectView: (e) ->
    if this.isFrontPage()
      this.renderMainPageProjectView()
    else
      this.renderEditProjectView(e)
      
  renderMainPageProjectView: ->
    console.log("render main page")
  
  renderEditProjectView: (e) ->
    projectID = $(e.currentTarget).data("id")
    project = this.collection.get(projectID)
    this.editProjectView = new TeamCollaboration.EditProjectView({model:project})
    this.editProjectView.render()
	
  addProjectToListView: (project) -> 
    this.projectView = new TeamCollaboration.ProjectView({model:project})
    this.$el.append(this.projectView.render())
		
  render: ->
    this.collection.forEach(this.addProjectToListView, this)
    return this


class TeamCollaboration.ProjectView extends Backbone.View

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

class TeamCollaboration.EditProjectView extends Backbone.View

  el: $('#content')
	
  events:
    "click button#createAnotherProject": "navigateToProjectCreator"
    "click button#deleteProject": "deleteProject"
    "keyup input#projectName": "updateProjectNameAsUserType"
    "click button#updateProject": "saveProject"
    "keypress input#projectName": "saveProjectOnEnter"
  
	
  initialize: ->
    DOMHelper.clearElement(this.el)
	
  template: _.template($('#tpl-edit-project').html())
	
  navigateToProjectCreator: ->
    window.location.reload()
		
  saveProjectOnEnter: (event) ->
    this.saveProject() if event.keyCode is 13
		
  updateProjectNameAsUserType: (event) ->
    projectName = $('#projectName').val().trim()
    this.model.set(
      {name: projectName}
      error: (model, errorMsg) ->
        $('.alert').addClass('alert-error').text($.parseJSON(errorMsg.responseText).error)
    )
		
  saveProject: ->
    this.model.save(
      {}
      success: () ->
        $('.alert').removeClass("alert-error").addClass('alert-success').text("Project name has been updated")
      error: (model, err) ->
        $('.alert').addClass('alert-error').text(jQuery.parseJSON(err.responseText).error)
    )
		
  deleteProject: ->
    self = this
    this.model.destroy(
      success: (model, res) ->
        self.$el.html(_.template($('#tpl-project-deleted').html()))
        $('#project-deleted').click( -> self.navigateToProjectCreator() )
    )
		
  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    $('#projectName').focus()


