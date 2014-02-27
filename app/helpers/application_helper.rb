module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"warning round"
		when :notice
			"success radius"
		else
			""
		end
	end
end
