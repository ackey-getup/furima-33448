import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const comments = document.getElementById('commentid');
    const newComment = document.getElementById('comment_text');
    commentid.insertAdjacentHTML('beforeend', html);
    newComment.value='';
    }
});
