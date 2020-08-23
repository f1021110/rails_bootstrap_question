class FavoritesController < ApplicationController
    def index
        @topics = Topic.all.includes(:favorite_users)

        @favorite_topics = current_user.favorite_topics.count
        
        # favorite = Favorite.new
        # favorite.user_id = current_user.id
        # favorite.topic_id = params[:topic_id]
        #ここでidの数を取得
        # @favorite_count = favorite.topic_id.count
        # Favorite.where(topic_id: topic.id)
        # @favorite_count = topics_users.count
    end

    def create
        favorite = Favorite.new
        favorite.user_id = current_user.id
        favorite.topic_id = params[:topic_id]

        if favorite.save
            redirect_to topics_path, success: 'お気に入りに登録しました'
        else
            redirect_to topics_path, danger: '登録に失敗しました'
        end
    end

    def destroy
        favorite = Favorite.new
        favorite.user_id = current_user.id
        favorite.topic_id = params[:topic_id]

        if favorite.destroy
            redirect_to topics_path, success: 'お気に入りに登録しました'
        else
            redirect_to topics_path, danger: '登録に失敗しました'
        end  
    end


    # def show
    #     @post = Post.find_by(id: params[:id])
    #     @user = @post.user
    #         # 変数@likes_countを定義
    #     @favorite_count = Like.where(post_id: @post.id).count
    # end
end
