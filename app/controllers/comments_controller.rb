class CommentsController < ApplicationController

  def create
  	@stamp = Stamp.find(params[:stamp_id])
  	@comment = @stamp.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  	if @comment.save
      respond_to do |format|
        format.html { redirect_to @stamp, notice: 'Stamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @stamp }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end
end