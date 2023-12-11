class Public::SessionsController < ApplicationController
  before_action :user, only: [:create]

 def create
    user = User.find_by(email: params[:user][:email])
    
    if user && user.valid_password?(params[:user][:password])
      if user.is_active
        # ログイン処理
        # 例えば、sessionを使用してログイン状態を維持するなどの処理を行います
        session[:user_id] = user.id
        flash[:notice] = "ログインしました。"
        redirect_to root_path # ログイン後にリダイレクトするパスを指定してください
      else
        flash[:notice] = "アカウントは退会状態です。"
        redirect_to new_user_registration_path
      end
    else
      flash[:alert] = "メールアドレスまたはパスワードが正しくありません。"
      render :new # ログインフォームのビューを再度表示するなどの処理を行います
    end
  end
end
  
  
   private
  # アクティブであるかを判断するメソッド
  def user_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    user = user.find_by(email: params[:user][:email])
    # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return if user.nil?
    # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless user.valid_password?(params[:user][:password])
    # 【処理内容4】 アクティブでない会員に対して新規会員登録ページへ遷移する
    if user.is_active
      create
    else
      flash[:notice] = "アカウントは退会状態です。"
      redirect_to new_user_registration_path
    end
  end
end
