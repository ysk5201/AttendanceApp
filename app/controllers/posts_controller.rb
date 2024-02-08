class PostsController < ApplicationController
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

    private
    def post_params
        params.require(:post).permit(:employee_id, :status, :break_time)
    end
end
