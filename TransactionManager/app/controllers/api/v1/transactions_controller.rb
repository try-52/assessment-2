class Api::V1::TransactionsController < ApplicationController
  include TransactionsHelper

  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    render json: serialized_transactions(Transaction.where(archived: false))
  end

  def show
    render json: serialize_transaction(@transaction)
  end

  def new
    render json: { categories: serialized_categories(Category.all) }
  end

  def create
    @transaction = Transaction.new(transaction_params)
    process_transaction('save')
  end

  def update
    process_transaction('update')
  end

  def destroy
    @transaction.update(archived: true)
    render json: serialized_transactions(Transaction.not_archived)
  end

  def archive
    render json: serialized_transactions(Transaction.archived)
  end

  def filter
    @transactions = Transaction.all
    filter_transactions
    render json: serialized_transactions(@transactions)
  end
end
