import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    console.log(data)
    const userComment = `<li class="comments-list">
                    <a href="/users/${(data.content.user_id)}">${data.user.nickname}</a>
                    ${data.content.text}
                    <p class="comment-created-at">${data.time}</p>
                  </li>`;
    const comments = document.getElementById('commentid');
    const newComment = document.getElementById('comment_text');
    commentid.insertAdjacentHTML('beforeend', userComment);
    newComment.value='';
    }
});
