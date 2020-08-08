<!-- ★ストロングパラメーターとは？

「Web上から入力されてきた値を制限することで、不正なパラメータを防ぐ仕組み」

使い方の例
def user_params

params.require(:user) 
　　　　　↑POSTで受け取る値のキー設定
      .permit(:name, :email, :password, :password_confirmation)
　　　　　↑許可して受け取る値を制限
end -->

★ApplicationControllerとApplicationHelperのコードをDryにする

ヘルパーはビューで使えるメソッドを定義することができる。
今回はコントローラーに同じメソッドが書いてあるので、コントローラにあるメソッドをベルパー側で使えるようにしたい。

今回はコントローラーに以下の一行を追加するだけで終了します。

helper_method :current_user, :logged_in?

<!-- rails代表的なエラーについての記事
https://h-nagisa.hatenablog.com/entry/2019/06/08/000000_1 -->


★非ログイン時に画像投稿ボタンを非表示にする際に、「メソッドが定義できていない」とエラーコード
エラーコード
https://gyazo.com/00a225482bb7b5477895357f6d66bcb6

回答
erbでメソッドを呼び出す場合は、helperに記載する必要があります。
同じメソッドをapplication_helperにきさいしましょう。


<!-- session_controllerのソースコード -->
```rb
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user redirect_to root_path,success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました"
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def session_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation)
  end
end
```

<!-- <session<new.html.erb> -->
```rb
<div class="users-new-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-offset-4 col-md-4 users-new-container">
        <h1 class="text-center text-white">Log in</h1>
        <%= form_for :session, url: login_path do |f| %>
          <div class="form-group">
            <%= f.label :email, class: "text-white" %>
            <%= f.text_field :email, class: "form-control" %>
          </div>
          <div class="form-group">
            <%= f.label :password, class: "text-white" %>
            <%= f.password_field :password, class: "form-control" %>
          </div>

          <%= f.submit "ログイン", class: "btn-block btn-white" %>
        <% end %>
      </div>
    </div>
  </div>
</div>
```

