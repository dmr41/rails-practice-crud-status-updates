class StatusupdatesController < ApplicationController

  def index
    @statusupdates = Statusupdate.all
  end

  def new
    @statusupdate = Statusupdate.new
  end

  def show
    @statusupdate = Statusupdate.find(params[:id])
  end

  def edit
    @statusupdate = Statusupdate.find(params[:id])
  end

  def create
    @statusupdate = Statusupdate.new(stats_params)
    if @statusupdate.save
      redirect_to statusupdates_path, notice: "Status Created!"
    else
      render :new
    end
  end

  def update
    @statusupdate = Statusupdate.find(params[:id])
    if @statusupdate.update(stats_params)
      redirect_to statusupdates_path, notice: "Status Updated!"
    else
      render :edit
    end
  end

  def destroy
    @statusupdate = Statusupdate.find(params[:id])
    @statusupdate.destroy
    redirect_to statusupdates_path, notice: "Status Deleted!"
  end


  private

    def stats_params
      params.require(:statusupdate).permit(:status, :user, :number)
    end



end
