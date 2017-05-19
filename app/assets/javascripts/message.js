$(function() {
  function buildHTML(message) {
    var html =
    // コントローラーから出力されたdataはjbuilderを通ってキーバリューの関係になっている。dataがmessageに変わったので、バリューを取ってやるにはmessage.nameみたいにしないとならない。
    `<div id = "right-content__message">
      <div class = "right-content__chat-name">
        <p>
        ${message.name}
        </p>
       </div>
       <div class ="right-content__chat-time">
        <p>
        ${message.time}
        </p>
       </div>
       <div class = "right-content__chat-text">
        <p>
        ${message.body}
        </p>
      </div>`


    return html;
  }


  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    // #上記の#new_messageや下記の#message_bodyなどはform_forを使った時に自然にinputタグにつくID
    var form = $('#message_body');
    var message = new FormData($('#new_message').get(0));
        // e.preventDefaultによってform_forでページの遷移をキャンセル。データは保存されている。以後はjsを使った送信についての記述を書く。
        // $('#new_message').on〜で送信ボタンをおした時の処理をする。その後下のajaxでコントローラーのurlを指定して指定のアクションに飛ばす。そしてコントローラーで処理したdataが.done(function(data){に送られる。
    $.ajax({
      type: 'POST',
      url : location.href,
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      //  function buildHTML(message)がこれの仮引数
      $('.right-content__chat').append(html);
      form.val('');
      // form.val('')はformの値を空白にしている。
      $('.right-content__chat.right-content__chat').delay(30).animate({
        scrollTop: 20000}, 300, 'swing');
      // heightを%で決めているので動くのは.right-content__chatの間だけになった。だから親要素の70％の間しか動かなかった。
    })
    .fail(function(data){
      alert('送信シッパイ');
    });
  return false;
  });
});
