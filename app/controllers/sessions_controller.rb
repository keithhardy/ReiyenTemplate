class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
    # Retrieve user credentials from the login form
    email = params[:email]
    password = params[:password]

    # Find the user by email
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      # Authentication successful, store the user's ID in the session
      session[:user_id] = user.id

      # Redirect to the user's profile or any desired page
      redirect_to user_path(user)
    else
      # Authentication failed, display an error message
      flash.now[:error] = 'Invalid email/password combination.'
      render :new, status: :unprocessable_entity
    end
  end
  
  # DELETE /sessions
  def destroy
    # Clear the user ID from the session, effectively logging the user out
    session[:user_id] = nil

    # Redirect to the home page or any desired page after logout
    redirect_to new_session_path, notice: "Session was successfully destroyed.", status: :see_other
  end
end