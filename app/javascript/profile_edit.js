document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const regiForm = document.getElementById('edit_regi');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('profile_img_edit');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!regiForm) return null;
  console.log("profile.jsが読み込まれました");

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="user[avatar]"]');

  fileField.addEventListener('change', function(e) {
    const alreadyPreview = previewList.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
  
});