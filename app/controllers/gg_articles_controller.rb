class GgArticlesController < ApplicationController
  unloadable

  menu_item :config_gestion_garantias 
  before_filter :find_project_by_project_id, :authorize

  before_filter :set_article, only: [:edit, :update, :destroy]
  before_filter :set_file, only: [:new, :create, :edit, :update, :copy, :destroy]

  def new
    @article = GgArticle.new
    @contacts = []
    (0..2).each do |i|
      @contacts[i] = GgContact.new(:id => i) 
    end

    @ans = []
    (0...1).each do |i|
      @ans[i] = GgAns.new(:id => i) 
    end

    @count_ans = 1
  end

  def create
    @article = GgArticle.new params[:gg_article]

    if @article.save
      flash[:notice] = l(:"article.notice_create")
      redirect_to  edit_project_gg_file_path(@file, :project_id => @project)
    else
      flash[:error] = @article.get_error_message
      redirect_to action: 'new', :project_id => @project
    end
  end

  def edit
    @contacts = @article.gg_contacts.order("level ASC")
    (@contacts.count..2).each do |i|
      @contacts[i] = GgContact.new(:id => i)
    end

    @ans = @article.gg_ans
    @count_ans = @article.gg_ans.count

    # if Date.current >= @article.guarantee_start.to_date && Date.current <= @article.guarantee_end.to_date
    #   @message = {:type => "notice", :value => l(:"article.message_guarantee")}
    # else
    #   @message = {:type => "error", :value => l(:"article.message_guarantee_out")}
    # end
  end

  def update 
    if @article.update_attributes(params[:gg_article]) 
      flash[:notice] = l(:"article.notice_edit")
      redirect_to edit_project_gg_file_path(@file, :project_id => @project)
    else
      flash[:error] = @article.get_error_message
      redirect_to action: 'edit', :project_id => @project
    end
  end

  def copy
    old_article = GgArticle.find(params[:id])
    @article = old_article.dup
    @article.code_article = ""

    @contacts = old_article.gg_contacts.order("level ASC").map(&:dup)
    (@contacts.count..2).each do |i|
      @contacts[i] = GgContact.new(:id => i)
    end

    @ans = old_article.gg_ans.map(&:dup)
    @count_ans = @ans.count
  end

  def destroy
    if @article.destroy
      flash[:notice] = l(:"article.notice_destroy")
    else
      flash[:error] = l(:"article.error.action_destroy")
    end

    redirect_to edit_project_gg_file_path(@file, :project_id => @project)
  end

  private
  def set_article
    @article = GgArticle.find params[:id]
  end

  def set_file
    @file = GgFile.find params[:gg_file_id]
  end

end
