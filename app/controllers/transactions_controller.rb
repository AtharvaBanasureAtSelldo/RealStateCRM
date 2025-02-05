class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions=Transaction.all
  end

  def show
    @transaction=Transaction.find(params[:id])
  end

  def new
    @transaction=Transaction.new
  end

  def create
    @transaction=Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction,notice: "Transaction created successfully"
    else
      render :new
    end
  end
  

  def edit
  end

  def update
    if @transaction.update(appointment_params)
      redirect_to @transaction, notice: "Transactions updated Successfully"
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transaction_path, notice: "Transaction cancelled"
  end

  private
  def set_transaction
    @transaction=Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:status,:property_id, :client_id, :user_id)
  end
end
