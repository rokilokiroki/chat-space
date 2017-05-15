$(function() {
  // メッセージ送信情報を追加していく関数
  function buildHTML(message) {
    var html = $(
    '<div class ="right-content__chat-name">' +
    '<p>' +
    `${message.name}` +
    '</p>' +
    '</div>' +
    '<div class = "right-content__chat-time">' +
    '<p>' +
    `${message.created_at}` +
    '</p>' +
    '<div class = "right-content__chat-text">' +
    '<p>' +
    `${message.body}` +
    '</p>' +
    '</div>'
    )
    console.log("eeeee");
    return html;
  }


  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    // #上記の#new_messageや下記の#message_bodyなどはform_forを使った時に自然にinputタグにつくID
    var form = $('#message_body');
    var message = form.val();
        // e.preventDefaultによってform_forでページの遷移をキャンセル。データは保存されている。以後はjsを使った送信についての記述を書く。

    $.ajax({
      type: 'POST',
      url : "./messages",
      data: {
      message: {
          body: message
        }
      },
      datatype: 'json'
    })
    .done(function(data){
      console.log(data);
      var html = buildHTML(data);
      //  function buildHTML(message)がこれの仮引数
      $('.right-content__chat').append(html);
      form.val('');
    })
    .fail(function(){
      alert('送信シッパイ');
    });
  });
});
