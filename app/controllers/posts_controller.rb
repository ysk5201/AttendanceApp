class PostsController < ApplicationController
    # before_action :authenticate_user!, except: [:index] # ログインが必要なアクションに対して認証
    # before_action :authorize_admin, only: [:new, :index_admin] # 管理者のみがアクセス可能なアクションに対して認可
    # indexにアクセスが来た時どうするのか
    def index
        # Post modelからDBにアクセス可能にする
        # @postsというインスタンス変数に格納
        @posts = Post.all
        # 最新の登録が一番上になるように並べ替え
        @posts = Post.order(created_at: :desc)
    end

    # 新しい投稿のフォーム用のコントローラー設定
    # Viewsのnew.html.erbに連携
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            # データの保存に成功した場合の処理
            # /postsに移動
            if params[:post][:status] == "出勤"
                flash[:success] = "出勤登録が完了しました"
            elsif params[:post][:status] == "退勤"
                flash[:success] = "退勤登録が完了しました。お仕事お疲れさまでした。"
            end
            redirect_to posts_path
        else
            # バリデーションに失敗した場合の処理
            render 'new'
        end
    end

    def all_posts
        @posts = Post.order(created_at: :desc)
    end

    private

    def post_params
        params.require(:post).permit(:employee_id, :status, :break_time)
    end

    # def authorize_admin
    #     redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.admin?
    # end
end
