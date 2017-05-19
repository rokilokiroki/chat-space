$(function() {
  function appendHTML(user) {
    var html =
    `<li class = "chat-group-user__list">
      <p id='chat-group-user__name'>${user.name}</p>
      <input type="hidden" name="group[user_ids][]" value=${user.id}>
      <div class="chat-group-user__btn">追加</div>
    </li>`
    return html;
  }
  function deleteHTML(userName, userID) {
    var html =
    `<li class = "chat-group-user__list">
      <p id='chat-group-user__delete-name'>${userName}</p>
      <input type="hidden" class="aaa" name="group[user_ids][]" value=${userID} >
      <div class="chat-group-delete__btn">削除</div>
    </li>`
    return html;
  };

  $('#user-search-field').on('keyup', function() {
    // preventdefaultをしないと送信されてしまう。ここでは送信とかそういうことはしていないからpreventdefaultはいらない。
    var form = $('#user-search-field').val();
    $.ajax({
        type: 'GET',
        url : '/groups/search',
        data: { name: form },
        // data: { name: $(this).val() }でもいい。$(this)は$('#user-search-field')の事。
        // data: { name: form }は@users = User.where('name LIKE(?)', "%#{params[:name]}%")がparamsでとってきてるのでdata: { name: form }はハッシュの形{key: value}にしないと駄目だった
        dataType: 'json'
    })
    .done(function(data){
      var html = ('');
      $.each(data.users, function(i, user){
        html += appendHTML(user);
      })
      // iは回した数
      $('#user-search-result').html(html);
      // appendで駄目な理由はkeyupに関係していた。
    });
  });
  $('#user-search-result').on('click', '.chat-group-user__btn',function(){
    var text = $(this).siblings("p").text();
    var userID = $(this).siblings("input").val();
    // 引数は二個渡せた。rubyを思い出せ。メソッド名(変数)だ。
    var user = deleteHTML(text, userID);
    $('.js-users').append(user);
    console.log("hoge");
    });

  $('.js-users').on('click', '.chat-group-delete__btn',function(){
    var destroy = $(this).parent("li");
    $(destroy).remove();
  });
});
