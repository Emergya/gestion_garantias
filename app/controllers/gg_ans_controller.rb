class GgAnsController < ApplicationController
  unloadable

  def destroy
  	@ans = GgAns.find params[:id]

  	if @ans.destroy
      flash[:notice] = l(:"ans.notice_destroy")
    else
      flash[:error] = l(:"ans.error.action_destroy")
    end

    redirect_to edit_project_gg_file_gg_article_path(:id => params[:gg_article_id], :project_id => params[:project_id])
  end

 end