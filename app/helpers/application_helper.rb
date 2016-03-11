module ApplicationHelper
	def sortable(column, title)
    	direction = sort_direction == 'asc' ? 'desc' : 'asc'    	
    	column = sort_column
    	link_to title, params.merge(column: column, direction: direction)      
    end 

    def get_month      
      translator = {
      	january: "Januar",
      	february: "Februar",
      	march: 'März',
      	april: "April",
      	may: "Mai",
      	june: "June",
      	july: "Juli",
      	august: "August",
      	september: "September",
      	october: "Oktober",
      	november: "November",
      	december: "Dezember"
      }
      month = Date.today.strftime("%B").downcase.to_sym
      month_name_de = translator[month]
      month_number = Date.today.strftime("%m")
      year = Date.today.strftime("%Y")
      return result = { 
      	  month_name: month_name_de, 
          month_number: month_number }            
    end   
	
end
