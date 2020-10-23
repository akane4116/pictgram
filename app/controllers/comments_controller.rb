class CommentsController < ApplicationController
  
  def index
   @topic = Topic.find_by(:params[topic_id])
  end
  
  def new
    @comment = Comment.new
  end
    
 def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topic_path(params[:topic_id]), success: "コメントしました"
    end
 end
  
 private
  def comment_params
    params.permit(:comment_content, :user_id, :topic_id)#.require(:comment).permit(:comment_content, :user_id, :topic_id)
  end
end
