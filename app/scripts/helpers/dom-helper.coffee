class DOMHelper
	@clearElement: (el) ->
		$(el).unbind()
		$(el).empty()