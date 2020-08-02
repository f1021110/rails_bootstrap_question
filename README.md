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



