class CommentsController < ApplicationController
  
  def index
   @topic = Topic.find_by(:params[topic_id])
  end
  
  def new
    @comment = Comment.new
    @topic = Topic.find_by(id: params[:topic_id])
  end
    
    
 def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    @comment.content = params[:comment][:content]
    
    binding.pry
    if @comment.save
      flash[:success] = 'コメントしました'
      redirect_to topics_path
    end
 end
  
  def destroy
  end
  
 private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
