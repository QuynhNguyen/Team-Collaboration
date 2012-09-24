document.write """
  <script type="text/template" id="tpl-admin-project-management-main">
    <div class="row-fluid">
      <div class="span4">
        <legend>Create Project</legend>
        <label for"projectName">Project Name</label>
        <input id="projectName" type="text" placeholder="Type something…" class="span12" required>
        <span class="help-block alert">Project name must be unique and not blank</span>
        <button id="createProject" class="btn btn-primary">Create Project</button>
      </div>	
    </div>
  </script>
"""