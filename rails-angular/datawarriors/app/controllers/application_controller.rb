class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    respond_to :json 
    protect_from_forgery with: :exception

    rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
        error = {}
        error[parameter_missing_exception.param] = ['parameter is required']
        response = { errors: [error] }
        respond_to do |format|
            format.json { render json: response, status: :unprocessable_entity }
        end
    end
end
