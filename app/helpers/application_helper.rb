module ApplicationHelper
  def current_url?(matcher)
		(request.path_parameters[:controller] == matcher ? true : false)
	end
end
