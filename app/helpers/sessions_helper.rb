module SessionsHelper
  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  # 現在ログイン中のユーザを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  # ユーザがログインしていればtrueを、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  # 現在のユーザをログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
