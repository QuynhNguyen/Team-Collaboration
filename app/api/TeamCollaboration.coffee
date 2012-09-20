restify = require('restify')
projectSchema = require('./schema/Project.js')
server = restify.createServer()

##Project Management REST API
postProject = (req, res, next) ->
	projectName = req.params.name
	project = new projectSchema.Project(projectName)
	project.save(res)
	
getProjectList = (req, res, next) ->	
	project = new projectSchema.Project()
	project.getProjectList(res)
	
getProject = (req, res, next) ->
	projectName = req.params.name
	project = new projectSchema.Project()
	project.getProject(res, projectName)
	
server.post('/projects/:name', postProject)
server.get('/projects', getProjectList)
server.get('/projects/:name', getProject)

server.listen(8080, -> 
	console.log("listening to server #{server.name}, #{server.url}");
)
