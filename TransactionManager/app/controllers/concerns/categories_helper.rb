# app/controllers/concerns/categories_helper.rb

module CategoriesHelper
  extend ActiveSupport::Concern

  private

  def categories
    Category.all.map { |category| serialize_category(category) }
  end

  def process_category(action)
    case action
    when 'save'
      @category.save
    when 'update'
      @category.update(category_params)
    when 'destroy'
      @category.destroy
    else
      render json: { error: 'Invalid action' }, status: :unprocessable_entity
    end
    if @category
      render json: categories
    else
      render json: @category.errors, status: :unprocessable_entity
    end

  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def serialize_category(category)
    {
      id: category.id,
      name: category.name
    }
  end
end
