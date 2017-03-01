class ExpensesController < ApplicationController
  include ExpensesHelper
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!, except: [:index] # helper from devise
  before_action :set_expense, except: [:index, :new, :create]
  before_action :superadmin_authenticate 



  # GET /expenses
  def index
    month = params[:month]
    days = get_number_of_days(month,2017)
    if month.present?
      @expenses = Expense.where("date >= :start_date AND date <= :end_date",
                               start_date: '2017-'+month+'-01',
                               end_date: '2017-'+month+'-'+days).order(sort_column+' '+sort_direction).page(params[:page]).per(10)
      @sum_per_month = @expenses.sum(:price)
    else
      @expenses = Expense.order(sort_column+' '+sort_direction).page(params[:page]).per(10)
    end

  end

  # GET /expenses/:id
  def show
  end

  #GET /expenses/new
  def new
    @expense = Expense.new
  end

  #POST /expenses
  def create
  	@expense = Expense.create(expenses_params)

    if @expense
      redirect_to @expense, notice: 'Artikel erfolgreich angelegt'
    else
  	  render :new
  	end

  end

  # GET expenses/:id/edit
  def edit
  end

  # PUT update/:id
  def update
    if @expense.update(expenses_params)
      redirect_to @expense, notice: 'Artikel erfolgreich geändert'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to :back, notice: 'Artikel erfolgreich gelöscht'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expenses_params # nombre por convecion
  	year = params[:expense]["date(1i)"]
  	month = params[:expense]["date(2i)"]
  	day = params[:expense]["date(3i)"]
  	date = "#{year}-#{month}-#{day}"
    params.require(:expense).permit(:date,:article, :price, :note)	# objeto params
  end

  def sort_column
    Expense.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
