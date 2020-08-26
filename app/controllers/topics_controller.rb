class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    # @favorite_topics = current_user.favorite_topics.count

  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました#{@topic.errors.full_messages}"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image,:description)
  end

  # def login_check
  #   unless users_new_path
  #     flash[:alert] = "ログインしてください"
  #     redirect_to root_path
  #   end
  # end
 

end
