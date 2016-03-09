module ApplicationHelper
	def sortable(column, title)
    	direction = sort_direction == 'asc' ? 'desc' : 'asc'    	
    	column = sort_column
    	link_to title, params.merge(column: column, direction: direction)      
    end    
	
end
