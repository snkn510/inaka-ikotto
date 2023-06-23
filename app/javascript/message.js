window.addEventListener('load', () => {
  function scrollToEnd() {
    const messageDetails = document.querySelector('.line__contents');
    messageDetails.scrollTop = messageDetails.scrollHeight;
  }

  scrollToEnd();

  // メッセージ送信時にスクロール関数を呼び出すイベントリスナーの設定
  document.querySelector('.chat-form-group input[type="submit"]').addEventListener('click', scrollToEnd);
});
