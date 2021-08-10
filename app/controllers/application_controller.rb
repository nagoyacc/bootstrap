class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :login_required  #すべてのアクションに対してログイン画面に遷移するよう設定される
    private
    def login_required
        redirect_to new_session_path unless current_user
    end
end
