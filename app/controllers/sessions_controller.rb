class SessionsController < ApplicationController
  
  def new
  end

  # ログインページから送信された情報を受け取り、ログイン処理を行うアクション
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # ユーザーオブジェクトが存在し、かつパスワードが正しかったら
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      render 'new'
    end
  end

  # cookieに保存されたユーザーidを削除し、ログアウトを行うアクション
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
