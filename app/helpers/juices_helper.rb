module JuicesHelper

  def juice_index_helper(params)
    if params[:user_id]
      @user = User.find(params[:user_id])
      @juices = @user.sorted
      @header = "Juices created by #{@user.name}"
    elsif params[:produce_id]
      @produce = Produce.find(params[:produce_id])
      @juices = Juice.juices_with_produce(params[:produce_id])
      @header = "Juices with #{@produce.name}"
    else
      @juices = Juice.sorted
      @header = "Fresh Juices"
    end
  end

  def juice_create_helper(params)
    @juice = Juice.new(juice_params(:name))
    if @juice.save
      @juice.user_id = current_user.id
      @juice.update_attributes(juice_params(:produce_attributes => [:name, :juice_produce_attributes => :quantity]))
      if @juice.save
        redirect_to @juice
      else
        flash[:alert] = "Please add ingredients"
        redirect_to new_juice_path(@juice)
      end
    else
      flash[:alert] = "Please name the juice and add ingredients"
      redirect_to new_juice_path(@juice)
    end
  end

end
