class Admin::LabelsController < Admin::BaseController
  def index
    @labels = Label.all.page(params[:page])
  end

  def new
    @label = Label.new
  end

  def edit
    @label = Label.find(params[:id])
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to admin_labels_path, notice: '创建成功'
    else
      render :new
    end
  end

  def update
    @label = Label.find(params[:id])
    @label.update!(label_params)
    redirect_to admin_labels_path, notice: '更新成功'
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy!
    redirect_to admin_labels_path, notice: '删除成功'
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end
end
