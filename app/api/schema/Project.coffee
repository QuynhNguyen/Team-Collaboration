mongoose = require('mongoose')
connection = require('../utils/DBConnection.js')

class Project 
	constructor: (@name, @project, @Project) ->
		db = connection.createMongoDBConnection()
		schema = mongoose.Schema({name:'string'})
		@Project = db.model("Project", schema)
		projectName = @name
		console.log("this is project name #{@name} and this is project name #{projectName}")
		@project = new @Project({name: projectName})
		
		
	save: (res) =>
		@project.save (err, proj) =>
			if err  
				console.log("error saving project") 
				res.contentType = 'json'
				res.status(404)
				res.send({error: 'erorr saving project'})
			else 
				console.log("saved project")
				res.contentType = 'json'
				res.send(
					success: "#{@name} has been saved"
					_id: "#{proj._id}"
				)
				
	getProjectList: (res) =>
		@Project.find (err, projects) =>
			res.contentType = 'json'
			res.send(projects)
			
			
	getProject: (res, projectName) =>
		console.log(projectName)
		@Project.find({name:projectName}).exec( (err, project) =>
				console.log(project.length)
				if project.length <= 0
					res.send({error: "No Project Found Under The Name Of #{projectName}"})
					res.end()
				else
					res.contentType = 'json'
					res.send(project)
		)
		
	deleteProject: (res, projectID) =>
		@Project.findByIdAndRemove(projectID, ->
				res.send({success: "Delete Project Request Executed"})
		)
		
		
module.exports.Project = Project