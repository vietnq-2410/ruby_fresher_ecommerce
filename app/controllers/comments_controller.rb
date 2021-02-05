class CommentsController < ApplicationController
  def create
    cmt = Comment.new(user_id: params[:user_id].to_i,
                   product_id: params[:product_id].to_i,
                      comment: params[:comment])
    cmt.save
    redirect_to product_path(params[:product_id])
  end
end
