class ExpensesController < ApplicationController

  # GET /expenses
  def index
    @expenses = Expense.all
  end
  # GET /expenses/:id
  def show
   @expense = Expense.find(params[:id])
  end

  #GET /expenses/new
  def new
    @expense = Expense.new
  end
  #POST /expenses
  def create
  	@expense = Expense.create(expenses_params)

    if @expense
      redirect_to @expense	                   		
    else
  	  render :new
  	end
	   
  end

  # GET expenses/:id/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # PUT update/:id
  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expenses_params)
      redirect_to @expense
    else
      render :edit
    end	
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_path
  end

  private	

  def expenses_params # nombre por convecion
  	year = params[:expense]["date(1i)"]
  	month = params[:expense]["date(2i)"]
  	day = params[:expense]["date(3i)"]
  	date = "#{year}-#{month}-#{day}"
    params.require(:expense).permit(:date,:article, :price, :note)	# objeto params
  end

end