mongoose = require('mongoose')
connection = require('../utils/DBConnection.js')

class Project 
	constructor: (@name, @project) ->
		db = connection.createMongoDBConnection()
		schema = mongoose.Schema({name:'string'})
		Project = db.model("Project", schema)
		projectName = @name
		console.log("this is project name #{@name} and this is project name #{projectName}")
		@project = new Project({name: projectName})
		
	save: (res) =>
		@project.save (err) =>
			if err  
				console.log("error saving project") 
				res.contentType = 'json'
				res.code = 404
				res.send({error: 'erorr saving project'})
			else 
				console.log("saved project")
				res.contentType = 'json'
				res.code = 200
				res.send({success: "#{@name} has been saved"})
		
module.exports.Project = Project