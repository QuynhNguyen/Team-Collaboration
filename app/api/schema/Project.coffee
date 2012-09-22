mongoose = require('mongoose')
connection = require('../utils/DBConnection.js')

class Project 
	constructor: (@name, @project, @Project, @db) ->
		@db = connection.createMongoDBConnection()
		schema = mongoose.Schema({name:'string'})
		@Project = @db.model("Project", schema)
		projectName = @name
		console.log("this is project name #{@name} and this is project name #{projectName}")
		@project = new @Project({name: projectName})
		console.log("create new project db")
		
		
	save: (res) =>
		@project.save (err, proj) =>
			if err   
				res.contentType = 'json'
				res.send(404, {error: 'erorr saving project'})
			else 
				console.log("saved project")
				res.contentType = 'json'
				res.send(
					success: "#{@name} has been saved"
					_id: "#{proj._id}"
				)
			@db.close()
				
	getProjectList: (res) =>
		@Project.find (err, projects) =>
			res.contentType = 'json'
			res.send(projects)
			@db.close()
			
			
	getProject: (res, projectName) =>
		console.log(projectName)
		@Project.find({name:projectName}).exec( (err, project) =>
				console.log(project.length)
				if project.length <= 0
					res.send({error: "No Project Found Under The Name Of #{projectName}"})
					res.end()
				else
					res.contentType = 'json'
					res.send(200, project)
					
				@db.close()
		)
		
	deleteProject: (res, projectID) =>
		@Project.findByIdAndRemove(projectID, =>
				console.log("deleting shit")
				res.contentType = 'json'
				res.send(200, {success: "Delete Project Request Executed"})
				@db.close()
		)
		
	updateProject: (res, projectID, projectName) =>
		@Project.findById(
			projectID
			(err, proj) =>
				proj.name = projectName
				proj.save( => 
					res.contentType = 'json'
					res.send(200, {success: "Project has been updated"})
					@db.close()
				)
		)
		
		
		
module.exports.Project = Project