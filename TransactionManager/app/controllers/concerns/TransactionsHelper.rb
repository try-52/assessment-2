# app/controllers/concerns/transactions_helper.rb

module TransactionsHelper
  def filter_transactions
    @transactions = @transactions.by_category(params[:category]) if params[:category].present?
    @transactions = @transactions.by_date_range(params[:start_date], params[:end_date]) if params[:start_date].present? && params[:end_date].present?
    @transactions = @transactions.by_period(params[:period]) if params[:period].present?
    @transactions = @transactions.by_title(params[:title]) if params[:title].present?
    @transactions = @transactions.by_bank_name(params[:bank_name]) if params[:bank_name].present?
  end

  def serialized_transactions(transactions)
    transactions.map do |transaction|
      {
        id: transaction.id,
        archived: transaction.archived,
        title: transaction.title,
        description: transaction.description,
        category: transaction.category.name,
        amount: transaction.amount,
        bank_name: transaction.bank_name,
        created_at: transaction.created_at,
        updated_at: transaction.updated_at
      }
    end
  end

  def process_transaction(action)
    @transaction.send(action) if action == 'save'
    @transaction.send(action, transaction_params) if action == 'update'
    if @transaction
      render json: serialized_transactions(Transaction.all)
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def serialized_categories(categories)
    categories.map { |category| { id: category.id, name: category.name } }
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:title, :description, :category_id, :amount, :bank_name, :archived)
  end
end
