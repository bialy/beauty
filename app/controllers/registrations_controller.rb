class RegistrationsController < Devise::RegistrationsController
  def new
      super
    end

 
  def create
    #@search = Offer.search(params[:search])
    #@populars = Offer.find(:all, :order => 'visits_count desc limit 10')
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def update
    super
  end
end 