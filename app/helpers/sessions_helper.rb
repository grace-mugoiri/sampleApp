module SessionsHelper
    # Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    # returns current logged_in user if any exists
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # returns true if the user is logge_id and otherwise
    def logged_in?
        !current_user.nil?
    end

    # logs out the current user
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
