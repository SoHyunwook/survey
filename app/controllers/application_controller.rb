# class ApplicationController < ActionController::Base
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   #protect_from_forgery with: :exception
# end


class ApplicationController < ActionController::Base
    # def current_user
    #   @current_user ||= User.find(session[:user_id])
    # end

    def can_administer?
      true
      # current_user.try(:admin?)
    end
    
    protect_from_forgery
    # rowsPerPage 한 페이지당 표시될 게시물 수
    # 모든 컨트롤러에서 사용가능하게 여기에 정의한다.
    def rowsPerPage
        @rowsPerPage ||= 5
    end
end