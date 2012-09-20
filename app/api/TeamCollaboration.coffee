restify = require('restify')
projectSchema = require('./schema/Project.js')
server = restify.createServer()

##Project Management REST API
saveProject = (req, res, next) ->
	projectName = req.params.name
	project = new projectSchema.Project(projectName)
	project.save(res)
	
getProjectList = (req, res, next) ->	
	project = new projectSchema.Project()
	project.getProjectList(res)
	
server.post('/projects/:name', saveProject)
server.get('/projects', getProjectList)

server.listen(8080, -> 
	console.log("listening to server #{server.name}, #{server.url}");
)
