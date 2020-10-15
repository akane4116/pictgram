class CommentsController < ApplicationController
  
  def index
   @commnent = Comment.new
   @topic = Topic.find_by(:params[topic_id])
  end
  
  def new
    @comment = Comment.new
  end
    
 def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topic_path(params[:topic_id]), success: "コメントしました"
    end
 end
  
 private
  def comment_params
    params.require(:comment).permit(:comment_content, :user_id, :topic_id)
  end
end
