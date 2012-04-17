class CommentsController < ApplicationController
  before_filter :authenticate_user!  
  # filter_resource_access :additional_collection => { :reply => :read }
  #filter_resource_access 

  # GET /posts/:post_id/comments
  # GET /posts/:post_id/comments.json
  def index
    #@comments = Comment.all
    @commentable = find_commentable
    #p @commentable.root_comments
    #@comments = @commentable.comment_threads #.first.root.self_and_descendants
    @root_comments = @commentable.root_comments
    #@commentable.increment!(:views)
    @commentable.class.increment_counter(:views, @commentable.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /posts/:post_id/comments/:id
  def show
    @commentable = find_commentable
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erbk the last migration, for example if you made a mistake in it and wish to correct it. Rather than tracking down the version number associated with
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    #@post = find_commentable
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    #@comment = Comment.new(params[:comment])
    @commentable = find_commentable
    #@comment = @commentable.comments.build( params[:comment])
    @comment = Comment.new(:user => current_user, :commentable =>@commentable, :body=>params[:comment][:body])
    respond_to do |format|
       if @comment.save
        #@comment.commentable.replies += 1
        # @comment.commentable.touch
        @comment.commentable.update_attribute( :replies,@comment.commentable.comment_threads.size)
       
        format.html { redirect_to :id => nil, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new", notice: 'Comment was not created.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  #POST /posts/:post_id/comments/:comment_id/reply
  def reply
    @commentable = find_commentable('post')
    @comment = find_commentable('comment')
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

            format.html { redirect_to post_comments_path(@commentable), notice: 'Comment was successfully created.'}
        else
          format.html {render action: "new", notice: 'Comment was not created.'}
        end
     end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @commentable = find_commentable
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        @comment.commentable.touch
        
        format.html { redirect_to post_comments_path(@commentable), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    @comment.destroy
    #@commentable.replies -= 1
    @commentable.update_column( :replies,@commentable.comment_threads.size)
    respond_to do |format|
      #format.html { redirect_to comments_url }
      format.html { redirect_to post_comments_path(@commentable) }
      format.json { head :no_content }
    end
  end

  protected

  def find_commentable(name=nil, user = current_user)  
    if name.nil?
      params.each do |name, value|  
        if name =~ /(.+)_id$/  
          return $1.classify.constantize.where("user_id = ?", user.id).find(value)  
        end  
      end
    else
      return name.classify.constantize.where("user_id = ?", user.id).find(params[(name+'_id').to_sym])
    end
    nil  
  end 

  # def find_commentable(name)
  #     return name.classify.constantize.find(params[(name+'_id').to_sym])
  # end

end
