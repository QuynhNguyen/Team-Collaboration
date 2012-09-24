document.write """
	<script type="text/template" id="tpl-edit-project">
		<div class="row-fluid">
			<div class="span4">
				<div>
				  <legend>Edit Project</legend>
				  <label for"projectID">Project ID</label>
				  <input id="projectID" type="text" value="<%= _id %>" class="span12" disabled>
				  <label for"projectName">Project Name</label>
				  <input id="projectName" type="text" value="<%= name %>" class="span12" required></input>
					<span class="help-block alert">Project name must be unique and not blank</span>
					<button type="submit" class="btn-small btn-success" id="updateProject">Update Project</button>
					<button type="submit" class="btn-small btn-danger" id="deleteProject">Delete Project</button>
					<button type="submit" class="btn-small btn-info" id="createAnotherProject">Create Project</button>
				</div>
			</div>	
		</div>
	</script>
"""