module ApplicationHelper
	def sortable(column, title)
    	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    	link_to title, params.merge(sort: column, direction: direction)      
    end 

    def get_month      
      translator = {
      	1 => ["Januar", "01"],
      	2 => ["Februar", "02"],
      	3 => ['März', "03"],
      	4 => ["April", "04"],
      	5 => ["Mai", "05"],
      	6 => ["June", "06"],
      	7 => ["Juli", "07"],
      	8 => ["August", "08"],
      	9 => ["September", "09"],
      	10 => ["Oktober", "10"],
      	11 => ["November", "11"],
      	12 => ["Dezember", "12"]
      }     
      month_number = Date.today.strftime("%m")
      year = Date.today.strftime("%Y")
      return result = { 
      	  translator: translator, 
          month_number: month_number.to_i }            
    end   
	
end
