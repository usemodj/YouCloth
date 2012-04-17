require 'comment'
class Admin::CommentsController < ApplicationController
  before_filter :authenticate_user!  
  filter_resource_access
  layout "admin"
  # GET /admin/comments
  # GET /admin/comments.json
  def index
    @commentable = find_commentable
     #@comments = @commentable.comment_threads #.first.root.self_and_descendants
    @root_comments = @commentable.root_comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /admin/comments/1
  # GET /admin/comments/1.json
  def show
   @commentable = find_commentable
   @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_comment }
    end
  end

  # GET /admin/comments/new
  # GET /admin/comments/new.json
  def new
    @commentable = find_commentable
    @comment =  Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_comment }
    end
  end

  # GET /admin/comments/1/edit
  def edit
    @commentable = find_commentable
    @comment =  Comment.find(params[:id])
  end

  # POST /admin/comments
  # POST /admin/comments.json
  def create
    @commentable = find_commentable
    #@comment =  Comment.new(params[:comment])
    @comment = Comment.new(:user => current_user, :commentable =>@commentable, :body=>params[:comment][:body])

    respond_to do |format|
      if @comment.save
        @comment.commentable.update_attribute( :replies,@comment.commentable.comment_threads.size)
       
       format.html { redirect_to admin_post_comments_path(@commentable), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @admin_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/comments/1
  # PUT /admin/comments/1.json
  def update
    @commentable = find_commentable
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        @comment.commentable.touch

        format.html { redirect_to admin_post_comment_path(@commentable, @comment), notice: 'Comment was successfully created.' }
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    @comment.destroy
    @commentable.update_column( :replies,@commentable.comment_threads.size)

    respond_to do |format|
      format.html { redirect_to admin_post_comments_url(@commentable) }
      format.json { head :no_content }
    end
  end

  #POST /admin/posts/:post_id/comments/:comment_id/reply
  def reply
    @commentable = find_commentable('post')
    #@comment = find_commentable('comment')
    @comment = Comment.find(params[:id])
    @reply_comment = Comment.new( :user => current_user, :commentable =>@commentable, :body=>params[:comment][:body])
    #@reply_comment = Comment.new(:user => current_user,  :body=>params[:comment][:body])
     respond_to do |format|
        #@reply_comment.commentable.replies += 1
        @reply_comment.commentable.replies = @reply_comment.commentable.comment_threads.size
       if @reply_comment.save
            @reply_comment.move_to_child_of( @comment)
            #p @comment.to_text
            #@reply_comment.commentable.touch
            # update_attribute: updated_at/updated_on column is updated if that column is available.
            @reply_comment.commentable.update_attribute( :replies,@reply_comment.commentable.comment_threads.size)

            format.html { redirect_to admin_post_comments_path(@commentable), notice: 'Comment was successfully created.'}
        else
          format.html {render action: "new", notice: 'Comment was not created.'}
        end
     end
  end

   protected

  def find_commentable(name=nil)  
    if name.nil?
      params.each do |name, value|  
        if name =~ /(.+)_id$/  
          return $1.classify.constantize.find(value)  
        end  
      end
    else
      return name.classify.constantize.find(params[(name+'_id').to_sym])
    end
    nil  
  end 
 
end
