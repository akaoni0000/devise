class ApplicationController < ActionController::Base
    #before_action :authenticate_user!, except: [:start,:about] #ログインしなかったらどの画面も表示できない、ログインしなかったらログイン画面にレダイレクトする
    #before_action :authenticate_user!#ログインしなかったらどの画面も表示できない、ログインしなかったらログイン画面にレダイレクトする
    before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)  #ログインした後のパス
        login_after_top_path(current_user.id)
	end
    def after_sign_out_path_for(resource)
        top_path # ログアウト後に遷移するpathを設定
    end
	protected
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #gemのデバイスではnameカラムが入っていないのでnameでもログインできるようにこのように設定する　#signupでsigninでもつかえる
	end
end
