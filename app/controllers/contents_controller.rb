class ContentsController < ApplicationController

  def create
    content = Content.create(title: content_params[:title], text: content_params[:text], user_id: current_user.id, product_id: content_params[:product_id])
    redirect_to "/products/#{content.product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @content = @product.contents.find(params[:product_id])
    @content.destroy
    redirect_to product_path(@product)
  end

private
  def content_params
    params.permit(:title, :text, :product_id)
  end

  def set_content
    @content = Content.find(params[:id])
  end

end
