class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = book.id
    @comment.save
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = current_user.book_comments.find_by(id: params[:id], book_id: @book.id)
    book_comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
