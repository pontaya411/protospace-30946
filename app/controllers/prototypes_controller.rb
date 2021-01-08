class PrototypesController < ApplicationController

  before_action :authenticate_user!

  before_action :move_to_index, except: [:index, :show ]

  def index # indexアクションを定義した
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else   
      render :new
    end  
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end 

  def edit
  end
  
  def update
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end  
  end    

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path  
    end  
  end


  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

   def move_to_index
     unless user_signed_in?
       redirect_to action: :index
     end
   end

  # 下記解答より
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  
  def contributer_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end  

end