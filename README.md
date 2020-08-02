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








