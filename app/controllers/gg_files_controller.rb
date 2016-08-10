class GgFilesController < ApplicationController
  unloadable

  menu_item :config_gestion_garantias 
  before_filter :find_project_by_project_id, :authorize
  before_filter :set_file, only: [:edit, :update, :destroy]

  def index
    limit = params[:per_page].present? ? params[:per_page].to_i : 29
    page_num = params[:page].present? ? params[:page].to_i : 0
    offset = params[:page].present? ? ((page_num-1) * limit ) : 0
  	@files = GgFile.order("identity_file ASC").offset(offset).limit(limit)
    @files_count = GgFile.order("identity_file ASC").count
    @files_pages = Paginator.new @files_count, limit, params[:page]
  end

  def new
  	@file = GgFile.new
  end

  def create
  	@file = GgFile.new params["gg_file"]

  	if @file.save
      flash[:notice] = l(:"file.notice_create")
  	  redirect_to project_gg_home_path(:project_id => @project)
    else
      flash[:error] = @file.get_error_message
      redirect_to action: 'new', :project_id => @project
    end
  end

  def edit
    limit = params[:per_page].present? ? params[:per_page].to_i : 29
    page_num = params[:page].present? ? params[:page].to_i : 0
    offset = params[:page].present? ? ((page_num-1) * limit ) : 0
    @articles = @file.gg_articles.order("code_article ASC").offset(offset).limit(limit)
    @articles_count = @file.gg_articles.order("code_article ASC").count
    @articles_pages = Paginator.new @articles_count, limit, params[:page]
  end

  def update 
    if @file.update_attributes(params[:gg_file]) 
      flash[:notice] = l(:"file.notice_edit")
      redirect_to project_gg_home_path(:project_id => @project)
    else
      flash[:error] = @file.get_error_message
      redirect_to action: 'edit', :project_id => @project
    end
  end

  def destroy
    if @file.destroy
      flash[:notice] = l(:"file.notice_destroy")
    else
      flash[:error] = l(:"file.error.action_destroy")
    end

    redirect_to project_gg_home_path(:project_id => @project)
  end

  private
  def set_file
    @file = GgFile.find params[:id]
  end
end
